@echo off
setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (C:\Users\%USERNAME%\usr_passwordset.txt) do (
    set "password=%%A"
)

if defined password (
    :loop
    set /P password_check="Enter password: "

    IF "!password_check!"=="!password!" (
        echo Unlock complete
        pause
    ) ELSE (
        echo Password incorrect
        goto loop
    )
) ELSE (
    echo No password was set
)

pause

endlocal
