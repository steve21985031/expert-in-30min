#!/usr/bin/env bash

set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "Usage: open_html_report.sh /path/to/index.html" >&2
  exit 1
fi

report_path="$1"

if [ ! -f "$report_path" ]; then
  echo "File not found: $report_path" >&2
  exit 1
fi

if command -v open >/dev/null 2>&1; then
  open "$report_path"
  exit 0
fi

if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$report_path"
  exit 0
fi

echo "No supported browser opener found. Please open manually: $report_path" >&2
exit 1
