#!/bin/bash

sxhkd & # Bind keys
xrdb ~/.Xdefaults
compton &
wal -R # Pywal
syncthing -no-browser &

dte(){
  dte="$(date +"%A, %B %d | 🕒 %l:%M%p")"
  echo -e "$dte"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "🖪 $mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}

disk(){
  disk=`df -h | awk '/\/dev\/sdb1/ {printf "%s\n", $4 }'`
  echo -e "⛁  $disk"
}

while true; do
	xsetroot -name "$(disk) | $(cpu) | $(mem) | $(dte)"
     sleep 10s    # Update every ten seconds
done &
