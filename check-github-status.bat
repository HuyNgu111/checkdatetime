@echo off
chcp 65001 > nul
echo ========================================
echo    KIỂM TRA TRẠNG THÁI GITHUB
echo ========================================
echo.

REM Kiểm tra Git đã cài chưa
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ GIT CHƯA ĐƯỢC CÀI ĐẶT
    echo.
    echo Để push lên GitHub, bạn cần:
    echo.
    echo 1. Tải Git từ: https://git-scm.com/download/win
    echo 2. Chạy file cài đặt
    echo 3. Restart PowerShell
    echo 4. Chạy lại script này
    echo.
    echo Sau khi cài Git, chạy: push-to-github.bat
    echo.
    pause
    exit /b 1
)

echo ✅ Git đã được cài đặt
git --version
echo.

REM Kiểm tra repository đã init chưa
if not exist ".git" (
    echo ❌ Repository chưa được khởi tạo
    echo.
    echo Để push lên GitHub, chạy: push-to-github.bat
    echo.
    pause
    exit /b 0
)

echo ✅ Repository đã được khởi tạo
echo.

REM Kiểm tra remote
echo Kiểm tra remote repository...
git remote -v
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Chưa có remote repository
    echo.
    echo Để thêm remote, chạy: push-to-github.bat
    echo.
) else (
    echo.
    echo ✅ Remote repository đã được cấu hình
)

echo.
echo Kiểm tra status...
git status

echo.
echo Kiểm tra commits...
git log --oneline -5 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Chưa có commit nào
) else (
    echo.
    echo ✅ Có commits
)

echo.
echo Kiểm tra branch...
git branch -a

echo.
echo ========================================
echo           TỔNG KẾT
echo ========================================

REM Kiểm tra xem đã push chưa
git ls-remote origin HEAD >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ ĐÃ PUSH LÊN GITHUB THÀNH CÔNG!
    echo.
    echo Kiểm tra repository của bạn tại:
    git remote get-url origin
    echo.
    echo GitHub Actions sẽ tự động chạy tests
    echo Xem kết quả tại: [YOUR_REPO]/actions
) else (
    echo ❌ CHƯA PUSH LÊN GITHUB
    echo.
    echo Để push, chạy: push-to-github.bat
)

echo ========================================
echo.
pause
