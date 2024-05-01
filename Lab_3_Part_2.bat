@echo off
chcp 1251
setlocal enabledelayedexpansion

REM �������� �������� ��������� ���������� �����

if "%~1"=="/help" (
    echo ϳ������: ������ �������� ������� ����� � �������� �������. ����������� �������� ������� ���������, ������ � ������, ����� �� ��������, � ���� ����� �������� �����
    exit /b
)



if "%~1" == "" (
    echo ������� ������� ���� �� ��������.
    exit /b 1
)

:Loop
if "%~1" == "" goto :EndLoop

REM ��������, �� ���� �������� �������
if not exist "%~1" (
    echo ������� "%~1" �� ��������.
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
