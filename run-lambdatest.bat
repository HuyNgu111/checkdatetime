@echo off
chcp 65001 >nul
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║        LAMBDATEST AUTOMATION RUNNER                   ║
echo ║        DateTimeChecker Cloud Testing                  ║
echo ╚═══════════════════════════════════════════════════════╝
echo.

REM Kiểm tra Java
echo [Bước 1/5] Kiểm tra Java...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java không được tìm thấy!
    echo    Cài đặt Java từ: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)
echo ✅ Java đã cài đặt
echo.

REM Kiểm tra Maven
echo [Bước 2/5] Kiểm tra Maven...
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Maven không được tìm thấy!
    echo    Cài đặt Maven từ: https://maven.apache.org/download.cgi
    echo.
    echo    Hoặc chạy bằng Java trực tiếp:
    echo    javac -cp "selenium-libs/*" src/selenium/LambdaTestRunner.java
    echo    java -cp "selenium-libs/*;src" selenium.LambdaTestRunner
    pause
    exit /b 1
)
echo ✅ Maven đã cài đặt
echo.

REM Kiểm tra LambdaTest credentials
echo [Bước 3/5] Kiểm tra LambdaTest credentials...
if "%LAMBDATEST_USERNAME%"=="" (
    echo ⚠️  LAMBDATEST_USERNAME chưa được set
    echo.
    set /p LAMBDATEST_USERNAME="Nhập LambdaTest Username: "
    setx LAMBDATEST_USERNAME "%LAMBDATEST_USERNAME%" >nul 2>&1
)

if "%LAMBDATEST_ACCESS_KEY%"=="" (
    echo ⚠️  LAMBDATEST_ACCESS_KEY chưa được set
    echo.
    set /p LAMBDATEST_ACCESS_KEY="Nhập LambdaTest Access Key: "
    setx LAMBDATEST_ACCESS_KEY "%LAMBDATEST_ACCESS_KEY%" >nul 2>&1
)

echo ✅ Credentials:
echo    Username: %LAMBDATEST_USERNAME%
echo    Access Key: %LAMBDATEST_ACCESS_KEY:~0,10%***
echo.
echo 💡 Lấy credentials tại: https://accounts.lambdatest.com/profile
echo.

REM Cài đặt dependencies
echo [Bước 4/5] Cài đặt dependencies (Selenium, TestNG)...
call mvn clean install -DskipTests -q
if %errorlevel% neq 0 (
    echo ❌ Maven install thất bại!
    echo    Kiểm tra pom.xml và internet connection
    pause
    exit /b 1
)
echo ✅ Dependencies đã được cài đặt
echo.

REM Compile code
echo [Bước 5/5] Compile test code...
call mvn compile -q
if %errorlevel% neq 0 (
    echo ❌ Compilation thất bại!
    pause
    exit /b 1
)
echo ✅ Code đã được compile
echo.

echo ╔═══════════════════════════════════════════════════════╗
echo ║           CHẠY TESTS TRÊN LAMBDATEST CLOUD            ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo 🌐 Tests sẽ chạy song song trên 5 browsers:
echo    1. Chrome on Windows 10
echo    2. Firefox on Windows 10
echo    3. Edge on Windows 10
echo    4. Safari on macOS Monterey
echo    5. Chrome on macOS Monterey
echo.
echo 📊 Xem real-time tại: https://automation.lambdatest.com/timeline
echo.

REM Chọn chế độ chạy
echo Chọn chế độ chạy:
echo [1] Chạy 1 browser (nhanh - Chrome on Windows)
echo [2] Chạy tất cả 5 browsers song song (đầy đủ)
echo.
set /p mode="Nhập lựa chọn (1 hoặc 2): "

if "%mode%"=="1" (
    echo.
    echo 🚀 Chạy test trên Chrome Windows 10...
    echo.
    call mvn exec:java -Dexec.mainClass="selenium.LambdaTestRunner" -Dexec.args="Chrome latest 'Windows 10'"
) else (
    echo.
    echo 🚀 Chạy tests song song trên 5 browsers...
    echo.
    call mvn test -DsuiteXmlFile=testng.xml
)

if %errorlevel% equ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════╗
    echo ║              ✅ TESTS HOÀN THÀNH THÀNH CÔNG!          ║
    echo ╚═══════════════════════════════════════════════════════╝
    echo.
    echo 📊 Xem chi tiết kết quả tại:
    echo    https://automation.lambdatest.com/timeline
    echo.
    echo 🎥 Video recordings và screenshots có sẵn trong dashboard
    echo 📈 Network logs và console logs đã được ghi lại
    echo.
) else (
    echo.
    echo ╔═══════════════════════════════════════════════════════╗
    echo ║              ❌ MỘT SỐ TESTS THẤT BẠI                 ║
    echo ╚═══════════════════════════════════════════════════════╝
    echo.
    echo 🔍 Kiểm tra logs phía trên để biết chi tiết
    echo 📊 Xem dashboard: https://automation.lambdatest.com/timeline
    echo.
)

pause
