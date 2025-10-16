@echo off
chcp 65001 >nul
echo ============================================================
echo   CHAY TEST VA TAO COVERAGE REPORT
echo ============================================================
echo.

echo [Buoc 1/4] Kiem tra Java...
java -version 2>&1 | findstr "version" >nul
if %errorlevel% neq 0 (
    echo ERROR: Java chua duoc cai dat!
    echo Vui long cai Java 8 hoac cao hon.
    pause
    exit /b 1
)
echo OK - Java da san sang!
echo.

echo [Buoc 2/4] Kiem tra Maven...
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo CHUA CO MAVEN - Se chay tests don gian...
    goto :simple_test
)
echo OK - Maven da san sang!
echo.

echo [Buoc 3/4] Download dependencies (JUnit 5 + JaCoCo)...
call mvn clean install -DskipTests -q
if %errorlevel% neq 0 (
    echo WARNING: Maven install gap loi, thu chay tests don gian...
    goto :simple_test
)
echo OK - Dependencies da duoc tai!
echo.

echo [Buoc 4/4] Chay tests va tao Coverage Report...
echo.
call mvn test jacoco:report
if %errorlevel% neq 0 (
    echo ERROR: Tests that bai!
    pause
    exit /b 1
)
echo.

echo ============================================================
echo   HOAN THANH! Coverage Report da duoc tao!
echo ============================================================
echo.
echo 📊 Coverage Report HTML:
echo    target\site\jacoco\index.html
echo.
echo 📄 Coverage XML:
echo    target\site\jacoco\jacoco.xml
echo.
echo 📝 Test Results:
echo    target\surefire-reports\
echo.
echo Hay mo file index.html trong browser de xem chi tiet!
echo.

REM Mo report trong browser
if exist "target\site\jacoco\index.html" (
    echo Mo Coverage Report trong browser...
    start "" "target\site\jacoco\index.html"
)

goto :end

:simple_test
echo.
echo ============================================================
echo   CHAY TESTS DON GIAN (Khong co Maven)
echo ============================================================
echo.
echo [1/2] Compiling...
javac -encoding UTF-8 -source 8 -target 8 -d build src/checkdatetime/*.java
if %errorlevel% neq 0 (
    echo ERROR: Compile that bai!
    pause
    exit /b 1
)
echo OK - Compile thanh cong!
echo.

echo [2/2] Running tests...
echo.
java -cp build checkdatetime.TestDateTimeChecker
echo.
echo ============================================================
echo   LUU Y: Can Maven de tao Coverage Report HTML!
echo ============================================================
echo.
echo De cai Maven:
echo   1. Download: https://maven.apache.org/download.cgi
echo   2. Hoac dung: choco install maven
echo.
echo Sau khi cai Maven, chay lai script nay!
echo.

:end
pause
