#!/bin/bash

dte(){
  dte="$(date +"%A, %d %B | 🕒 %k:%M%p")"
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
  disk=`df -h | awk '/\/dev\/sd/ {printf "%s\n", $4 }'`
  echo -e "⛁  $disk"
}

volume(){
  muted=$(amixer -D pulse get Master | grep '\[on\]' | wc -l)

  if [ $muted -eq 0 ]
  then
	vol="muted"
  else
  	vol=$(amixer -D pulse get Master | grep '\[on\]' | head -n1 | awk ' {print $5 }' | sed 's/[][]//g')
  fi
  echo -e "🔉 $vol"
}

write(){
  xsetroot -name "  $disk_status | $cpu_status | $mem_status | $volume_status | $date_status "
}

while true; do
  disk_status=$(disk)
  cpu_status=$(cpu)
  mem_status=$(mem)
  volume_status=$(volume)
  date_status=$(dte)
  write
  sleep 1s
done &

