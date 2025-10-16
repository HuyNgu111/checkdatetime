@echo off
chcp 65001 > nul
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║     CI/CD THẤT BẠI - HƯỚNG DẪN SỬA LỖI               ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo ❌ Workflow đã chạy nhưng THẤT BẠI (icon đỏ)
echo.
echo ════════════════════════════════════════════════════════
echo    NGUYÊN NHÂN PHỔ BIẾN
echo ════════════════════════════════════════════════════════
echo.
echo 1. ❌ ĐƯỜNG DẪN FILE SAI (Linux vs Windows)
echo    - Linux dùng: build/classes:build/test-classes:lib/*
echo    - Workflow CI/CD chạy trên Linux (Ubuntu)
echo    - Có thể thiếu file hoặc đường dẫn sai
echo.
echo 2. ❌ FILE TEST Ở SAI VỊ TRÍ
echo    - Workflow tìm: DateTimeCheckerTest.java ở root
echo    - File thật ở: test/DateTimeCheckerTest.java
echo.
echo 3. ❌ COMPILE LỖI
echo    - Import sai
echo    - Encoding UTF-8 không được hỗ trợ đúng
echo.
echo ════════════════════════════════════════════════════════
echo    XEM LỖI CHI TIẾT
echo ════════════════════════════════════════════════════════
echo.
echo Để xem lỗi chính xác:
echo.
echo 1. Mở: https://github.com/HuyNgu111/checkdatetime/actions
echo 2. Click vào workflow run bị lỗi (icon đỏ ❌)
echo 3. Click vào job "build-and-test"
echo 4. Xem step nào bị lỗi (có icon đỏ)
echo 5. Click vào step đó để xem log chi tiết
echo.
echo Đang mở GitHub Actions...
start https://github.com/HuyNgu111/checkdatetime/actions
echo.
pause
echo.
echo ════════════════════════════════════════════════════════
echo    CÁCH SỬA PHỔ BIẾN NHẤT
echo ════════════════════════════════════════════════════════
echo.
echo VẤN ĐỀ: File test không ở đúng vị trí
echo.
echo GIẢI PHÁP: Copy file test vào root directory
echo.
echo Đang kiểm tra vị trí file test...
echo.

if exist "DateTimeCheckerTest.java" (
    echo ✅ File test đã có ở root directory
    echo    DateTimeCheckerTest.java
) else (
    echo ❌ File test KHÔNG có ở root directory
    echo.
    echo Checking test directory...
    if exist "test\DateTimeCheckerTest.java" (
        echo ✅ Tìm thấy ở: test\DateTimeCheckerTest.java
        echo.
        echo Copying to root...
        copy test\DateTimeCheckerTest.java DateTimeCheckerTest.java
        echo ✅ Copied successfully!
    ) else (
        echo ❌ Không tìm thấy file test!
    )
)

echo.
echo ════════════════════════════════════════════════════════
echo    SỬA WORKFLOW FILE
echo ════════════════════════════════════════════════════════
echo.
echo Workflow hiện tại có thể có vấn đề với đường dẫn.
echo.
echo Tôi sẽ tạo workflow file mới đã được sửa.
echo.
pause

echo Đang tạo workflow file mới...
echo.

REM Tạo workflow file đúng
mkdir .github\workflows 2>nul
echo name: Java CI with JUnit and JaCoCo Coverage > .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo on: >> .github\workflows\ci.yml
echo   push: >> .github\workflows\ci.yml
echo     branches: [ main, master, develop ] >> .github\workflows\ci.yml
echo   pull_request: >> .github\workflows\ci.yml
echo     branches: [ main, master, develop ] >> .github\workflows\ci.yml
echo   workflow_dispatch: >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo jobs: >> .github\workflows\ci.yml
echo   build-and-test: >> .github\workflows\ci.yml
echo     runs-on: ubuntu-latest >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     steps: >> .github\workflows\ci.yml
echo     - name: 📥 Checkout code >> .github\workflows\ci.yml
echo       uses: actions/checkout@v4 >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: ☕ Set up JDK 17 >> .github\workflows\ci.yml
echo       uses: actions/setup-java@v4 >> .github\workflows\ci.yml
echo       with: >> .github\workflows\ci.yml
echo         java-version: '17' >> .github\workflows\ci.yml
echo         distribution: 'temurin' >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 📁 Create build directories >> .github\workflows\ci.yml
echo       run: ^| >> .github\workflows\ci.yml
echo         mkdir -p build/classes >> .github\workflows\ci.yml
echo         mkdir -p build/test-classes >> .github\workflows\ci.yml
echo         mkdir -p coverage >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 🔨 Compile main source >> .github\workflows\ci.yml
echo       run: javac -encoding UTF-8 -cp "lib/*" -d build/classes src/DateTimeChecker.java >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 🧪 Compile test source >> .github\workflows\ci.yml
echo       run: javac -encoding UTF-8 -cp "lib/*:build/classes" -d build/test-classes DateTimeCheckerTest.java >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 🚀 Run tests with coverage >> .github\workflows\ci.yml
echo       run: ^| >> .github\workflows\ci.yml
echo         java -javaagent:lib/jacoco/jacocoagent.jar=destfile=coverage/jacoco.exec \ >> .github\workflows\ci.yml
echo           -cp "build/classes:build/test-classes:lib/*" \ >> .github\workflows\ci.yml
echo           org.junit.platform.console.ConsoleLauncher \ >> .github\workflows\ci.yml
echo           --scan-classpath --details=verbose >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 📊 Generate coverage report >> .github\workflows\ci.yml
echo       run: ^| >> .github\workflows\ci.yml
echo         java -jar lib/jacoco/jacococli.jar report coverage/jacoco.exec \ >> .github\workflows\ci.yml
echo           --classfiles build/classes \ >> .github\workflows\ci.yml
echo           --sourcefiles src \ >> .github\workflows\ci.yml
echo           --html coverage/html >> .github\workflows\ci.yml
echo. >> .github\workflows\ci.yml
echo     - name: 📤 Upload coverage report >> .github\workflows\ci.yml
echo       uses: actions/upload-artifact@v3 >> .github\workflows\ci.yml
echo       with: >> .github\workflows\ci.yml
echo         name: coverage-report >> .github\workflows\ci.yml
echo         path: coverage/html/ >> .github\workflows\ci.yml

echo ✅ Workflow file đã được tạo!
echo.
echo ════════════════════════════════════════════════════════
echo    COMMIT VÀ PUSH ĐỂ SỬA
echo ════════════════════════════════════════════════════════
echo.
echo Bây giờ cần commit và push để áp dụng fix.
echo.
set /p confirm="Bạn có muốn commit và push ngay không? (y/n): "

if /i "%confirm%"=="y" (
    echo.
    echo Đang add files...
    git add .github/workflows/ci.yml
    git add DateTimeCheckerTest.java 2>nul
    
    echo.
    echo Đang commit...
    git commit -m "Fix CI/CD workflow - correct file paths and dependencies"
    
    echo.
    echo Đang push...
    git push
    
    echo.
    echo ════════════════════════════════════════════════════════
    echo ✅ HOÀN TẤT!
    echo ════════════════════════════════════════════════════════
    echo.
    echo Workflow mới đã được push lên GitHub.
    echo GitHub Actions sẽ tự động chạy lại.
    echo.
    echo Xem kết quả tại:
    echo https://github.com/HuyNgu111/checkdatetime/actions
    echo.
    echo Đang mở GitHub Actions...
    start https://github.com/HuyNgu111/checkdatetime/actions
) else (
    echo.
    echo Bạn có thể commit thủ công sau:
    echo   git add .github/workflows/ci.yml DateTimeCheckerTest.java
    echo   git commit -m "Fix CI/CD workflow"
    echo   git push
)

echo.
echo ════════════════════════════════════════════════════════
pause
