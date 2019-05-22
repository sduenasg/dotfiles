#!/bin/bash

sxhkd & # Bind keys
xrdb ~/.Xdefaults
compton &
wal -R # Pywal
syncthing -no-browser &

while true; do
	xsetroot -name "$(date)"
	sleep 1m
done &
