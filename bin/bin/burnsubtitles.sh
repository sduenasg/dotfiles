#!/bin/sh


#PLEX buffers a lot when a video contains non-hardcoded subtitles (subs on a separate file/stream). When subs are present, it needs to transcode the video on the fly to embed the subs into the video track. That generates long buffering times in weaker hardware (like a raspberry pi). This script grabs all the videos in the . folder and re-encodes the subs into the video tracks, so that PLEX can just stream the video without transcoding.

extensions="mkv"

for file in "."/*
do
	base=$(basename -- "$file")
	filename="${file%.*}" #no extension
	extension="${base##*.}"
#note if the subtitles are a .srt file, replace "$file" with the name of the path to the .srt file
	if echo $extensions | grep -w $extension >/dev/null; then
		#re-encodes the video with hardcoded subtitles
		$(ffmpeg -i "$file" -vf subtitles="$file" -c:v libx264 -crf 20 -c:a aac -strict experimental -b:a 320k "$filename"_out.mkv)

	else
		echo "skipping unsupported file: $file"
	fi
done
