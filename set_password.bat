@echo off

setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (C:\Users\%USERNAME%\usr_passwordset.txt) do (
    if not "%%A"=="" (
        set /P usr_choice="Password has been set. Do you want to change? (y/n): "
        IF "!usr_choice!"=="y" (
            del C:\Users\%USERNAME%\usr_passwordset.txt
            set /P usr_passwordset="Enter the password you want to set when starting the computer: "
            echo !usr_passwordset! >> C:\Users\%USERNAME%\usr_passwordset.txt
            echo Your password: !usr_passwordset! has been set when starting the computer

            pause
        ) ELSE (
            echo Exit.
            pause
        )
        goto end
    )
)

set /P usr_passwordset="Enter the password you want to set when starting the computer: "

echo !usr_passwordset!>>C:\Users\%Username%\usr_passwordset.txt

move "check_password.bat" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

echo Your password: !usr_passwordset! has been set when starting the computer

pause

:end
endlocal
