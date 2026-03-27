# break-to-banta-hai

Saves your eyes and mind.

## Installation

Linux only. Prerequisites: Node.js and zenity.

Clone this repo:

```sh
git clone https://github.com/gagan-bansal/break-to-banta-hai.git
cd break-to-banta-hai
npm i
```

If `zenity` is not installed:

```sh
sudo apt update
sudo apt install -y zenity
```

## Run As A Service (Recommended)

This project now uses a `systemd --user` timer + service and shows reminders using `zenity` dialogs.

```sh
npm run install:service
```

This installs and starts:
- `~/.config/systemd/user/break-to-banta-hai.service`
- `~/.config/systemd/user/break-to-banta-hai.timer`

Default schedule:
- first reminder: 5 minutes after login/boot
- then every 30 minutes

### Custom interval

Install with custom interval and boot delay:

```sh
bash ./scripts/install-user-service.sh <interval_minutes> <boot_delay_minutes>
```

Example (every 30 mins, start after 5 mins):

```sh
bash ./scripts/install-user-service.sh 30 5
```

### Service commands

```sh
npm run status:service
npm run start:service
npm run stop:service
npm run logs:service
```

### Optional overrides

Edit this file:

```sh
~/.config/break-to-banta-hai.env
```

Available env vars:
- `DISPLAY` (default `:0`)
- `DISPLAY_DURATION_SECONDS` (default `20`)
- `REMINDER_TITLE` (default `Break to banta hai`)
- `ZENITY_BIN` (default `zenity`)
- `NODE_BIN` (path to node binary, if needed)

Then reload user systemd:

```sh
systemctl --user daemon-reload
systemctl --user restart break-to-banta-hai.timer
```

## Message Customization

Edit `index.js` and update the `actions` list.
