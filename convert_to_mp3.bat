@echo off

set batchpath=%~dp0%

:loop

set fullpath=%1
set filename=%~nx1%
set folder=%~dp1%
set fileExtension=%~x1
set filenameWoExt=%~n1

echo fullpath = %fullpath%
echo filename = "%filename%"
echo folder = "%folder%"
echo batchpath = "%batchpath%"
echo fileExtension = "%fileExtension%"
echo filenameWoExt = "%filenameWoExt%"

call "%batchpath%ffmpeg" -i "%folder%%filename%" "%folder%%filenameWoExt%.mp3"

:skip
shift
if not "%~1"=="" goto loop

pause