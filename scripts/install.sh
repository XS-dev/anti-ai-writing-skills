#!/usr/bin/env bash
set -euo pipefail

TARGET="auto"
SKILL="all"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target|-t) TARGET="$2"; shift 2 ;;
    --skill|-s)  SKILL="$2"; shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$(cd "$SCRIPT_DIR/../skills" && pwd)"

resolve_dir() {
  case "$1" in
    antigravity) echo "$HOME/.gemini/config/skills" ;;
    magpie)      echo "$HOME/.config/magpie/library/skills" ;;
    dsh)         echo "$HOME/.dsh/skills" ;;
    claude)      echo "$HOME/.claude/skills" ;;
    codex)       echo "$HOME/.codex/skills" ;;
    *) echo "Unsupported target: $1" >&2; exit 1 ;;
  esac
}

TARGETS=()
if [[ "$TARGET" == "all" ]]; then
  TARGETS=(antigravity magpie dsh claude codex)
elif [[ "$TARGET" == "auto" ]]; then
  for k in antigravity magpie dsh; do
    d="$(resolve_dir "$k")"
    if [[ -d "$(dirname "$d")" ]]; then
      TARGETS+=("$k")
    fi
  done
  [[ ${#TARGETS[@]} -eq 0 ]] && TARGETS=(antigravity)
else
  TARGETS=("$TARGET")
fi

if [[ "$SKILL" == "all" ]]; then
  SKILL_PATHS=("$SKILLS_SRC"/*)
else
  if [[ ! -d "$SKILLS_SRC/$SKILL" ]]; then
    echo "Skill '$SKILL' not found under $SKILLS_SRC" >&2
    exit 1
  fi
  SKILL_PATHS=("$SKILLS_SRC/$SKILL")
fi

for t in "${TARGETS[@]}"; do
  dest_root="$(resolve_dir "$t")"
  mkdir -p "$dest_root"
  for sp in "${SKILL_PATHS[@]}"; do
    [[ -d "$sp" ]] || continue
    sname="$(basename "$sp")"
    rm -rf "$dest_root/$sname"
    cp -R "$sp" "$dest_root/$sname"
    echo "[OK] Installed $sname -> $dest_root/$sname"
  done
done
