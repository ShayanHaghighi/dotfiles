#!/usr/bin/env bash

MAX_LEN=20

format_text() {
  local text="$1"
  local maxlen="$2"

  local textlen=${#text}

  if (( textlen > maxlen )); then
    echo "...${text: -maxlen+3}"
  elif (( textlen < maxlen )); then
    printf "%$((maxlen))s" "$text"
  else
    echo "$text"
  fi
}

get_dirname() {
  local current_path="$1"

  if git -C "$current_path" rev-parse --is-inside-work-tree &>/dev/null; then
    inside=$(git -C "$current_path" rev-parse --show-prefix)
    dirname=$(basename $(git -C $current_path rev-parse --show-toplevel))
    echo "$dirname/$inside"
  else
    parent=$(basename "$(dirname "$current_path")")
    current=$(basename "$current_path")
    echo "$parent/$current"
  fi
}

pane_path="$1"

output=$(get_dirname "$pane_path")
echo "$(format_text $output $MAX_LEN)"

