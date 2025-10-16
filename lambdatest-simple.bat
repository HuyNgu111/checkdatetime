@echo off
chcp 65001 >nul
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║     LAMBDATEST AUTOMATION - SIMPLE DEMO               ║
echo ╚═══════════════════════════════════════════════════════╝
echo.

echo 📊 Credentials Check:
echo    Username: %LAMBDATEST_USERNAME%
echo    Access Key: %LAMBDATEST_ACCESS_KEY:~0,15%***
echo.

if "%LAMBDATEST_USERNAME%"=="" (
    echo ❌ LAMBDATEST_USERNAME chưa được set!
    pause
    exit /b 1
)

if "%LAMBDATEST_ACCESS_KEY%"=="" (
    echo ❌ LAMBDATEST_ACCESS_KEY chưa được set!
    pause
    exit /b 1
)

echo ✅ Credentials OK!
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║           📚 HƯỚNG DẪN SỬ DỤNG LAMBDATEST            ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo Để chạy automation tests trên LambdaTest, bạn có 3 cách:
echo.
echo 🔷 CÁCH 1: Dùng Maven (Khuyến nghị)
echo ═══════════════════════════════════════════════════════
echo 1. Set JAVA_HOME:
echo    - Tìm Java installation folder
echo    - Set: set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_xxx
echo.
echo 2. Chạy:
echo    mvn clean compile exec:java ^
echo      -Dexec.mainClass="selenium.LambdaTestRunner"
echo.
echo.
echo 🔷 CÁCH 2: Dùng LambdaTest Tunnel
echo ═══════════════════════════════════════════════════════
echo 1. Download: https://downloads.lambdatest.com/tunnel/v3/windows/64bit/LT_Windows.zip
echo 2. Extract và chạy:
echo    LT.exe -user %LAMBDATEST_USERNAME% -key %LAMBDATEST_ACCESS_KEY%
echo 3. Test local apps
echo.
echo.
echo 🔷 CÁCH 3: Dùng LambdaTest Web UI
echo ═══════════════════════════════════════════════════════
echo 1. Vào: https://automation.lambdatest.com/build
echo 2. Click "Start Test"
echo 3. Chọn browser và OS
echo 4. Nhập URL để test
echo 5. Chạy automated tests từ UI
echo.
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║           🌐 LAMBDATEST DASHBOARD                     ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo 📊 Timeline: https://automation.lambdatest.com/timeline
echo 🎥 Builds: https://automation.lambdatest.com/build
echo ⚙️  Profile: https://accounts.lambdatest.com/profile
echo 📚 Docs: https://www.lambdatest.com/support/docs/
echo.
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║           💡 QUICK START - NO MAVEN                   ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo Nếu không muốn dùng Maven, bạn có thể:
echo.
echo 1️⃣ Dùng LambdaTest Web Interface
echo    → Không cần code, click vào UI để test
echo    → Link: https://automation.lambdatest.com/build
echo.
echo 2️⃣ Dùng LambdaTest Real Device Testing
echo    → Test trên thiết bị thật
echo    → Link: https://www.lambdatest.com/real-device-cloud
echo.
echo 3️⃣ Dùng Browser Testing (Manual)
echo    → Test thủ công trên browsers
echo    → Link: https://www.lambdatest.com/live-testing
echo.
echo.
echo 📝 Your credentials được lưu trong environment variables:
echo    LAMBDATEST_USERNAME=%LAMBDATEST_USERNAME%
echo    LAMBDATEST_ACCESS_KEY=%LAMBDATEST_ACCESS_KEY:~0,15%***
echo.
echo ✅ Bạn đã sẵn sàng sử dụng LambdaTest!
echo.
echo 🔗 Mở dashboard?
choice /C YN /M "Mở LambdaTest dashboard trong browser"
if errorlevel 2 goto end
if errorlevel 1 start https://automation.lambdatest.com/timeline

:end
pause
