set playlist_link=https://www.youtube.com/playlist?..etc.
set start_num=21
set end_num=25

set batchpath=%~dp0%

cmd /c .\youtube-dl.exe -o "%%(title)s.%%(ext)s" --playlist-start %start_num% --playlist-end %end_num% %playlist_link%

rem pause