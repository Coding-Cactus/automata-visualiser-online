#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"


ver="9.6.7"
printf "\x1B[1m[mkallbuildscripts] === Creating for GHC %s ===\x1B[0m\n" "$ver"
./mkbuildscript.sh "$ver"
