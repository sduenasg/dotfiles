#!/bin/bash

ffmpeg -y \
-video_size 1366x768 \
-framerate 30 -f x11grab -i :0.0 \
~/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.mp4 \
&> /tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.log
