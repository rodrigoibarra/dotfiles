#!/usr/bin/env bash
# nvim config rebuild — cleanup + scaffold
# Run from the root of your dotfiles repo: bash nvim-rebuild.sh
# ─────────────────────────────────────────────────────────────────────────────

set -e

NVIM_LUA="nvim/.config/nvim/lua/bunnz"
PLUGINS="$NVIM_LUA/plugins"
CORE="$NVIM_LUA/core"

echo "── Backup lazy-lock.json ────────────────────────────────────────────────"
cp nvim/.config/nvim/lazy-lock.json nvim/.config/nvim/lazy-lock.json.bak
echo "  ✓ lazy-lock.json.bak created"

# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo "── Deleting removed plugins ─────────────────────────────────────────────"

files_to_delete=(
  "$PLUGINS/bufferline.lua"
  "$PLUGINS/dressing.lua"
  "$PLUGINS/lualine.lua"
  "$PLUGINS/mini.completions.lua"
  "$PLUGINS/nvim-autopairs.lua"
  "$PLUGINS/nvim-html-css.lua"
  "$PLUGINS/telescope.lua"
)

for f in "${files_to_delete[@]}"; do
  if [ -f "$f" ]; then
    rm "$f"
    echo "  ✓ deleted $f"
  else
    echo "  ⚠ not found (skipping): $f"
  fi
done

# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo "── Consolidating mini modules ───────────────────────────────────────────"

mini_to_remove=(
  "$PLUGINS/mini.files.lua"
  "$PLUGINS/mini.indentscope.lua"
  "$PLUGINS/mini.notify.lua"
  "$PLUGINS/mini.surround.lua"
)

for f in "${mini_to_remove[@]}"; do
  if [ -f "$f" ]; then
    rm "$f"
    echo "  ✓ consolidated + deleted $f"
  else
    echo "  ⚠ not found (skipping): $f"
  fi
done

# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo "── Creating new plugin stubs ────────────────────────────────────────────"

new_files=(
  "$PLUGINS/mini.lua"
  "$PLUGINS/blink.lua"
  "$PLUGINS/fzf-lua.lua"
  "$PLUGINS/dap.lua"
  "$PLUGINS/git.lua"
)

for f in "${new_files[@]}"; do
  if [ ! -f "$f" ]; then
    touch "$f"
    echo "  ✓ created $f"
  else
    echo "  ⚠ already exists (skipping): $f"
  fi
done

# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo "── Verifying final plugins/ structure ───────────────────────────────────"

expected_files=(
  "alpha.lua"
  "blink.lua"
  "colorscheme.lua"
  "dap.lua"
  "filetype.lua"
  "formatting.lua"
  "fzf-lua.lua"
  "git.lua"
  "init.lua"
  "linting.lua"
  "lsp.lua"
  "markdown.lua"
  "mini.lua"
  "treesitter.lua"
  "twilight.lua"
  "which-key.lua"
)

echo ""
all_ok=true
for f in "${expected_files[@]}"; do
  if [ -f "$PLUGINS/$f" ]; then
    echo "  ✓ $f"
  else
    echo "  ✗ MISSING: $f"
    all_ok=false
  fi
done

echo ""
if [ "$all_ok" = true ]; then
  echo "── Scaffold complete ─────────────────────────────────────────────────────"
  echo ""
  echo "  Next steps:"
  echo "  1. Run: brew bundle --file=Brewfile"
  echo "  2. Run: pnpm add -g @astrojs/language-server emmet-language-server"
  echo "  3. Open nvim — lazy.nvim will bootstrap and install plugins"
  echo ""
else
  echo "── Scaffold completed with warnings — check missing files above ──────────"
  echo ""
fi
