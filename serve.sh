#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-8000}"
HOST="0.0.0.0"

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Error: Python is not installed." >&2
  exit 1
fi

echo "Serving index.html from: $(pwd)"
echo "Local URL:   http://127.0.0.1:${PORT}/index.html"
echo "Network URL: http://${HOST}:${PORT}/index.html"
echo "Press Ctrl+C to stop."

exec "$PYTHON_BIN" -m http.server "$PORT" --bind "$HOST"
