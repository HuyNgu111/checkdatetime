@echo off
chcp 65001 >nul
echo ================================
echo   CHAY CHUONG TRINH CHINH
echo ================================
echo.

echo [1/2] Compiling...
javac -encoding UTF-8 -source 8 -target 8 -d build src/checkdatetime/DateTimeChecker.java
if %errorlevel% neq 0 (
    echo ERROR: Compile failed!
    pause
    exit /b 1
)
echo OK - Compile thanh cong!
echo.

echo [2/2] Running main program...
echo.
java -cp build checkdatetime.DateTimeChecker
echo.

echo ================================
pause
