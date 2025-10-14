@echo off
chcp 65001 > nul
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║     QUICK FIX - PUSH LÊN GITHUB                       ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo VẤN ĐỀ: Chưa có remote repository
echo GIẢI PHÁP: Thêm remote và push
echo.
echo ════════════════════════════════════════════════════════
echo.

REM Kiểm tra remote
git remote -v 2>nul | findstr "origin" >nul
if %ERRORLEVEL% EQU 0 (
    echo ℹ️ Remote đã tồn tại:
    git remote -v
    echo.
    set /p confirm="Bạn có muốn đổi remote URL không? (y/n): "
    if /i "!confirm!"=="y" (
        set /p new_url="Nhập URL mới: "
        git remote set-url origin !new_url!
        echo ✅ Remote updated
    )
) else (
    echo ❌ Chưa có remote repository
    echo.
    echo Nhập GitHub repository URL:
    echo (Ví dụ: https://github.com/username/checkdatetime.git)
    echo.
    set /p repo_url="URL: "
    
    if "!repo_url!"=="" (
        echo ❌ URL không được để trống!
        pause
        exit /b 1
    )
    
    git remote add origin !repo_url!
    echo ✅ Remote added
)

echo.
echo ════════════════════════════════════════════════════════
echo.

REM Add và commit files mới
echo Checking for new files...
git status --short | findstr "^??" >nul
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Files mới tìm thấy:
    git status --short
    echo.
    git add .
    git commit -m "Add setup scripts and documentation"
    echo ✅ Changes committed
)

echo.
echo ════════════════════════════════════════════════════════
echo                    PUSH TO GITHUB
echo ════════════════════════════════════════════════════════
echo.
echo ⚠️ KHI GIT HỎI THÔNG TIN XÁC THỰC:
echo.
echo   Username: [GitHub username của bạn]
echo   Password: [Personal Access Token - KHÔNG phải password!]
echo.
echo 💡 Tạo token tại: https://github.com/settings/tokens
echo.
echo ════════════════════════════════════════════════════════
echo.
pause

git push -u origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ╔════════════════════════════════════════════════════════╗
    echo ║                                                        ║
    echo ║              ✅ PUSH THÀNH CÔNG! ✅                   ║
    echo ║                                                        ║
    echo ╚════════════════════════════════════════════════════════╝
    echo.
    echo Repository: 
    git remote get-url origin
    echo.
    echo Vào GitHub để xem CI/CD workflow chạy!
    echo.
) else (
    echo.
    echo ╔════════════════════════════════════════════════════════╗
    echo ║                                                        ║
    echo ║                ❌ PUSH THẤT BẠI ❌                    ║
    echo ║                                                        ║
    echo ╚════════════════════════════════════════════════════════╝
    echo.
    echo LÝ DO PHỔ BIẾN:
    echo   1. Dùng password thay vì token
    echo   2. Token hết hạn
    echo   3. Repository không tồn tại
    echo.
    echo CÁCH SỬA:
    echo   1. Tạo token: https://github.com/settings/tokens
    echo   2. Chạy lại: git push -u origin main
    echo   3. Paste token khi hỏi password
    echo.
)

pause
