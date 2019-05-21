#!/bin/sh
# Use mmpeg to convert videos to animated gifs

usage() {
	echo "Usage: vid2gif -i path/to/file [-d frame-delay] [-r fps]"
	}


DELAY="-delay 20"
FPS="-r 5"
DIR="frames"

if [ $# == 0 ]; then
	usage
	exit 0
fi

while getopts ":hd:i:r:" option; do
	case "${option}" in
	h)
		usage
		exit0;;
	d)
		DELAY="-delay $OPTARG";;
	r)
		FPS="-r $OPTARG";;
	i)
		FILE=$OPTARG;;
	esac
done

if [ -z $FILE ]; then
	usage >&2;
	exit 1;
fi


if [ -d $DIR ]; then
	usage >&2;
	exit 1;
fi

mkdir $DIR
$(ffmpeg -i $FILE $FPS $DIR'/frame-%03d.png' -loglevel quiet)

cd $DIR
$(convert $DELAY -loop 0 *.png ../out.gif)
cd ..
$(rm -rf $DIR)
