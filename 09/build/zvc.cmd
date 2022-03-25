@echo off

cmake -G "Visual Studio 16 2019" -Thost=x86  -A Win32 ..
pause

cmake .
cmake --build . --config Release --target install
