# DateTimeChecker - Hướng dẫn Push lên GitHub

## 📊 Trạng thái hiện tại

❌ **Chưa push lên GitHub**

Lý do:
- Git chưa được cài đặt trên máy
- Repository chưa được khởi tạo

## 🚀 Cách Push lên GitHub

### Bước 1: Cài đặt Git

#### Option A: Download trực tiếp (Khuyên dùng)
1. Truy cập: https://git-scm.com/download/win
2. Download Git cho Windows
3. Chạy file cài đặt (click Next, Next, ...)
4. **Restart PowerShell** sau khi cài xong

#### Option B: Kiểm tra Git đã cài chưa
Mở PowerShell và chạy:
```powershell
git --version
```

Nếu thấy version number → Git đã được cài ✅  
Nếu báo lỗi → Cần cài Git ❌

### Bước 2: Tạo Repository trên GitHub

1. Đăng nhập GitHub: https://github.com
2. Click nút **"New"** (góc trên bên phải) hoặc vào: https://github.com/new
3. Điền thông tin:
   - **Repository name**: `checkdatetime` (hoặc tên bạn muốn)
   - **Description**: "DateTimeChecker with JUnit tests and JaCoCo coverage"
   - **Public** hoặc **Private** (tùy chọn)
   - **KHÔNG** tick "Add a README file"
   - **KHÔNG** chọn .gitignore
   - **KHÔNG** chọn license
4. Click **"Create repository"**

### Bước 3: Chạy Script Push

Sau khi Git đã cài và repository GitHub đã tạo:

```powershell
.\push-to-github.bat
```

Script sẽ hỏi:
1. **GitHub username** (nếu chưa config)
2. **GitHub email** (nếu chưa config)
3. **Repository URL** - Copy từ GitHub, ví dụ:
   ```
   https://github.com/your-username/checkdatetime.git
   ```

### Bước 4: Xác thực (Authentication)

Khi push, GitHub sẽ yêu cầu đăng nhập:

#### Option A: Personal Access Token (Khuyên dùng)
1. Vào GitHub Settings → Developer settings
2. Chọn **Personal access tokens** → **Tokens (classic)**
3. Click **"Generate new token (classic)"**
4. Điền:
   - Note: "Git access for checkdatetime"
   - Expiration: 90 days (hoặc tùy chọn)
   - Scope: Tick ✅ **repo** (full control of private repositories)
5. Click **"Generate token"**
6. **Copy token ngay** (chỉ hiện 1 lần!)
7. Khi Git hỏi password, paste token vào

#### Option B: GitHub Desktop (Dễ nhất cho người mới)
1. Download: https://desktop.github.com/
2. Đăng nhập GitHub
3. Clone repository
4. Copy files vào
5. Commit và Push qua giao diện

## 📋 Kiểm tra trạng thái

Để kiểm tra xem đã push chưa, chạy:

```powershell
.\check-github-status.bat
```

Hoặc kiểm tra thủ công:

```powershell
git status
git remote -v
git log
```

## ✅ Sau khi Push thành công

1. **Xem repository**: Vào https://github.com/your-username/checkdatetime
2. **Xem CI/CD**: Tab **Actions** → Xem workflow chạy tự động
3. **Xem Coverage Report**: Vào Actions → Chọn workflow run → Tab **Artifacts**

## 📁 Files sẽ được push

```
✅ src/DateTimeChecker.java           (Main code)
✅ DateTimeCheckerTest.java            (15 test cases)
✅ .github/workflows/ci.yml            (CI/CD workflow)
✅ lib/                                (JUnit + JaCoCo)
✅ build.xml                           (Ant build file)
✅ *.bat                               (Scripts)
❌ build/                              (ignored)
❌ coverage/                           (ignored)
```

## 🔧 Troubleshooting

### Lỗi: "Git is not recognized"
→ Git chưa cài hoặc chưa restart PowerShell sau khi cài

### Lỗi: "Authentication failed"
→ Dùng Personal Access Token thay vì password

### Lỗi: "Remote repository not found"
→ Kiểm tra lại URL repository trên GitHub

### Lỗi: "Permission denied"
→ Kiểm tra quyền truy cập repository

## 📞 Cần giúp đỡ?

Nếu gặp vấn đề, chạy script kiểm tra:
```powershell
.\check-github-status.bat
```

Script sẽ hiển thị chi tiết trạng thái và hướng dẫn tiếp theo.

---

**Tóm tắt**: Cài Git → Tạo repo GitHub → Chạy `push-to-github.bat` → Xong! 🎉
