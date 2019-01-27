#!/bin/bash

OPTIND=2
if [ -z $1 ]; then
	echo "Enter video file path";
	exit 1;
else
	echo "var is set to '$1'";
fi

while getopts ":d:r:" option; do
	case "${option}"
	in
	d) DELAY="-d $OPTARG";;
	r) FPS="-r $OPTARG";;
	esac
done

if [ -d "frames" ]; then
	echo "Directory frames already exists";
	exit 1;
fi

mkdir frames
ffmpeg -i $1 -r 5 'frames/frame-%03d.png'
cd frames
convert -delay 20 -loop 0 *.png ../out.gif
rm -rf frames
