@echo off
chcp 65001 > nul
echo ========================================
echo    SỬA LỖI VÀ PUSH LẠI
echo ========================================
echo.

echo [1/5] Kiểm tra Git status...
git status
echo.

echo [2/5] Kiểm tra commit hiện tại...
git log --oneline -1 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ⚠ Chưa có commit! Tạo commit mới...
    echo.
    echo Adding all files...
    git add .
    echo.
    echo Creating commit...
    git commit -m "Initial commit: DateTimeChecker project with 15 JUnit tests, JaCoCo coverage, and CI/CD workflow"
    
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo ❌ Không thể tạo commit!
        echo Có thể không có file nào thay đổi.
        echo.
        pause
        exit /b 1
    )
    echo ✓ Commit created successfully
) else (
    echo ✓ Commit already exists
)

echo.
echo [3/5] Kiểm tra remote repository...
git remote -v
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Chưa có remote repository!
    echo Please enter your GitHub repository URL:
    echo Example: https://github.com/username/checkdatetime.git
    set /p remote_url="Repository URL: "
    git remote add origin %remote_url%
    echo ✓ Remote added
)

echo.
echo [4/5] Đổi tên branch thành main...
git branch -M main
echo ✓ Branch renamed to main

echo.
echo [5/5] Pushing to GitHub...
echo.
echo Attempting to push...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✅ PUSH THÀNH CÔNG!
    echo ========================================
    echo.
    echo Code đã được push lên GitHub!
    echo.
    echo Bước tiếp theo:
    echo 1. Mở repository trên GitHub
    echo 2. Vào tab "Actions" để xem CI/CD chạy
    echo 3. Download coverage report từ Artifacts
    echo.
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ❌ PUSH VẪN THẤT BẠI
    echo ========================================
    echo.
    echo Có thể do:
    echo.
    echo 1. LỖI XÁC THỰC (Authentication)
    echo    Giải pháp:
    echo    - Tạo Personal Access Token trên GitHub
    echo    - Vào: Settings ^> Developer settings ^> Personal access tokens
    echo    - Generate new token (classic)
    echo    - Chọn scope: repo (full control)
    echo    - Dùng token thay cho password
    echo.
    echo 2. REPOSITORY KHÔNG TỒN TẠI
    echo    Giải pháp:
    echo    - Tạo repository trên GitHub trước
    echo    - Vào: https://github.com/new
    echo.
    echo 3. REMOTE URL SAI
    echo    Giải pháp:
    echo    - Kiểm tra lại URL: git remote -v
    echo    - Sửa URL: git remote set-url origin [URL_MỚI]
    echo.
    echo 4. SỬ DỤNG SSH THAY VÌ HTTPS
    echo    Nếu repository URL dạng git@github.com...
    echo    Cần setup SSH key trước
    echo.
    echo ========================================
    echo.
    echo Thử lại bằng cách:
    echo 1. Tạo Personal Access Token
    echo 2. Chạy lại script này
    echo 3. Nhập token khi được hỏi password
    echo ========================================
)

echo.
pause
