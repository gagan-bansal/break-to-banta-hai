#!/usr/bin/env bash
set -euo pipefail

INTERVAL_MINUTES="${1:-30}"
BOOT_DELAY_MINUTES="${2:-5}"

if ! [[ "$INTERVAL_MINUTES" =~ ^[0-9]+$ ]] || [ "$INTERVAL_MINUTES" -lt 1 ]; then
  echo "Interval must be a positive integer in minutes." >&2
  exit 1
fi

if ! [[ "$BOOT_DELAY_MINUTES" =~ ^[0-9]+$ ]] || [ "$BOOT_DELAY_MINUTES" -lt 0 ]; then
  echo "Boot delay must be a non-negative integer in minutes." >&2
  exit 1
fi

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
ENV_FILE="$HOME/.config/break-to-banta-hai.env"
NODE_BIN_DETECTED="$(command -v node || true)"

mkdir -p "$SYSTEMD_USER_DIR"

cat > "$SYSTEMD_USER_DIR/break-to-banta-hai.service" <<EOF
[Unit]
Description=Show break reminder dialog
After=graphical-session.target
Wants=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=oneshot
WorkingDirectory=$PROJECT_DIR
EnvironmentFile=-%h/.config/break-to-banta-hai.env
ExecStart=$PROJECT_DIR/scripts/show-break.sh
EOF

cat > "$SYSTEMD_USER_DIR/break-to-banta-hai.timer" <<EOF
[Unit]
Description=Run break reminder at regular interval

[Timer]
OnBootSec=${BOOT_DELAY_MINUTES}m
OnUnitActiveSec=${INTERVAL_MINUTES}m
AccuracySec=30s
Persistent=true
Unit=break-to-banta-hai.service

[Install]
WantedBy=timers.target
EOF

if [ ! -f "$ENV_FILE" ]; then
  cat > "$ENV_FILE" <<'EOF'
# Optional overrides
# DISPLAY=:0
# DISPLAY_DURATION_SECONDS=20
# REMINDER_TITLE=Break to banta hai
# ZENITY_BIN=zenity
EOF
fi

if [ -n "$NODE_BIN_DETECTED" ] && ! grep -q '^NODE_BIN=' "$ENV_FILE"; then
  printf '\nNODE_BIN=%s\n' "$NODE_BIN_DETECTED" >> "$ENV_FILE"
fi

chmod +x "$PROJECT_DIR/run.sh" "$PROJECT_DIR/scripts/show-break.sh"

systemctl --user daemon-reload
systemctl --user enable --now break-to-banta-hai.timer

echo "Installed and started break-to-banta-hai.timer"
echo "Interval: every ${INTERVAL_MINUTES} minute(s), boot delay: ${BOOT_DELAY_MINUTES} minute(s)"
echo "Check status: systemctl --user status break-to-banta-hai.timer"
