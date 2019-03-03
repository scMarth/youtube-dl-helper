@echo off

set batchpath=%~dp0%

:loop

set fullpath=%1
set filename="%~nx1%"
set folder=%~dp1%
set fileExtension=%~x1
set filenameWoExt="%~n1"

echo fullpath = "%fullpath%"
echo filename = "%filename%"
echo folder = "%folder%"
echo batchpath = "%batchpath%"
echo fileExtension = "%fileExtension%"
echo filenameWoExt = "%filenameWoExt%"

rename %filename% "temporary_filename_500%fileExtension%"
call "%batchpath%ffmpeg" -i "%folder%temporary_filename_500%fileExtension%" "%folder%temporary_filename_500.mp3"
rename "%folder%temporary_filename_500%fileExtension%" %filename%
rename "%folder%temporary_filename_500.mp3" %filenameWoExt%.mp3

:skip
shift
if not "%~1"=="" goto loop

REM pause