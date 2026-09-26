#!/usr/bin/env bash
# Claude Code status line: [account] project  branch*  ▮▮▮▯▯ 62%  Model
input=$(cat)
j() { jq -r "$1 // empty" <<<"$input" 2>/dev/null; }

model=$(j '.model.display_name')
dir=$(j '.workspace.current_dir'); [ -n "$dir" ] || dir=$(j '.cwd'); [ -n "$dir" ] || dir=$PWD
pct=$(j '.context_window.used_percentage')

cd "$dir" 2>/dev/null || true
if git rev-parse --is-inside-work-tree &>/dev/null; then
  proj=$(basename "$(git rev-parse --show-toplevel)")
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  [ -n "$(git status --porcelain 2>/dev/null | head -1)" ] && branch="${branch}*"
  acct=$(git config user.name 2>/dev/null)
else
  proj=$(basename "$dir"); branch=""; acct=""
fi

# colours
R=$'\e[0m'; DIM=$'\e[2m'; B=$'\e[1m'
CY=$'\e[36m'; YE=$'\e[33m'; MA=$'\e[35m'; GR=$'\e[32m'; RD=$'\e[31m'

out=""
[ -n "$acct" ]   && out+="${MA}[${acct}]${R} "
out+="${B}${CY}${proj}${R}"
[ -n "$branch" ] && out+="  ${YE}${branch}${R}"

if [ -n "$pct" ]; then
  p=${pct%.*}
  filled=$(( (p + 10) / 20 )); [ $filled -gt 5 ] && filled=5
  bar=""; for ((i=0;i<5;i++)); do [ $i -lt $filled ] && bar+="▮" || bar+="▯"; done
  if   [ "$p" -ge 80 ]; then c=$RD; elif [ "$p" -ge 60 ]; then c=$YE; else c=$GR; fi
  out+="  ${c}${bar} ${p}%${R}"
fi
[ -n "$model" ] && out+="  ${DIM}${model}${R}"
printf '%s' "$out"
