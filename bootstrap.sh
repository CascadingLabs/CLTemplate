#!/usr/bin/env bash
# Bootstrap a new CL repo from this template.
#
# Usage:  ./bootstrap.sh <NewProjectName> "<Project tagline>"
# Example: ./bootstrap.sh CLMetrics "Prometheus exporter for CL services"
#
# Copies the template into ../<NewProjectName>, rewrites {{PROJECT_NAME}}
# and {{PROJECT_TAGLINE}} tokens, and removes this bootstrap script from
# the copy. Does not git-init the new repo — you do that.

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "usage: $0 <NewProjectName> \"<Project tagline>\"" >&2
  exit 2
fi

NAME="$1"
TAGLINE="$2"

here="$(cd "$(dirname "$0")" && pwd)"
dest="$(cd "$here/.." && pwd)/$NAME"

if [ -e "$dest" ]; then
  echo "error: $dest already exists" >&2
  exit 1
fi

# Copy everything except our own git metadata + this script.
mkdir -p "$dest"
( cd "$here" && tar --exclude=.git --exclude=bootstrap.sh --exclude=TEMPLATE.md -cf - . ) | ( cd "$dest" && tar -xf - )

# Token replacement. Escape forward slashes in the tagline for sed.
escaped_tagline="$(printf '%s\n' "$TAGLINE" | sed -e 's/[\/&]/\\&/g')"

grep -rlIZ --exclude-dir=.git '{{PROJECT_NAME}}\|{{PROJECT_TAGLINE}}' "$dest" 2>/dev/null | \
  while IFS= read -r -d '' f; do
    sed -i \
      -e "s/{{PROJECT_NAME}}/$NAME/g" \
      -e "s/{{PROJECT_TAGLINE}}/$escaped_tagline/g" \
      "$f"
  done

echo "Created $dest"
echo "Next steps:"
echo "  cd $dest"
echo "  git init && git add . && git commit -m 'feat: initial scaffold from CLTemplate'"
echo "  uvx prek install"
