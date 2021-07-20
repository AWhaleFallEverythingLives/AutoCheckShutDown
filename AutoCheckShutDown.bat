@echo off
:start
cls
del /f /s /q C:\AutoCheckShutDown\Test.txt
for /f %%d in (C:\AutoCheckShutDown\ip.txt) do ( ping %%d >> C:\AutoCheckShutDown\Test.txt) 
findstr "TTL" C:\AutoCheckShutDown\Test.txt
  if %errorlevel% equ 0 (
    echo 找到
    ) else (
    echo 没有找到
    goto end
  )
echo This is a loop
timeout /t 2
goto start
:end
shutdown -s -t 300
pause