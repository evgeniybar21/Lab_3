@echo off
chcp 1251
setlocal enabledelayedexpansion

REM Перевірка наявності аргументів командного рядка
if "%~1" == "" (
    echo Must type adress
    exit /b 1
)

:Loop
if "%~1" == "" goto :EndLoop

REM Перевірка, чи існує вказаний каталог
if not exist "%~1" (
    echo Catalog "%~1" is not found
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
