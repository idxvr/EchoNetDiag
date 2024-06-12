@echo off
setlocal enabledelayedexpansion
set "log_file=ping_log.txt"
set "temp_file=temp.txt"
title Echo Network Diagnostics
color 0C

echo Echo Network Diagnostics Tool v2.2
echo.
echo Continue to Menu
pause

:main

:: Main menu
:main
cls
echo.                                                                                                  
::: _______   ________  ___  ___  ________     
:::|\  ___ \ |\   ____\|\  \|\  \|\   __  \    
:::\ \   __/|\ \  \___|\ \  \\\  \ \  \|\  \   
::: \ \  \_|/_\ \  \    \ \   __  \ \  \\\  \  
:::  \ \  \_|\ \ \  \____\ \  \ \  \ \  \\\  \ 
:::   \ \_______\ \_______\ \__\ \__\ \_______\
:::    \|_______|\|_______|\|__|\|__|\|_______|
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
color %textcolor%
echo Welcome, user!
echo.
echo Current Time: %time:~0,2%:%time:~3,2%:%time:~6,2%
echo.
echo 1. Create a new file
echo 2. Delete a file
echo 3. List files
echo 4. Rename a file
echo 5. Copy a file
echo 6. Move a file
echo 7. Create a new directory
echo 8. Delete a directory
echo 9. List directories
echo 10. Change directory
echo 11. System information
echo 12. Change text color
echo 13. SMTP Mail Sender
echo 14. Shutdown
echo ------------------------------ NETWORK OPTIONS
echo 15. Network devices
echo 16. Spoof MAC (Windows Registry)
echo 17. Display IP pings
echo 18. Network Speed Diagnostic
echo 19. Traceroute
echo 20. Port Scanner
echo.
set /p choice=Choose an option: 

:: Process user choice
if %choice%==1 goto createfile
if %choice%==2 goto deletefile
if %choice%==3 goto listfiles
if %choice%==4 goto renamefile
if %choice%==5 goto copyfile
if %choice%==6 goto movefile
if %choice%==7 goto createdirectory
if %choice%==8 goto deletedirectory
if %choice%==9 goto listdirectories
if %choice%==10 goto changedirectory
if %choice%==11 goto systeminfo
if %choice%==12 goto changetextcolor
if %choice%==13 goto mailclient
if %choice%==14 goto shutdown
if %choice%==15 goto networkdevices
if %choice%==16 goto spoofmac
if %choice%==17 goto displayippings
if %choice%==18 goto speed
if %choice%==19 goto traceroute
if %choice%==20 goto portscanner
goto main

:createfile
cls
type echo.txt
echo.
echo.
set /p filename=Enter a filename: 
echo. > %filename%.txt
echo File created successfully!
pause
goto main

:deletefile
cls
type echo.txt
echo.
echo.
set /p filename=Enter a filename: 
if exist %filename%.txt del %filename%.txt
echo File deleted successfully!
pause
goto main

:listfiles
cls
type echo.txt
echo.
echo.
dir /b *.txt
pause
goto main

:renamefile
cls
type echo.txt
echo.
echo.
set /p oldfilename=Enter the old filename: 
set /p newfilename=Enter the new filename: 
if exist %oldfilename%.txt ren %oldfilename%.txt %newfilename%.txt
echo File renamed successfully!
pause
goto main

:: Copy a file
:copyfile
cls
type echo.txt
echo.
echo.
set /p sourcefilename=Enter the source filename: 
set /p targetfilename=Enter the target filename: 
if exist %sourcefilename%.txt copy %sourcefilename%.txt %targetfilename%.txt
echo File copied successfully!
pause
goto main

:movefile
cls
type echo.txt
echo.
echo.
set /p sourcefilename=Enter the source filename: 
set /p targetfilename=Enter the target filename: 
if exist %sourcefilename%.txt move %sourcefilename%.txt %targetfilename%.txt
echo File moved successfully!
pause
goto main

:createdirectory
cls
type echo.txt
echo.
echo.
set /p directoryname=Enter a directory name: 
mkdir %directoryname%
echo Directory created successfully!
pause
goto main

:deletedirectory
cls
type echo.txt
echo.
echo.
set /p directoryname=Enter a directory name: 
rmdir /s /q %directoryname%
echo Directory deleted successfully!
pause
goto main

:listdirectories
cls
type echo.txt
echo.
echo.
dir /b /ad
pause
goto main

:changedirectory
cls
type echo.txt
echo.
echo.
set /p directoryname=Enter a directory name: 
cd %directoryname%
echo Directory changed successfully!
pause
goto main

:systeminfo
cls
type echo.txt
echo.
echo.
echo System Information:
echo.
systeminfo | findstr /c:"Host Name"
systeminfo | findstr /c:"Domain"
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Manufacturer"
systeminfo | findstr /c:"System Model"
systeminfo | findstr /c:"System type"
systeminfo | findstr /c:"Total Physical Memory"
ipconfig | findstr IPv4
echo.
echo Hard Drive Space:
wmic diskdrive get size
echo.
echo Service Tag:
wmic bios get serialnumber
echo.
echo CPU:
wmic cpu get name
echo GPU:
wmic path win32_VideoController get name
echo RAM:
wmic memorychip get capacity
echo HDD:
wmic diskdrive get model
pause
goto main

:changetextcolor
cls
type echo.txt
echo.
echo.
echo Choose a text color:
echo 0 = Black
echo 1 = Blue
echo 2 = Green
echo 3 = Cyan
echo 4 = Red
echo 5 = Magenta
echo 6 = Brown
echo 7 = White
echo 8 = Gray
echo 9 = Bright Blue
echo A = Green
echo B = Cyan
echo C = Coral
echo D = Magenta
echo E = Pale Yellow
echo F = Bright White
set /p textcolorchoice=Enter a text color choice (0-F): 

if %textcolorchoice%==0 set textcolor=0
if %textcolorchoice%==1 set textcolor=1
if %textcolorchoice%==2 set textcolor=2
if %textcolorchoice%==3 set textcolor=3
if %textcolorchoice%==4 set textcolor=4
if %textcolorchoice%==5 set textcolor=5
if %textcolorchoice%==6 set textcolor=6
if %textcolorchoice%==7 set textcolor=7
if %textcolorchoice%==8 set textcolor=8
if %textcolorchoice%==9 set textcolor=9
if /i %textcolorchoice%==A set textcolor=A
if /i %textcolorchoice%==B set textcolor=B
if /i %textcolorchoice%==C set textcolor=C
if /i %textcolorchoice%==D set textcolor=D
if /i %textcolorchoice%==E set textcolor=E
if /i %textcolorchoice%==F set textcolor=F

color %textcolor%
goto main

:networkdevices
cls
type echo.txt
echo.
echo.
echo Network Devices:
echo.
arp -a
echo.
echo Available devices on the network:
echo.
for /f "tokens=2 delims=: " %%a in ('arp -a ^| findstr "dynamic" ^| findstr /v "Interface"') do (
    ping -n 1 %%a | findstr "bytes" > nul
    if %errorlevel%==0 (
        echo %%a online
    ) else (
        echo %%a offline
    )
)
echo.
set /p devicename=Enter a device name or IP address: 
cls
echo Device Specifications:
echo.
echo Device Name: %devicename%
echo.
echo Device Type: 
if %devicename%==%computername% echo This device
if %devicename%==%computername% goto localdevice
ping -n 1 %devicename% | findstr "bytes" > nul
if %errorlevel%==0 (
    echo Desktop
) else (
    ping -n 1 %devicename% | findstr "bytes" > nul
    if %errorlevel%==0 (
        echo Laptop
    ) else (
        ping -n 1 %devicename% | findstr "bytes" > nul
        if %errorlevel%==0 (
            echo Phone
        ) else (
            echo Other
        )
    )
)
echo.
ping -n 1 %devicename% | findstr "bytes" > nul
if %errorlevel%==0 (
    echo Status: Online - You have access to this device.
) else (
    echo Status: Offline - You do not have access to this device.
)
echo.
echo Operating System: 
wmic /node:%devicename% os get caption > nul 2>&1
if %errorlevel%==0 (
    echo OS: 
    wmic /node:%devicename% os get caption
) else (
    echo Unable to retrieve OS information.
)
echo.
echo CPU: 
wmic /node:%devicename% cpu get name > nul 2>&1
if %errorlevel%==0 (
    echo CPU: 
    wmic /node:%devicename% cpu get name
) else (
    echo Unable to retrieve CPU information.
)
echo.
echo RAM: 
wmic /node:%devicename% memorychip get capacity > nul 2>&1
if %errorlevel%==0 (
    echo RAM: 
    wmic /node:%devicename% memorychip get capacity
) else (
    echo Unable to retrieve RAM information.
)
echo.
echo HDD: 
wmic /node:%devicename% diskdrive get model > nul 2>&1
if %errorlevel%==0 (
    echo HDD: 
    wmic /node:%devicename% diskdrive get model
) else (
    echo Unable to retrieve HDD information.
)
pause
goto main

:spoofmac
cls
type echo.txt
echo.
echo.
echo MAC Address Spoofer:
echo.
echo Current MAC Address:
for /f "tokens=2 delims==" %%a in ('wmic nicconfig get macaddress /value') do (
    set macaddress=%%a
)
echo %macaddress%
echo.
echo 1. Enter a new MAC address manually
echo 2. Generate a random MAC address
set /p choice=Enter your choice:
if %choice%==1 set /p newmacaddress=Enter a new MAC address (format: XX-XX-XX-XX-XX-XX):
pause
goto menu
if %choice%==2 goto :randmac

:randmac
set /a rand1=%random%%%256
set /a rand2=%random%%%256
set /a rand3=%random%%%256
set /a rand4=%random%%%256
set /a rand5=%random%%%256
set /a rand6=%random%%%256
set newmacaddress=00-%rand1:~-2%-%rand2:~-2%-%rand3:~-2%-%rand4:~-2%-%rand5:~-2%-%rand6:~-2%
cls
type echo.txt
echo.
echo.
echo Changing MAC Address...
wmic nicconfig where "index=1" call setmacaddress %newmacaddress%
echo MAC Address changed to %newmacaddress%.
pause
goto main

:displayippings
cls
type echo.txt
echo.
echo.
echo Displaying all server IPs that are pinging your machine...
echo.
echo Press Ctrl+C to stop
echo.

:loop
netstat -an | findstr ESTABLISHED | findstr /v "127.0.0.1" | findstr /v "::1" > temp.txt
for /f "tokens=2 delims= " %%a in (temp.txt) do (
    echo %%a
)
del temp.txt
timeout /t 10 > nul
if errorlevel 1 goto main
goto loop

:speed
cls
type echo.txt
echo.
echo.
echo Network Connection Speed
echo.
echo Please note that this method may not be accurate and is only an estimate.
echo.

wmic nic get speed /value

echo.
echo Measurements in Bits per Second.
echo.
echo Press any key to return to the main menu...
pause > nul
goto main
:traceroute
cls
type echo.txt
echo.
echo.
echo Traceroute
echo.
echo Enter the hostname or IP address to trace:
set /p target=

tracert %target%

echo.
echo Press any key to return to the main menu...
pause > nul
goto main

:portscanner
cls
type echo.txt
echo.
echo.
echo Port Scanner:
echo.
set /p target=Enter the target IP address or hostname: 

echo %target% | findstr "[a-zA-Z]" > nul
if %errorlevel% equ 0 (
    echo Error: Invalid IP address.
    echo Please enter a valid IP address or hostname without letters.
    pause
    goto main
)

set /p startport=Enter the starting port number: 
set /p endport=Enter the ending port number: 

telnet > nul
if %errorlevel%==9009 (
    echo Error: Telnet client is not enabled.
    echo Please enable Telnet client in Windows Features.
    echo.
    echo Opening "Turn Windows features on or off"...
    start optionalfeatures
    echo Please enable Telnet Client and then run this script again.
    pause
    goto main
)

for /l %%p in (%startport%,1,%endport%) do (
    echo Scanning port %%p...
    (echo quit >> telnet.txt) & (telnet /a %%p %target% < telnet.txt > nul)
    if %errorlevel%==0 (
        echo Port %%p is open
    ) else (
        echo Port %%p is closed
    )
    del telnet.txt
)
pause
goto main

@echo off
setlocal enabledelayedexpansion

:: Check if blat is installed
where blat > nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Blat is not installed.
    echo Please download and install blat from https://www.blat.net/
    pause
    goto menu
)

:: Set SMTP server settings
set "smtp_server=smtp.gmail.com"
set "smtp_port=587"

:: Check if email settings are stored
if exist email_settings.txt (
    :: Load email settings from file
    for /f "tokens=1,2 delims==" %%a in (email_settings.txt) do (
        if "%%a"=="from_email" set "from_email=%%b"
        if "%%a"=="password" set "password=%%b"
    )
) else (
    :: Prompt user for email settings
    set /p from_email=Enter your email address: 
    set /p password=Enter your email password: 
    :: Store email settings to file
    echo from_email=%from_email% > email_settings.txt
    echo password=%password% >> email_settings.txt
)

:mailclient
cls
type echo.txt
echo.
echo.
:: Check if stunnel is installed
where stunnel > nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Stunnel is not installed.
    echo Please download and install stunnel from https://www.stunnel.org/downloads.html
    pause
    exit /b 1
)

:: Check if blat is installed
where blat > nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Blat is not installed.
    echo Please download and install blat from https://www.blat.net/
    pause
    exit /b 1
)

:: Set SMTP server settings
set "smtp_server=smtp.gmail.com"
set "smtp_port=587"

:: Create stunnel.conf file
echo [smtp-tls] > stunnel.conf
echo client = yes >> stunnel.conf
echo accept = 127.0.0.1:7825 >> stunnel.conf
echo connect = %smtp_server%:%smtp_port% >> stunnel.conf

:: Check if email settings are stored
if exist email_settings.txt (
    :: Load email settings from file
    for /f "tokens=1,2 delims==" %%a in (email_settings.txt) do (
        if "%%a"=="from_email" set "from_email=%%b"
        if "%%a"=="password" set "password=%%b"
    )
) else (
    :: Prompt user for email settings
    set /p from_email=Enter your email address: 
    set /p password=Enter your email password: 
    :: Store email settings to file
    echo from_email=%from_email% > email_settings.txt
    echo password=%password% >> email_settings.txt
)

:menu
:: Ask user if they want to send a single email or a mass email
echo Choose an option:
echo 1. Send a single email
echo 2. Send a mass email
echo 3. Exit
set /p choice=Enter your choice (1/2/3): 

if %choice% equ 1 (
    :: Send a single email
    set /p to_email=Enter the recipient's email address: 
    set /p subject=Enter the email subject: 
    set /p body=Enter the email body: 
    echo Sending email...
    :: Start stunnel to encrypt the email
    start /wait /b stunnel -config stunnel.conf
    blat -server 127.0.0.1 -port 7825 -u %from_email% -pw %password% -f %from_email% -t %to_email% -s %subject% -body %body% > nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Failed to send email.
        echo Please check your email settings and try again.
        pause
    ) else (
        echo Email sent successfully!
        pause
    )
    :: Stop stunnel
    taskkill /im stunnel.exe /f
    goto menu
) else if %choice% equ 2 (
    :: Send a mass email
    set /p to_email=Enter the recipient's email address: 
    set /p num_emails=Enter the number of emails to send: 

    for /l %%i in (1,1,%num_emails%) do (
        set "subject=Mass Email %%i of %num_emails%"
        set "body=This is a mass email sent using a the Echo Network Diagnostic Tool."
        echo Sending email %%i of %num_emails%...
        :: Start stunnel to encrypt the email
        start /wait /b stunnel -config stunnel.conf
        blat -server 127.0.0.1 -port 7825 -u %from_email% -pw %password% -f %from_email% -t %to_email% -s "!subject!" -body "!body!" > nul 2>&1
        if!errorlevel! neq 0 (
            echo Error: Failed to send email %%i.
        ) else (
            echo Email %%i sent successfully!
        )
        :: Stop stunnel
        taskkill /im stunnel.exe /f
    )
    pause
    goto menu
) else if %choice% equ 3 (
    exit /b 0
) else (
    echo Invalid choice. Please try again.
    pause
    goto menu
)

:shutdown
cls
type echo.txt
echo.
echo.
echo Shutting down...
pause
exit
