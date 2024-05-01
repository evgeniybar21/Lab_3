@echo off
chcp 1251
setlocal enabledelayedexpansion

REM Ïåðåâ³ðêà íàÿâíîñò³ àðãóìåíò³â êîìàíäíîãî ðÿäêà
if "%~1" == "" (
    echo Must type adress
    goto :EOF
)

:Loop
if "%~1" == "" goto :EndLoop

REM Ïåðåâ³ðêà, ÷è ³ñíóº âêàçàíèé êàòàëîã
if not exist "%~1" (
    echo Catalog "%~1" is not found
    goto :NextParam
)

set "directory=%~1"
set "fileCount=0"

for /f %%i in ('dir /a-d /b /s "%directory%"') do (
    set "attributes=%%~ai"
    if "!attributes:~0,1!" neq "d" (
        set /a "fileCount+=1"
    )
)

echo Number files in catalog: "%directory%": %fileCount%

:NextParam
shift
goto :Loop

:EndLoop
endlocal
