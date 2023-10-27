@echo off

setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (C:\Users\%USERNAME%\usr_passwordset.txt) do (
    set "password=%%A"
)

if defined password (
    :loop
    set /P password_check="Enter password: "

    IF "!password_check!"=="!password!" (
        set /P usr_choice="Do you want to remove password? (y/n): "

        IF "!usr_choice!"=="y" (
            del C:\Users\%USERNAME%\usr_passwordset.txt
            move "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\check_password.bat" "./"

            echo Remove password complete

            pause
        ) ELSE (
            echo Exit
            pause
        )        
    ) ELSE (
        echo Password incorrect
        goto loop
    )
) ELSE (
    echo No password was set to remove
)

pause

:end
endlocal

