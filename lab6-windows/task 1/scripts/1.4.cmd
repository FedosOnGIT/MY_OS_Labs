for /f %%i in ('dir /b') do if not "%%i"=="last.log" del "%%i"
cd ..