@echo off
chcp 65001 >nul
echo ================================
echo   COMPILE VA CHAY TEST
echo ================================
echo.

echo [1/2] Compiling...
javac -encoding UTF-8 -source 8 -target 8 -d build src/checkdatetime/*.java
if %errorlevel% neq 0 (
    echo ERROR: Compile failed!
    pause
    exit /b 1
)
echo OK - Compile thanh cong!
echo.

echo [2/2] Running tests...
echo.
java -cp build checkdatetime.TestDateTimeChecker
echo.

echo ================================
echo   HOAN THANH!
echo ================================
pause
