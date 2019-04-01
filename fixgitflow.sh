#!/usr/bin/env zsh
find /usr/local -name 'gitflow-common' -exec sed -i '' 's:git rev-parse --git-dir >/dev/null 2>&1:git rev-parse --git-dir 2>/dev/null:' {} \;

