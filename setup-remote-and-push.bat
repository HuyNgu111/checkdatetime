@echo off
chcp 65001 > nul
echo ========================================
echo    SETUP REMOTE VÀ PUSH
echo ========================================
echo.

echo Kiểm tra remote repository...
git remote -v

echo.
set has_remote=0
for /f %%i in ('git remote') do set has_remote=1

if %has_remote%==0 (
    echo ❌ CHƯA CÓ REMOTE REPOSITORY!
    echo.
    echo ========================================
    echo    HƯỚNG DẪN THÊM REMOTE
    echo ========================================
    echo.
    echo Bước 1: Tạo repository trên GitHub
    echo    - Vào: https://github.com/new
    echo    - Tên repository: checkdatetime (hoặc tên khác)
    echo    - Public hoặc Private (tùy chọn)
    echo    - KHÔNG tick "Initialize with README"
    echo    - Click "Create repository"
    echo.
    echo Bước 2: Copy URL repository
    echo    Sau khi tạo, GitHub sẽ hiện URL dạng:
    echo    https://github.com/username/checkdatetime.git
    echo.
    echo ========================================
    echo.
    set /p repo_url="Paste Repository URL vào đây: "
    
    echo.
    echo Đang thêm remote repository...
    git remote add origin !repo_url!
    
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Remote added successfully!
        echo.
        git remote -v
    ) else (
        echo ❌ Failed to add remote!
        pause
        exit /b 1
    )
) else (
    echo ✅ Remote repository đã tồn tại:
    git remote -v
)

echo.
echo ========================================
echo    CHUẨN BỊ PUSH
echo ========================================

echo.
echo [1/4] Kiểm tra thay đổi...
git status --short

echo.
echo [2/4] Thêm tất cả files...
git add .

echo.
echo [3/4] Tạo commit (nếu có thay đổi)...
git diff-index --quiet HEAD
if %ERRORLEVEL% NEQ 0 (
    git commit -m "Update: Add helper scripts and documentation for GitHub setup"
    echo ✅ Commit created
) else (
    echo ℹ No changes to commit
)

echo.
echo [4/4] Push to GitHub...
echo.
echo ========================================
echo    ⚠️ QUAN TRỌNG - XÁC THỰC
echo ========================================
echo.
echo Khi Git hỏi Username và Password:
echo.
echo   Username: [Nhập GitHub username của bạn]
echo   Password: [PASTE Personal Access Token]
echo.
echo ⚠️ LƯU Ý:
echo   - Password KHÔNG PHẢI là password GitHub
echo   - Phải dùng Personal Access Token
echo   - Nếu chưa có token, xem file: TOKEN_GUIDE.md
echo.
echo Tạo token tại: https://github.com/settings/tokens
echo.
echo ========================================
echo.
pause
echo.
echo Đang push...
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✅✅✅ PUSH THÀNH CÔNG! ✅✅✅
    echo ========================================
    echo.
    echo Code đã được push lên GitHub!
    echo.
    echo 📋 Bước tiếp theo:
    echo.
    echo 1. Mở repository trên GitHub
    for /f "tokens=2" %%i in ('git remote get-url origin') do echo    %%i
    echo.
    echo 2. Vào tab "Actions" để xem CI/CD workflow chạy
    echo    - Workflow sẽ tự động compile code
    echo    - Chạy 15 test cases
    echo    - Tạo coverage report
    echo.
    echo 3. Download coverage report từ "Artifacts"
    echo    - Chờ workflow chạy xong (khoảng 1-2 phút)
    echo    - Vào workflow run
    echo    - Tab "Artifacts" → Download "coverage-report"
    echo.
    echo ========================================
    echo.
    echo 🎉 HOÀN THÀNH! Repository của bạn đã sẵn sàng!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ❌ PUSH THẤT BẠI
    echo ========================================
    echo.
    echo Các nguyên nhân có thể:
    echo.
    echo 1. ❌ AUTHENTICATION FAILED (Phổ biến nhất)
    echo    Nguyên nhân:
    echo    - Dùng password thay vì token
    echo    - Token hết hạn
    echo    - Token thiếu quyền
    echo.
    echo    Giải pháp:
    echo    a. Tạo token mới:
    echo       - Vào: https://github.com/settings/tokens
    echo       - Generate new token (classic)
    echo       - Tick: ✅ repo (full control)
    echo       - Copy token
    echo.
    echo    b. Chạy lại script này
    echo       .\setup-remote-and-push.bat
    echo.
    echo    c. Paste token khi hỏi password
    echo.
    echo 2. ❌ REPOSITORY KHÔNG TỒN TẠI
    echo    Giải pháp:
    echo    - Tạo repository trên GitHub
    echo    - Vào: https://github.com/new
    echo.
    echo 3. ❌ REMOTE URL SAI
    echo    Kiểm tra: git remote -v
    echo    Sửa: git remote set-url origin [URL_ĐÚNG]
    echo.
    echo 4. ❌ NETWORK/FIREWALL ISSUES
    echo    - Kiểm tra kết nối internet
    echo    - Kiểm tra firewall/antivirus
    echo.
    echo ========================================
    echo.
    echo 🔧 Debug commands:
    echo    git remote -v          (xem remote URL)
    echo    git status             (xem trạng thái)
    echo    git log --oneline -3   (xem commits)
    echo.
    echo 💡 Thử push với verbose output:
    echo    git push -u origin main --verbose
    echo.
    echo ========================================
)

echo.
pause
