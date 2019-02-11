# Youtube-DL
A copy of youtube-dl.exe, ffmpeg.exe, and some useful batch scripts

ffmpeg repository: https://github.com/FFmpeg/FFmpeg

youtube-dl repository: https://github.com/rg3/youtube-dl

### List of scripts

- **convert_DIR_to_mp3.bat and convert_to_mp3.bat** https://github.com/scMarth/batch_convert_to_mp3
  - These two batch scripts can be used to convert video files into .mp3 files
  
- **convert_DIR_to_95dBmp3.bat and convert_to_95dBmp3.bat**
  - These two scripts are exactly the same as **convert_to_mp3.bat** and **convert_DIR_to_mp3.bat**, except afterwards, resulting mp3s are then normalized to 95dB using [mp3gain](http://mp3gain.sourceforge.net/) so that the variation in perceived 'loudness' between resulting mp3 files is minimized.
  
- **yt_download.bat**
  - Reads `download_list.txt` which is a text file containing youtube links, one per line, and then downloads each of them into a video file named using its respective Youtube video title.

- **rename.py**
  - A generic skeleton for a Python script that can be modified for renaming files
