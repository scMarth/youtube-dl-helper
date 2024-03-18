@echo off

set batchpath=%~dp0%

for /F "tokens=*" %%A in (download_list2.txt) do (
    cmd /c .\yt-dlp.exe -o "%%(title)s.%%(ext)s" %%A
)

pause