@echo off
rem dirs.bat...show stack contents

rem OR is not supported in if-statements
set shouldclear=false
if [%1] == [-c] set shouldclear=true
if [%1] == [/c] set shouldclear=true

if "%shouldclear%" == "true" (
rem Clear the stack:

	set savdir=%cd%

setlocal enabledelayedexpansion
	rem begin loop1 
	:top1
		set oldir=!cd!
		popd
		set nudir=!cd!
		if !errorlevel! NEQ 0 goto bot1
		if [!nudir!] == [!oldir!] (
			goto bot1
		)
		goto top1
	:bot1
	rem end loop1 
endlocal

	chdir %savdir%
	rem echo =========done popping stack=======

) else (
rem display the stack:
	pushd
)
