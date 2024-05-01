@echo off
chcp 1251
setlocal enabledelayedexpansion

REM Ïåðåâ³ðêà íàÿâíîñò³ àðãóìåíò³â êîìàíäíîãî ðÿäêà

if "%~1"=="/help" (
    echo Ï³äêàçêà: ñêðèïò ï³äðàõîâóº ê³ëüê³ñòü ôàéë³â â çàäàíîìó êàòàëîç³. ïåðåäàâàéòå äîâ³ëüïíó ê³ëüê³ñòü ïàðàìåòð³â, áàæàíî â ëàïêàõ, øëÿõè äî êàòàëîã³â, â ÿêèõ òðåáà ðàõóâàòè ôàéëè
    exit /b
)



if "%~1" == "" (
    echo Ïîòð³áíî âêàçàòè øëÿõ äî êàòàëîãó.
    exit /b 1
)

:Loop
if "%~1" == "" goto :EndLoop

REM Ïåðåâ³ðêà, ÷è ³ñíóº âêàçàíèé êàòàëîã
if not exist "%~1" (
    echo Êàòàëîã "%~1" íå çíàéäåíî.
    exit /b 1
)

set "directory=%~1"
set "fileCount=0"

for %%i in ("%directory%\*") do (
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
