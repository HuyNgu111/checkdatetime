@echo off
chcp 65001 > nul
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║     HƯỚNG DẪN SỬ DỤNG CI/CD TRÊN GITHUB               ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo ✅ Bạn đã PUSH CODE thành công!
echo.
echo ════════════════════════════════════════════════════════
echo    BƯỚC 1: XEM CI/CD WORKFLOW ĐANG CHẠY
echo ════════════════════════════════════════════════════════
echo.
echo CI/CD đã được cấu hình sẵn trong file:
echo    .github/workflows/ci.yml
echo.
echo Workflow sẽ TỰ ĐỘNG chạy khi:
echo    ✅ Push code lên GitHub
echo    ✅ Tạo Pull Request
echo    ✅ Chạy thủ công (workflow_dispatch)
echo.
echo Đang mở GitHub Actions...
start https://github.com/HuyNgu111/checkdatetime/actions
echo.
echo ════════════════════════════════════════════════════════
echo    BƯỚC 2: XEM KẾT QUẢ CI/CD
echo ════════════════════════════════════════════════════════
echo.
echo Trên trang GitHub Actions, bạn sẽ thấy:
echo.
echo 1️⃣ Workflow đang chạy (icon ⚡ màu vàng)
echo    - Tên: "Java CI with JUnit and JaCoCo Coverage"
echo    - Status: In progress...
echo.
echo 2️⃣ Khi hoàn thành (icon ✓ màu xanh):
echo    - Click vào workflow run
echo    - Xem chi tiết từng bước:
echo      ✓ Checkout code
echo      ✓ Setup JDK 17
echo      ✓ Compile source
echo      ✓ Compile tests
echo      ✓ Run 15 test cases
echo      ✓ Generate coverage report
echo.
echo 3️⃣ Download Coverage Report:
echo    - Scroll xuống phần "Artifacts"
echo    - Download "coverage-report"
echo    - Giải nén và mở index.html
echo.
echo ════════════════════════════════════════════════════════
echo    BƯỚC 3: XEM CHI TIẾT WORKFLOW
echo ════════════════════════════════════════════════════════
echo.
echo Workflow làm gì:
echo.
echo [Bước 1] Checkout code từ repository
echo [Bước 2] Cài đặt Java JDK 17
echo [Bước 3] Compile DateTimeChecker.java
echo [Bước 4] Compile DateTimeCheckerTest.java
echo [Bước 5] Chạy JUnit tests với JaCoCo coverage
echo          → 15 test cases được thực thi
echo [Bước 6] Generate coverage reports (HTML, XML, CSV)
echo [Bước 7] Upload coverage report làm artifact
echo.
echo ════════════════════════════════════════════════════════
echo    BƯỚC 4: CHẠY WORKFLOW THỦ CÔNG (Tùy chọn)
echo ════════════════════════════════════════════════════════
echo.
echo Nếu muốn chạy lại workflow:
echo.
echo 1. Vào: https://github.com/HuyNgu111/checkdatetime/actions
echo 2. Chọn workflow "Java CI with JUnit and JaCoCo Coverage"
echo 3. Click nút "Run workflow" (bên phải)
echo 4. Chọn branch "main"
echo 5. Click "Run workflow" (màu xanh)
echo.
pause
echo.
echo ════════════════════════════════════════════════════════
echo    BƯỚC 5: XEM COVERAGE REPORT
echo ════════════════════════════════════════════════════════
echo.
echo Đang mở trang workflow để download report...
start https://github.com/HuyNgu111/checkdatetime/actions
echo.
echo Hướng dẫn download:
echo 1. Click vào workflow run đã hoàn thành (✓ xanh)
echo 2. Scroll xuống "Artifacts"
echo 3. Click "coverage-report" để download
echo 4. Giải nén file ZIP
echo 5. Mở index.html trong trình duyệt
echo.
echo Coverage report sẽ hiển thị:
echo    - Tổng % coverage
echo    - Coverage theo từng class
echo    - Coverage theo từng method
echo    - Lines covered/missed
echo    - Branches covered/missed
echo.
echo ════════════════════════════════════════════════════════
echo    TỰ ĐỘNG HÓA CI/CD
echo ════════════════════════════════════════════════════════
echo.
echo Từ bây giờ, MỖI KHI bạn:
echo.
echo ✅ git push                 → CI/CD tự động chạy
echo ✅ Tạo Pull Request        → CI/CD tự động chạy
echo ✅ Merge code              → CI/CD tự động chạy
echo.
echo CI/CD sẽ:
echo    1. Kiểm tra code compile được không
echo    2. Chạy tất cả 15 test cases
echo    3. Tạo coverage report
echo    4. Báo lỗi nếu tests fail
echo.
echo ════════════════════════════════════════════════════════
echo    THÊM BADGE VÀO README (Tùy chọn)
echo ════════════════════════════════════════════════════════
echo.
echo Để hiển thị build status trên repository:
echo.
echo 1. Tạo file README.md
echo 2. Thêm dòng này:
echo.
echo    ![CI](https://github.com/HuyNgu111/checkdatetime/actions/workflows/ci.yml/badge.svg)
echo.
echo 3. Push lên GitHub
echo 4. Badge sẽ hiện trên trang chủ repository
echo    ✓ Màu xanh = Build pass
echo    ✗ Màu đỏ = Build fail
echo.
echo ════════════════════════════════════════════════════════
echo    KIỂM TRA WORKFLOW FILE
echo ════════════════════════════════════════════════════════
echo.
echo Workflow được định nghĩa trong:
echo    .github/workflows/ci.yml
echo.
echo Bạn có thể xem file này để:
echo    - Hiểu workflow làm gì
echo    - Tùy chỉnh các bước
echo    - Thêm/bớt jobs
echo.
type .github\workflows\ci.yml
echo.
echo ════════════════════════════════════════════════════════
echo.
echo 🎉 HOÀN TẤT! CI/CD ĐÃ ĐƯỢC CẤU HÌNH!
echo.
echo Repository: https://github.com/HuyNgu111/checkdatetime
echo Actions: https://github.com/HuyNgu111/checkdatetime/actions
echo.
echo ════════════════════════════════════════════════════════
pause
