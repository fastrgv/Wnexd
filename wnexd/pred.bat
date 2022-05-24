@echo off
rem pred.bat

set savdir=%cd%
set dirfile=%HOMEPATH%\newd.txt

setlocal enabledelayedexpansion

set k=-1

rem first, pop [&save] stack until empty...

rem begin loop1 
:top1
	set /a k += 1
	set nd[!k!]=!cd!
	set oldir=!cd!
	popd
	if !errorlevel! NEQ 0 goto bot1
	set nudir=!cd!
	if [!nudir!] == [!oldir!] (
		rem echo POPD empty
		goto bot1
	)
	goto top1
:bot1
rem end loop1 


rem pred: halfway ( nd[k]=bot )
rem note that:  chdir==call chdir, pushd==call pushd

rem the remaining logic only works if there are at least
rem two DIRs to toggle between:
if [!k!] LEQ [0] (
	chdir %savedir%
	goto :eof
)

rem k>=1

rem now slightly rearrange ordering...

rem nd[k] is the old stack bottom,
rem nd[k-1] becomes new stack bottom:
set /a nubot=!k!-1
call chdir %%nd[!nubot!]%%

rem write proper final destin.Dir to file:
set olbot=!k!
call echo %%nd[!olbot!]%%>%dirfile%


rem now put back the remaining DIRs in similar order...
rem begin loop2 ----------
:top2
set /a k -= 1
call pushd %%nd[!k!]%%
if [!k!] == [0] goto bot2
goto top2
:bot2
rem end loop2 -----------
call pushd %%nd[!olbot!]%%

endlocal

rem the chdir of the final pushd nd[olbot] was erased
rem by endlocal; we need to chdir there manually...

rem read proper final destin.Dir from file;
rem then chdir accordingly; & delete file.
set /p newdir=<%dirfile%
chdir "%newdir%"
del /f %dirfile%

rem echo ============== pred complete ===========

