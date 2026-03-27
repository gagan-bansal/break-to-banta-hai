#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DISPLAY="${DISPLAY:-:0}"
DISPLAY_DURATION_SECONDS="${DISPLAY_DURATION_SECONDS:-20}"
REMINDER_TITLE="${REMINDER_TITLE:-Break to banta hai}"
ZENITY_BIN="${ZENITY_BIN:-zenity}"
export DISPLAY

# Needed on some Linux setups when running via systemd user service.
if [ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ] && [ -S "/run/user/$(id -u)/bus" ]; then
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
fi

if ! command -v "$ZENITY_BIN" >/dev/null 2>&1; then
  echo "zenity command '$ZENITY_BIN' not found." >&2
  exit 1
fi

MESSAGE="$($SCRIPT_DIR/run.sh)"
if [ -z "$MESSAGE" ]; then
  MESSAGE="Take a short break."
fi

set +e
"$ZENITY_BIN" \
  --info \
  --modal \
  --title="$REMINDER_TITLE" \
  --text="$MESSAGE" \
  --no-wrap \
  --width=900 \
  --height=260 \
  --timeout="$DISPLAY_DURATION_SECONDS"
STATUS=$?
set -e

# 0 = OK clicked, 5 = timeout in many zenity versions.
if [ "$STATUS" -eq 0 ] || [ "$STATUS" -eq 5 ]; then
  exit 0
fi

exit "$STATUS"
