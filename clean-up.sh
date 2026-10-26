#!/usr/bin/env bash
# Run with bash:  bash cleanup-taps.sh        (dry run)
#                 bash cleanup-taps.sh --run  (apply)
if [ -z "${BASH_VERSION:-}" ]; then echo "Run with bash" >&2; exit 1; fi
set -uo pipefail
RUN=0; [[ "${1:-}" == "--run" ]] && RUN=1
run() { if (( RUN )); then "$@"; else echo "    [dry-run] $*"; fi; }

FORMULAE=(numi-cli borders)
TAPS=(nikolaeu/numi asmvik/formulae shinokada/consize)

echo "── Formulae"
for f in "${FORMULAE[@]}"; do
  if brew list --formula --full-name 2>/dev/null | grep -qE "(^|/)$f$"; then
    echo "  → uninstalling $f"; run brew uninstall --formula "$f"
  else
    echo "  – $f not installed"
  fi
done

echo "── Anything else installed from the taps being removed"
for t in "${TAPS[@]}"; do
  brew list --formula --full-name 2>/dev/null | grep "^$t/" | while read -r f; do
    echo "  → uninstalling $f (from $t)"; run brew uninstall --formula "$f"
  done
done

echo "── Taps"
for t in "${TAPS[@]}"; do
  if brew tap | grep -qx "$t"; then
    echo "  → untapping $t"; run brew untap "$t"
  else
    echo "  – $t not tapped"
  fi
done

(( RUN )) || echo -e "\nDry run only. Re-run with --run to apply."
