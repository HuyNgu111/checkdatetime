@echo off
chcp 65001 > nul
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║     CI/CD VẪN THẤT BẠI - DEBUG                        ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo ❌ Workflow thất bại với: Exit code 1
echo.
echo ════════════════════════════════════════════════════════
echo    NGUYÊN NHÂN PHỔ BIẾN
echo ════════════════════════════════════════════════════════
echo.
echo 1. FILE TEST KHÔNG TÌM THẤY
echo    - DateTimeCheckerTest.java không ở root
echo    - Không ở test/ directory
echo.
echo 2. COMPILE ERROR
echo    - Import sai
echo    - Syntax error
echo.
echo 3. TESTS FAILED
echo    - Một hoặc nhiều test cases fail
echo    - Assertion errors
echo.
echo ════════════════════════════════════════════════════════
echo    KIỂM TRA LOCAL TRƯỚC
echo ════════════════════════════════════════════════════════
echo.
echo Hãy test local để tìm lỗi:
echo.
set /p run_local="Bạn có muốn chạy test local không? (y/n): "

if /i "%run_local%"=="y" (
    echo.
    echo Đang chạy tests local...
    echo.
    call run-15-tests.bat
    echo.
    echo Nếu local test PASS → Vấn đề ở workflow
    echo Nếu local test FAIL → Vấn đề ở code/tests
    echo.
    pause
)

echo.
echo ════════════════════════════════════════════════════════
echo    KIỂM TRA CẤU TRÚC FILE
echo ════════════════════════════════════════════════════════
echo.
echo Checking file structure...
echo.

echo [✓] Checking DateTimeChecker.java...
if exist "src\DateTimeChecker.java" (
    echo     ✅ src\DateTimeChecker.java - OK
) else (
    echo     ❌ src\DateTimeChecker.java - NOT FOUND!
)

echo.
echo [✓] Checking DateTimeCheckerTest.java...
if exist "DateTimeCheckerTest.java" (
    echo     ✅ DateTimeCheckerTest.java - OK (in root)
) else (
    echo     ⚠️  DateTimeCheckerTest.java - NOT in root
    if exist "test\DateTimeCheckerTest.java" (
        echo     ✅ test\DateTimeCheckerTest.java - FOUND
        echo.
        echo     GIẢI PHÁP: Copy test file vào root
        set /p copy_test="     Copy file test vào root? (y/n): "
        if /i "!copy_test!"=="y" (
            copy test\DateTimeCheckerTest.java DateTimeCheckerTest.java
            echo     ✅ Copied!
        )
    ) else (
        echo     ❌ test\DateTimeCheckerTest.java - NOT FOUND!
    )
)

echo.
echo [✓] Checking libraries...
if exist "lib" (
    echo     ✅ lib directory - OK
    dir /b lib 2>nul | findstr /i "junit" >nul
    if %ERRORLEVEL% EQU 0 (
        echo     ✅ JUnit libraries - OK
    ) else (
        echo     ❌ JUnit libraries - NOT FOUND
    )
    dir /b lib\jacoco 2>nul | findstr /i "jacoco" >nul
    if %ERRORLEVEL% EQU 0 (
        echo     ✅ JaCoCo libraries - OK
    ) else (
        echo     ❌ JaCoCo libraries - NOT FOUND
    )
) else (
    echo     ❌ lib directory - NOT FOUND!
)

echo.
echo ════════════════════════════════════════════════════════
echo    GIẢI PHÁP
echo ════════════════════════════════════════════════════════
echo.
echo OPTION 1: Đảm bảo file test ở đúng vị trí
echo.

if not exist "DateTimeCheckerTest.java" (
    if exist "test\DateTimeCheckerTest.java" (
        echo Copying test file to root...
        copy test\DateTimeCheckerTest.java DateTimeCheckerTest.java
        echo ✅ Test file copied
        echo.
        set /p commit_now="Commit và push ngay? (y/n): "
        if /i "!commit_now!"=="y" (
            git add DateTimeCheckerTest.java
            git commit -m "Add test file to root directory for CI/CD"
            git push
            echo.
            echo ✅ Pushed! Workflow sẽ chạy lại.
            echo.
            echo Mở Actions để xem:
            start https://github.com/HuyNgu111/checkdatetime/actions
        )
    )
)

echo.
echo OPTION 2: Xem log chi tiết trên GitHub
echo.
echo 1. Mở: https://github.com/HuyNgu111/checkdatetime/actions
echo 2. Click vào workflow run bị lỗi (icon đỏ)
echo 3. Click "build-and-test"
echo 4. Tìm step có icon đỏ
echo 5. Click để xem log đầy đủ
echo 6. Copy lỗi và báo lại
echo.

set /p open_actions="Mở GitHub Actions ngay? (y/n): "
if /i "%open_actions%"=="y" (
    start https://github.com/HuyNgu111/checkdatetime/actions
)

echo.
echo ════════════════════════════════════════════════════════
echo    DEBUG COMMANDS
echo ════════════════════════════════════════════════════════
echo.
echo Để debug thêm:
echo.
echo # Compile và test local
echo   .\run-15-tests.bat
echo.
echo # Kiểm tra Git status
echo   git status
echo.
echo # Xem workflow file
echo   type .github\workflows\ci.yml
echo.
echo # Compile thủ công như CI
echo   javac -cp "lib/*" -d build/classes src/DateTimeChecker.java
echo   javac -cp "lib/*;build/classes" -d build/test-classes DateTimeCheckerTest.java
echo.
echo ════════════════════════════════════════════════════════
pause
