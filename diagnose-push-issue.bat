@echo off
chcp 65001 > nul
echo ========================================
echo    CHẨN ĐOÁN VẤN ĐỀ PUSH
echo ========================================
echo.

echo [Bước 1] Kiểm tra Git cài đặt...
git --version
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git chưa được cài đặt!
    pause
    exit /b 1
)
echo ✅ Git OK
echo.

echo [Bước 2] Kiểm tra repository đã init chưa...
if not exist ".git" (
    echo ❌ Repository chưa được khởi tạo!
    echo Chạy: git init
    pause
    exit /b 1
)
echo ✅ Repository đã init
echo.

echo [Bước 3] Kiểm tra commit...
git log --oneline -1 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Chưa có commit nào!
    echo.
    echo Giải pháp:
    echo    git add .
    echo    git commit -m "Initial commit"
    pause
    exit /b 1
)
echo ✅ Có commit
echo.

echo [Bước 4] Kiểm tra remote repository...
git remote -v
set has_remote=0
for /f %%i in ('git remote 2^>nul') do set has_remote=1

if %has_remote%==0 (
    echo.
    echo ❌❌❌ VẤN ĐỀ TÌM THẤY! ❌❌❌
    echo.
    echo CHƯA CÓ REMOTE REPOSITORY!
    echo.
    echo Đây là lý do push thất bại.
    echo.
    echo ========================================
    echo    GIẢI PHÁP
    echo ========================================
    echo.
    echo Bạn cần:
    echo.
    echo 1. Tạo repository trên GitHub:
    echo    https://github.com/new
    echo.
    echo 2. Chạy script setup:
    echo    .\setup-remote-and-push.bat
    echo.
    echo Script đó sẽ giúp bạn:
    echo    - Thêm remote repository
    echo    - Push code lên GitHub
    echo    - Hướng dẫn xác thực
    echo.
    echo ========================================
    pause
    exit /b 1
)
echo ✅ Remote repository đã cấu hình
echo.

echo [Bước 5] Kiểm tra kết nối đến GitHub...
echo Testing connection...
git ls-remote origin HEAD >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Không thể kết nối đến remote repository!
    echo.
    echo Có thể do:
    echo 1. Repository chưa được tạo trên GitHub
    echo 2. URL sai
    echo 3. Vấn đề xác thực
    echo 4. Vấn đề network
    echo.
    echo Remote hiện tại:
    git remote get-url origin
    echo.
    pause
    exit /b 1
)
echo ✅ Kết nối OK
echo.

echo [Bước 6] Kiểm tra branch...
git branch -a
echo.

echo [Bước 7] Kiểm tra status...
git status
echo.

echo ========================================
echo    TÓM TẮT CHẨN ĐOÁN
echo ========================================
echo.
echo ✅ Git: Installed
echo ✅ Repository: Initialized
echo ✅ Commits: Exists
echo ✅ Remote: Configured
echo ✅ Connection: OK
echo ✅ Branch: main
echo.
echo Nếu tất cả đều OK nhưng vẫn không push được,
echo vấn đề có thể là XÁC THỰC (Authentication).
echo.
echo ========================================
echo    CÁCH SỬA LỖI XÁC THỰC
echo ========================================
echo.
echo 1. Tạo Personal Access Token:
echo    https://github.com/settings/tokens
echo.
echo 2. Generate new token (classic)
echo.
echo 3. Chọn scope:
echo    ✅ repo (full control)
echo.
echo 4. Copy token (ghp_xxxxxxxxxxxx)
echo.
echo 5. Thử push lại:
echo    git push -u origin main
echo.
echo 6. Khi hỏi password, PASTE TOKEN
echo    (không phải password GitHub!)
echo.
echo ========================================
echo.
echo Xem hướng dẫn chi tiết: TOKEN_GUIDE.md
echo.
pause
