#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skills_root=$(CDPATH= cd -- "$repo_root/.." && pwd)

for skill in work-audit work-clean work-help work-init work-plan work-status; do
  source_dir="$repo_root/skills/$skill"
  target_dir="$skills_root/$skill"

  if [ ! -f "$source_dir/SKILL.md" ]; then
    printf 'Missing canonical skill: %s\n' "$source_dir" >&2
    exit 1
  fi

  mkdir -p "$target_dir"
  rsync -a --delete "$source_dir/" "$target_dir/"
done

printf 'Synced Work skills from %s/skills to %s\n' "$repo_root" "$skills_root"
