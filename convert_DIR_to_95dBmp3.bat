REM Untested

@echo off

SetLocal EnableDelayedExpansion
set batchpath=%~dp0%
set folder=%~1
set count=0


for /r "%folder%" %%G in (*) do (
    set filenameWoExt=%%~nG
    set fullpath=%%G
    set folder=%%~dpG
    call :processFile

)
goto end



:processFile
    echo "fullpath = %fullpath%"
    echo "folder = %folder%"
    echo "batchpath = %batchpath%"
    echo "filenameWoExt = %filenameWoExt%"

    call "%batchpath%ffmpeg" -i "%fullpath%" "%folder%%filenameWoExt%.mp3"
    rename "%filenameWoExt%.mp3" "temporary_filename_500.mp3"

    REM -c : ignore clipping
    REM -r : apply track gain
    REM -d 6.0 : makes it 95.0 dB (default to 89.0 dB)
    call "%batchpath%mp3gain" -c -r -d 6.0 "%folder%temporary_filename_500.mp3"

    rename "%folder%temporary_filename_500.mp3" "%filenameWoExt%.mp3"

    set /a count+=1
   echo.
    goto :eof

:end

echo "%count% files processed."

REM pause
