# 🚀 CI/CD Setup cho DateTimeChecker

## 📋 Đã tạo GitHub Actions Workflow

File: `.github/workflows/run-tests.yml`

## ✨ Tính năng

### 🔄 Tự động chạy khi:
- ✅ Push code lên branch `main`, `master`, hoặc `develop`
- ✅ Tạo Pull Request vào branch `main` hoặc `master`
- ✅ Chạy thủ công từ GitHub UI (tab Actions)

### 🧪 Workflow bao gồm:
1. **Checkout code** - Tải code từ repository
2. **Setup Java 8** - Cài đặt Java 8 trên runner
3. **Compile code** - Biên dịch DateTimeChecker và TestDateTimeChecker
4. **Run tests** - Chạy tất cả test cases
5. **Generate report** - Tạo coverage report hiển thị trên GitHub
6. **Success check** - Xác nhận tests passed

## 📊 Coverage Report

Sau khi chạy, bạn sẽ thấy coverage report ngay trên GitHub với:
- ✅ Coverage percentage: 100%
- 📋 Bảng chi tiết 8 methods và coverage của từng method
- 🎯 Tổng kết: 8/8 methods tested

## 🚀 Cách sử dụng

### Option 1: Push lên GitHub (tự động)
```bash
git add .
git commit -m "Add CI/CD workflow"
git push origin main
```

Sau đó vào: `https://github.com/HuyNgu111/checkdatetime/actions`

### Option 2: Chạy thủ công
1. Vào repository: `https://github.com/HuyNgu111/checkdatetime`
2. Click tab **Actions**
3. Chọn workflow **"🧪 Run Tests & Coverage"**
4. Click nút **"Run workflow"** → **"Run workflow"**

## 📈 Xem kết quả

Sau khi workflow chạy xong:
1. Vào tab **Actions**
2. Click vào workflow run mới nhất
3. Xem:
   - ✅ Build status (passed/failed)
   - 📊 Coverage report (ở Summary section)
   - 📝 Chi tiết từng bước (trong job "Test DateTimeChecker")

## 🎯 Badge cho README

Thêm vào README.md để hiển thị build status:

```markdown
![Tests](https://github.com/HuyNgu111/checkdatetime/actions/workflows/run-tests.yml/badge.svg)
```

## 🔍 Monitoring

Workflow sẽ gửi thông báo nếu:
- ❌ Tests failed
- ✅ Tests passed
- ⚠️ Build error

---

**Next Steps:**
1. Push workflow lên GitHub: `git push origin main`
2. Kiểm tra tab Actions trên GitHub
3. Xem coverage report được tự động generate
