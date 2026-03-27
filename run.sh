#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NODE_BIN="${NODE_BIN:-}"
if [ -z "$NODE_BIN" ]; then
  NODE_BIN="$(command -v node || true)"
fi

if [ -z "$NODE_BIN" ]; then
  echo "Node.js was not found in PATH. Set NODE_BIN or install node." >&2
  exit 1
fi

"$NODE_BIN" "$SCRIPT_DIR/index.js"
