@echo off

set batchpath=%~dp0%
set folder=%~1
set count=0

for /r "%folder%" %%G in (*) do (
	set filenameWoExt=%%~nG
	set fullpath=%%G
	set folder=%%~dpG
	set fileExtension=%%~xG
	set filename=%%~nxG
	call :processFile
)
goto end

:processFile
	echo "fullpath = %fullpath%"
	echo "folder = %folder%"
	echo "batchpath = %batchpath%"
    echo "filenameWoExt = %filenameWoExt%"
	echo "fileExtension = %fileExtension%"
	echo "filename = %filename%"

	rename "%fullpath%" "temporary_filename_500%fileExtension%"
	call "%batchpath%ffmpeg" -i "%folder%temporary_filename_500%fileExtension%" "%folder%%filenameWoExt%.mp3"
	rename "%folder%temporary_filename_500%fileExtension%" "%filename%"

	set /a count+=1
   	echo/
	goto :eof

:end

echo "%count% files processed."

REM pause
