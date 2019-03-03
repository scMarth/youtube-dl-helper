REM Untested

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

rename "%folder%%filename%" "temporary_filename_500%fileExtension%"
call "%batchpath%ffmpeg" -i "%folder%temporary_filename_500%fileExtension%" "temporary_filename_500.mp3"
rename "%folder%temporary_filename_500%fileExtension%" "%filename%"

REM -c : ignore clipping
REM -r : apply track gain
REM -d 6.0 : makes it 95.0 dB (default to 89.0 dB)
call "%batchpath%mp3gain" -c -r -d 6.0 "%folder%temporary_filename_500.mp3"

rename "%folder%temporary_filename_500.mp3" "%filenameWoExt%.mp3"

:skip
shift
if not "%~1"=="" goto loop

REM pause