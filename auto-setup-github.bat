@echo off
chcp 65001 > nul
echo ========================================
echo  HƯỚNG DẪN TẠO REPOSITORY VÀ PUSH
echo ========================================
echo.
echo Tôi sẽ mở trang GitHub để bạn tạo repository
echo.
pause
echo.
echo Đang mở GitHub...
start https://github.com/new
echo.
echo ========================================
echo    HƯỚNG DẪN TẠO REPOSITORY
echo ========================================
echo.
echo 1. Trên trang GitHub vừa mở:
echo.
echo    Repository name: checkdatetime
echo    Description: DateTimeChecker with JUnit and Coverage
echo    
echo    ⚠️ QUAN TRỌNG:
echo    - Chọn Public (hoặc Private tùy ý)
echo    - ❌ KHÔNG tick "Add a README file"
echo    - ❌ KHÔNG chọn .gitignore
echo    - ❌ KHÔNG chọn license
echo.
echo 2. Click nút "Create repository" (màu xanh)
echo.
echo 3. Sau khi tạo xong, GitHub sẽ hiện URL dạng:
echo    https://github.com/USERNAME/checkdatetime.git
echo.
echo 4. Copy URL đó và quay lại đây
echo.
echo ========================================
echo.
set /p repo_url="Paste Repository URL vào đây: "

if "%repo_url%"=="" (
    echo.
    echo ❌ Bạn chưa nhập URL!
    pause
    exit /b 1
)

echo.
echo ========================================
echo    ĐANG CẤU HÌNH VÀ PUSH
echo ========================================
echo.

echo [1/5] Thêm remote repository...
git remote add origin %repo_url%
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️ Remote đã tồn tại, đang cập nhật...
    git remote set-url origin %repo_url%
)
echo ✅ Remote added: %repo_url%
echo.

echo [2/5] Kiểm tra remote...
git remote -v
echo.

echo [3/5] Add tất cả files mới...
git add .
echo ✅ Files added
echo.

echo [4/5] Commit changes (nếu có)...
git diff-index --quiet HEAD 2>nul
if %ERRORLEVEL% NEQ 0 (
    git commit -m "Add helper scripts and documentation"
    echo ✅ Commit created
) else (
    echo ℹ️ No new changes to commit
)
echo.

echo [5/5] Push to GitHub...
echo.
echo ========================================
echo      ⚠️ XÁC THỰC QUAN TRỌNG ⚠️
echo ========================================
echo.
echo Git sẽ hỏi Username và Password.
echo.
echo ✅ Username: Nhập GitHub username của bạn
echo.
echo ❌ Password: KHÔNG PHẢI là password GitHub!
echo ✅ Password: Phải dùng Personal Access Token
echo.
echo Nếu chưa có token:
echo 1. Mở tab mới: https://github.com/settings/tokens
echo 2. Click "Generate new token (classic)"
echo 3. Note: Git Access
echo 4. Tick: ✅ repo (full control)
echo 5. Click "Generate token"
echo 6. Copy token (ghp_xxxxxxxxxxxxx)
echo 7. Quay lại đây và paste token khi hỏi password
echo.
echo ========================================
echo.
echo Đang mở trang tạo token...
timeout /t 2 /nobreak >nul
start https://github.com/settings/tokens
echo.
pause
echo.
echo Đang push...
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✅✅✅ PUSH THÀNH CÔNG! ✅✅✅
    echo ========================================
    echo.
    echo 🎉 Code đã được push lên GitHub!
    echo.
    echo 📋 Bước tiếp theo:
    echo.
    echo 1. Xem repository: %repo_url:.git=%
    echo.
    echo 2. Tab "Actions" - CI/CD tự động chạy:
    echo    - Compile code
    echo    - Run 15 test cases
    echo    - Generate coverage report
    echo.
    echo 3. Download coverage report từ Artifacts
    echo.
    echo ========================================
    echo.
    echo Đang mở repository trên GitHub...
    start %repo_url:.git=%
    echo.
) else (
    echo.
    echo ========================================
    echo     ❌ PUSH THẤT BẠI
    echo ========================================
    echo.
    echo Nguyên nhân phổ biến:
    echo.
    echo 1. ❌ Dùng password thay vì token
    echo    → Phải dùng Personal Access Token!
    echo.
    echo 2. ❌ Token hết hạn hoặc thiếu quyền
    echo    → Tạo token mới với quyền "repo"
    echo.
    echo 3. ❌ Repository chưa tồn tại
    echo    → Kiểm tra lại URL: %repo_url%
    echo.
    echo ========================================
    echo    CÁCH SỬA
    echo ========================================
    echo.
    echo Option 1: Thử lại với token đúng
    echo    git push -u origin main
    echo.
    echo Option 2: Chạy lại script này
    echo    .\auto-setup-github.bat
    echo.
    echo Option 3: Xem hướng dẫn chi tiết
    echo    type TOKEN_GUIDE.md
    echo.
    echo ========================================
)

echo.
pause
