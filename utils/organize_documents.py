import os
import shutil
import hashlib
from pathlib import Path
from datetime import datetime
import sys

BASE = Path.home() / "Documents"
CURRENT_YEAR = datetime.now().year
DRY_RUN = "--run" not in sys.argv

SKIP_DIRS = {"dev", ".dotfiles", "dotfiles", "Random", "Archive", "_Duplicates"}
SECTION_DIRS = {"Personal", "Work"}
DESIGN_DIR = BASE / "Design"
TYPE_FOLDER_NAMES = {"Documents", "Media", "Inbox", "Archive", "Assets", "Exports",
                     "Docs", "PDF", "Spreadsheets", "Slides", "Archives", "Code", "Other",
                     "Images", "Videos", "Audio"}

TYPE_MAP = {
    "Documents/Docs":         {".doc", ".docx", ".pages", ".rtf", ".txt", ".odt", ".md"},
    "Documents/PDF":          {".pdf"},
    "Documents/Spreadsheets": {".xls", ".xlsx", ".numbers", ".csv"},
    "Documents/Slides":       {".ppt", ".pptx", ".key"},
    "Documents/Archives":     {".zip", ".rar", ".tar", ".gz", ".7z", ".bz2"},
    "Documents/Code":         {".py", ".js", ".ts", ".html", ".css", ".sh", ".json",
                               ".yaml", ".yml", ".xml", ".rb", ".go", ".rs", ".php"},
    "Media/Images":           {".jpg", ".jpeg", ".png", ".gif", ".webp", ".heic",
                               ".tiff", ".bmp", ".svg", ".ai", ".psd", ".sketch", ".fig"},
    "Media/Videos":           {".mp4", ".mov", ".avi", ".mkv", ".m4v", ".wmv", ".flv"},
    "Media/Audio":            {".mp3", ".m4a", ".wav", ".flac", ".aac", ".ogg"},
}

DESIGN_TYPE_MAP = {
    "Assets":  {".jpg", ".jpeg", ".png", ".gif", ".webp", ".heic", ".tiff", ".bmp",
                ".svg", ".ai", ".psd", ".sketch", ".fig", ".mp3", ".m4a", ".wav",
                ".flac", ".aac", ".ogg", ".mp4", ".mov", ".avi", ".mkv"},
    "Exports": {".pdf", ".zip", ".rar", ".tar", ".gz", ".7z"},
}

JUNK_FILES = {".DS_Store", "Thumbs.db", "desktop.ini", ".localized"}
JUNK_PATTERNS = ("._",)

DUPLICATES_DIR = BASE / "_Duplicates"
hash_index = {}

def get_hash(filepath):
    h = hashlib.md5()
    try:
        with open(filepath, "rb") as f:
            while chunk := f.read(8192):
                h.update(chunk)
        return h.hexdigest()
    except:
        return None

def get_mtime_year_month(filepath):
    try:
        dt = datetime.fromtimestamp(os.path.getmtime(filepath))
        return dt.year, dt.month
    except:
        return None, None

def get_type(ext, design=False):
    ext = ext.lower()
    if design:
        for folder, exts in DESIGN_TYPE_MAP.items():
            if ext in exts:
                return folder
        return "Assets"
    for folder, exts in TYPE_MAP.items():
        if ext in exts:
            return folder
    return "Documents/Other"

def is_skipped(path):
    try:
        rel = path.relative_to(BASE)
        return any(part in SKIP_DIRS for part in rel.parts)
    except:
        return True

def is_junk(filename):
    return (filename in JUNK_FILES or
            any(filename.startswith(p) for p in JUNK_PATTERNS) or
            filename.endswith(".localized"))

def do_move(src, dest_dir, label=""):
    dest_dir.mkdir(parents=True, exist_ok=True)
    dest = dest_dir / src.name
    if dest.exists():
        stem, suffix = src.stem, src.suffix
        dest = dest_dir / f"{stem}_conflict{suffix}"
    if DRY_RUN:
        print(f"  [DRY RUN] {label}{src.name} -> .../{dest_dir.relative_to(BASE)}/")
        return
    shutil.move(str(src), str(dest))
    print(f"  {label}{src.name} -> .../{dest_dir.relative_to(BASE)}/")

def do_delete(fp):
    if DRY_RUN:
        print(f"  [DRY RUN] JUNK delete: {fp.name}")
        return
    fp.unlink(missing_ok=True)
    print(f"  JUNK deleted: {fp.name}")

def handle_file(fp, section_dir, design=False):
    if is_junk(fp.name):
        do_delete(fp)
        return
    h = get_hash(fp)
    if h:
        if h in hash_index:
            do_move(fp, DUPLICATES_DIR, label="DUP ")
            return
        hash_index[h] = str(fp)
    year, month = get_mtime_year_month(fp)
    if year and year < CURRENT_YEAR:
        archive_dir = section_dir / "Archive" / str(year) / f"{month:02d}"
        do_move(fp, archive_dir, label="ARCHIVE ")
        return
    type_subpath = get_type(fp.suffix, design=design)
    do_move(fp, section_dir / type_subpath)

print(f"\n{'='*50}")
print(f"organize-docs {'(DRY RUN)' if DRY_RUN else '(LIVE RUN)'}")
print(f"{'='*50}")

# PHASE 1 - Index already-organized files
print(f"\n=== Phase 1: Building hash index from organized files ===")
for section in SECTION_DIRS:
    section_dir = BASE / section
    if not section_dir.exists():
        continue
    for root, dirs, files in os.walk(section_dir):
        root = Path(root)
        if root.name == "Inbox":
            dirs.clear()
            continue
        for f in files:
            fp = root / f
            h = get_hash(fp)
            if h and h not in hash_index:
                hash_index[h] = str(fp)

for root, dirs, files in os.walk(DESIGN_DIR):
    root = Path(root)
    if root.name == "Inbox":
        dirs.clear()
        continue
    for f in files:
        fp = root / f
        h = get_hash(fp)
        if h and h not in hash_index:
            hash_index[h] = str(fp)

print(f"  {len(hash_index)} files indexed")

# PHASE 2 - Process Inbox folders (including subfolders)
print(f"\n=== Phase 2: Process Inbox folders ===")
for section in SECTION_DIRS:
    inbox = BASE / section / "Inbox"
    if not inbox.exists():
        continue
    # rglob recurses into all subfolders
    files = [f for f in inbox.rglob("*") if f.is_file()]
    if not files:
        continue
    print(f"\n  [{section}/Inbox] {len(files)} files")
    for f in files:
        handle_file(f, BASE / section)

design_inbox = DESIGN_DIR / "Inbox"
if design_inbox.exists():
    files = [f for f in design_inbox.rglob("*") if f.is_file()]
    if files:
        print(f"\n  [Design/Inbox] {len(files)} files")
        for f in files:
            handle_file(f, DESIGN_DIR, design=True)

# PHASE 3 - Organize loose files in section folders
print(f"\n=== Phase 3: Organize loose files by type ===")
for section in SECTION_DIRS:
    section_dir = BASE / section
    if not section_dir.exists():
        continue
    for root, dirs, files in os.walk(section_dir):
        root = Path(root)
        if root.name in TYPE_FOLDER_NAMES:
            dirs.clear()
            continue
        if is_skipped(root):
            dirs.clear()
            continue
        for f in files:
            fp = root / f
            handle_file(fp, section_dir)

for root, dirs, files in os.walk(DESIGN_DIR):
    root = Path(root)
    if root.name in TYPE_FOLDER_NAMES:
        dirs.clear()
        continue
    if is_skipped(root):
        dirs.clear()
        continue
    for f in files:
        fp = root / f
        handle_file(fp, DESIGN_DIR, design=True)

print(f"\n=== Done {'(DRY RUN - no changes made)' if DRY_RUN else '(LIVE - changes applied)'} ===")
