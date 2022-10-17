# break-to-banta-hai

Saves your eyes and mind.

## Installation

Requires node.js, Clone this repo.

```sh
https://github.com/gagan-bansal/break-to-banta-hai.git
cd break-to-banta-hai
npm i
```

## Usage

Create a `run.sh` file with following code:

```sh
# first two lines are required if you are using node with nvm
export NVM_DIR="/home/gaganb/.nvm"  # set your nvm dir path
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
node /home/gaganb/src/eye-leo/index.js
sleep 9s
```

**Note:** Please replace `/home/gaganb` with your home directory.

Add the following in your crontab.

```
*/15 * * * * export DISPLAY=:0 && /usr/bin/gnome-terminal --full-screen -e "sh /home/gaganb/src/eye-leo/run.sh"
```

You can set time interval (in crontab) and display time (in run.sh) as per your requirement.

The messages' list is in `index.js`, edit or add according to your need. Treat this is a simple alert system and use it with your imagination.


