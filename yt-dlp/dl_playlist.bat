set playlist_link=https://www.youtube.com/playlist?list=PLD7475F03564D42CA
set start_num=1
set end_num=10

set batchpath=%~dp0%

cmd /c .\yt-dlp.exe -o "%%(title)s.%%(ext)s" --playlist-start %start_num% --playlist-end %end_num% %playlist_link%

pause