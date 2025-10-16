@echo off
chcp 65001 >nul
echo =========================================
echo   SETUP JUNIT TESTS VA CHAY COVERAGE
echo =========================================
echo.

echo [Step 1/4] Checking Java...
java -version
if %errorlevel% neq 0 (
    echo ERROR: Java chua duoc cai dat!
    pause
    exit /b 1
)
echo OK - Java da san sang!
echo.

echo [Step 2/4] Checking Maven...
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Maven chua duoc cai dat!
    echo.
    echo Ban can cai Maven truoc:
    echo 1. Download tai: https://maven.apache.org/download.cgi
    echo 2. Hoac dung: choco install maven
    echo.
    pause
    exit /b 1
)
echo OK - Maven da san sang!
echo.

echo [Step 3/4] Installing dependencies...
echo (Dang tai JUnit 5 va JaCoCo...)
call mvn clean install -DskipTests
if %errorlevel% neq 0 (
    echo ERROR: Khong the tai dependencies!
    pause
    exit /b 1
)
echo OK - Dependencies da duoc cai dat!
echo.

echo [Step 4/4] Running tests with coverage...
echo.
call mvn test jacoco:report
if %errorlevel% neq 0 (
    echo ERROR: Tests that bai!
    pause
    exit /b 1
)
echo.

echo =========================================
echo   HOAN THANH!
echo =========================================
echo.
echo Coverage report da duoc tao tai:
echo   target\site\jacoco\index.html
echo.
echo Mo file tren bang browser de xem chi tiet!
echo.
pause
