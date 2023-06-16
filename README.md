# break-to-banta-hai

Saves your eyes and mind.

## Installation

Right now configured for Linux. Prerequisite node.js.

Clone this repo:

```sh
git clone https://github.com/gagan-bansal/break-to-banta-hai.git
cd break-to-banta-hai
npm i
```

## Usage

Create a `run.sh` file with following code:

```sh
# first two lines are required if you are using node with nvm
export NVM_DIR="/home/gaganb/.nvm"  # set your nvm dir path
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
node /home/gaganb/break-to-banta-hai/index.js
sleep 9s
```

**Note:** Please replace `/home/gaganb` with your home directory.

Add the following in your crontab.

```
*/15 * * * * export DISPLAY=:0 && /usr/bin/gnome-terminal --full-screen -- sh /home/gaganb/break-to-banta-hai/run.sh
```

**Note:** Sometime you may need to install `dbus-launch` in case you are getting this error (I was getting error on Ubuntu 22.10)

```
Failed to execute child process "dbus-launch" on 'Open in Terminal'
```

You can set time interval (in crontab) and display time (in run.sh) as per your requirement.

The messages' list is in `index.js`, edit or add according to your need. Treat this is a simple alert system and use it with your imagination.


