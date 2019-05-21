#!/bin/sh
# Controls the built-in led brightness on a raspberry pi

usage() {
	echo "Usage: pileds -l led_number(green blinking led (sdcard activity)=0,red power led=1) -b brightness_value(0,1)"
	}

ledn=0
brightness=0

if [ $# == 0 ]; then
	usage
	exit 0
fi

while getopts ":hl:b:" option; do
	case "${option}" in
	h)
		usage
		exit0;;
	l)
		ledn="$OPTARG";;
	b)
		brightness="$OPTARG";;
	esac
done

if [ ! -f /sys/class/leds/led"$ledn"/brightness ];then
	echo "led $ledn not found in /sys/class/leds"
	usage >&2
	exit 1;
fi

echo "setting led"$ledn" to "$brightness" brightness"
#echo "echo "$brightness" > /sys/class/leds/led"$ledn"/brightness"
echo $(echo "$brightness" > /sys/class/leds/led"$ledn"/brightness)
