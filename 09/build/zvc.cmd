@echo off
Color A

:: …Ë÷√ VS ±‡“Îª∑æ≥
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\vsdevcmd.bat" -no_logo -arch=x86

cmake -G "Visual Studio 17 2022" -Thost=x86  -A Win32 ..

cmake .

MSBuild.exe sqlite3.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
  /target:Build /property:Configuration=Release;Platform=Win32^
  /flp1:LogFile=zxerr.log;Verbosity=diagnostic;errorsonly^
  /flp2:LogFile=zxwas.log;Verbosity=diagnostic;warningsonly

cmake --build . --config Release --target install

pause
