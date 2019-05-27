#!/bin/bash

sxhkd & # Bind keys
xrdb ~/.Xdefaults
compton &
wal -R # Pywal
syncthing -no-browser &
sh ~/.dwm/dwm_status.sh &
