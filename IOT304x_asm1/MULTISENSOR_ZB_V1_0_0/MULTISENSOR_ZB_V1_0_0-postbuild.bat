@echo off
setlocal enableextensions enabledelayedexpansion
SET allParams=%*
SET params=%allParams:' '=","%
SET params=%params:'="%
set /a count=0
for %%i in (%params%) do (
  set /a count+=1
  set param[!count!]=%%i
)

set "studioInstallationDir=%param[4]:"=%"
set "projDir=%~dp0"
set "projDir=%projDir:"=%"

"%studioInstallationDir%/developer\adapter_packs\python\Scripts\python.exe"  "%projDir%/MULTISENSOR_ZB_V1_0_0-postbuild.py" %param[1]%  %param[2]%  "" "" %param[3]% 