#!/bin/bash

# Downloads from all lines in ./download_list.txt (one url per line)

yt_dl_path="../../youtube-dl/youtube-dl"

xargs $yt_dl_path < download_list.txt

