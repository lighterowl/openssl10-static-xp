call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars32.bat"

REM https://devblogs.microsoft.com/cppblog/windows-xp-targeting-with-c-in-visual-studio-2012/
set INCLUDE=%ProgramFiles(x86)%\Microsoft SDKs\Windows\7.1A\Include;%INCLUDE%
set PATH=%ProgramFiles(x86)%\Microsoft SDKs\Windows\7.1A\Bin;%PATH%
set LIB=%ProgramFiles(x86)%\Microsoft SDKs\Windows\7.1A\Lib;%LIB%

mkdir C:\OpenSSL
perl Configure VC-WIN32 no-asm no-shared no-dso --prefix=C:/OpenSSL -arch:IA32 -D_USING_V110_SDK71_
call ms\do_ms
nmake -f ms\nt.mak
nmake -f ms\nt.mak install

cd /d C:\
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -sse OpenSSL-1.0.2u-Static-XP.7z OpenSSL
