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

	set /a count+=1
   echo.
	goto :eof

:end

echo "%count% files processed."

pause
