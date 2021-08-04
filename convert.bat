@ECHO off

ECHO "##########################################################################"
ECHO "## Simple utility for batch conversions of CUE to CHD Images.           ##"
ECHO "##                                                                      ##"
ECHO "## Requires: Mame (http://mamedev.org)                                  ##"
ECHO "##                                                                      ##"
ECHO "## Directory Structure:                                                 ##"
ECHO "##                      /cue2chd.bat       <-- This file                ##"
ECHO "##                      /cue/              <-- Source Directory         ##"
ECHO "##                      /cue/file.cue                                   ##"
ECHO "##                      /cue/file.bin                                   ##"
ECHO "##                      /chd/              <-- Target Directory         ##"
ECHO "##                      /chd/file.chd                                   ##"
ECHO "##                                                                      ##"
ECHO "## This batch file is Public Domain do as you will.                     ##"
ECHO "##########################################################################"
ECHO 

REM Variables

SET chdman="taik0chd converter\chdman.exe"
SET src_path="%CD%\cue"
SET dst_path="%CD%\chd"

REM Execution

IF NOT EXIST %dst_path% (
    MKDIR %dst_path%
)

FOR /R "%src_path%\" %%i IN ("*.cue") do (
    ECHO "%%i"
    MKDIR "%dst_path%\%%~ni"
    %chdman% createcd -i "%%i" -o "%dst_path%\%%~ni\%%~ni.chd"
)