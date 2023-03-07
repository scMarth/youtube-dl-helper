@echo off

set batchpath=%~dp0%

for /F "tokens=*" %%A in (download_list.txt) do (
    cmd /c .\yt-dlp.exe -o "%%(title)s.%%(ext)s" %%A
)

pause