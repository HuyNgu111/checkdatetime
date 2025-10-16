# 🚀 LambdaTest Automation - README

## 📦 Đã tạo cho bạn

✅ **7 files mới** để chạy automation testing trên LambdaTest cloud:

### 1. Core Files
- ✅ `src/selenium/LambdaTestRunner.java` - Main automation test runner
- ✅ `testng.xml` - TestNG configuration (5 browsers song song)
- ✅ `pom.xml` - Updated với Selenium + TestNG dependencies

### 2. Scripts
- ✅ `run-lambdatest.bat` - Script tự động chạy tests (Windows)

### 3. CI/CD
- ✅ `.github/workflows/lambdatest.yml` - GitHub Actions workflow

### 4. Documentation
- ✅ `LAMBDATEST_SETUP.md` - Hướng dẫn chi tiết (đầy đủ)
- ✅ `LAMBDATEST_QUICKSTART.md` - Quick start 5 phút

---

## ⚡ Quick Start (3 bước)

### Bước 1: Lấy LambdaTest credentials
```
1. Đăng ký miễn phí: https://accounts.lambdatest.com/register
2. Login và vào: https://accounts.lambdatest.com/profile
3. Copy Username và Access Key
```

### Bước 2: Set credentials
```powershell
# PowerShell
$env:LAMBDATEST_USERNAME="your_username"
$env:LAMBDATEST_ACCESS_KEY="your_access_key"
```

### Bước 3: Chạy tests
```bash
.\run-lambdatest.bat
```

**Xong!** Tests sẽ chạy trên LambdaTest cloud! 🎉

---

## 📊 Xem kết quả

Dashboard: https://automation.lambdatest.com/timeline

Bạn sẽ thấy:
- ✅ Test results (Pass/Fail)
- 🎥 Video recordings
- 📸 Screenshots
- 📊 Console & Network logs
- ⏱️ Execution time

---

## 🌐 Test Coverage

Tests sẽ chạy trên **5 browsers** song song:

1. ✅ **Chrome** (latest) - Windows 10
2. ✅ **Firefox** (latest) - Windows 10  
3. ✅ **Edge** (latest) - Windows 10
4. ✅ **Safari** 15 - macOS Monterey
5. ✅ **Chrome** (latest) - macOS Monterey

**Parallel execution**: Tất cả chạy cùng lúc → Tiết kiệm 80% thời gian! ⚡

---

## 🧪 Test Cases

Hiện tại có **4 test cases**:

1. ✅ **Test 1**: Open website
2. ✅ **Test 2**: Verify page title
3. ✅ **Test 3**: Test search functionality
4. ✅ **Test 4**: Verify search results

**Customize**: Edit `src/selenium/LambdaTestRunner.java` để test app của bạn

---

## 🔧 Các cách chạy

### Cách 1: Script (Khuyến nghị) ⭐
```bash
.\run-lambdatest.bat
```
- Tự động check Java, Maven
- Tự động install dependencies
- Tự động compile và run
- Hiển thị kết quả đẹp

### Cách 2: Maven
```bash
# 1 browser (nhanh - 3 phút)
mvn exec:java -Dexec.mainClass="selenium.LambdaTestRunner"

# 5 browsers song song (đầy đủ - 5 phút)
mvn test -DsuiteXmlFile=testng.xml
```

### Cách 3: GitHub Actions (CI/CD)
1. Add secrets: `LAMBDATEST_USERNAME`, `LAMBDATEST_ACCESS_KEY`
2. Push code lên GitHub
3. Workflow tự động chạy
4. Xem kết quả trong Actions tab

---

## 📖 Documentation

### Mới bắt đầu?
👉 Đọc: [`LAMBDATEST_QUICKSTART.md`](LAMBDATEST_QUICKSTART.md) (5 phút)

### Muốn tìm hiểu sâu?
👉 Đọc: [`LAMBDATEST_SETUP.md`](LAMBDATEST_SETUP.md) (đầy đủ)

Includes:
- ✅ Setup chi tiết từng bước
- ✅ Troubleshooting guide
- ✅ Advanced features
- ✅ Best practices
- ✅ CI/CD integration
- ✅ Parallel testing
- ✅ Screenshots & video recording

---

## 💡 Features

### ✨ LambdaTest Cloud Testing
- 🌐 **3000+ browsers** và OS combinations
- 🎥 **Video recording** mỗi test
- 📸 **Screenshots** tự động
- 📊 **Network logs** và console logs
- ⚡ **Parallel testing** (chạy nhiều browsers cùng lúc)
- 🔄 **CI/CD ready** (GitHub Actions, Jenkins, GitLab)

### 🆓 Free Plan
- ✅ 100 phút automation/tháng
- ✅ 6 concurrent sessions
- ✅ Unlimited manual testing
- ✅ Full features (video, logs, screenshots)

---

## 🎯 Workflow

```
┌─────────────────┐
│  Push Code      │
│  to GitHub      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ GitHub Actions  │
│ Workflow        │
│ Triggered       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ LambdaTest      │
│ Cloud Testing   │
│ (5 browsers)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Results +       │
│ Video +         │
│ Screenshots     │
└─────────────────┘
```

---

## 📁 Project Structure

```
checkdatetime/
├── src/
│   ├── checkdatetime/
│   │   ├── DateTimeChecker.java
│   │   ├── TestDateTimeChecker.java
│   │   └── DateTimeCheckerTest.java
│   └── selenium/
│       └── LambdaTestRunner.java          ← NEW! 🆕
│
├── .github/
│   └── workflows/
│       ├── run-tests.yml
│       └── lambdatest.yml                 ← NEW! 🆕
│
├── testng.xml                             ← NEW! 🆕
├── pom.xml                                ← UPDATED! 🔄
├── run-lambdatest.bat                     ← NEW! 🆕
│
├── LAMBDATEST_SETUP.md                    ← NEW! 🆕
├── LAMBDATEST_QUICKSTART.md               ← NEW! 🆕
└── LAMBDATEST_README.md                   ← YOU ARE HERE
```

---

## 🔧 Requirements

- ✅ Java 8+
- ✅ Maven 3.6+
- ✅ LambdaTest account (free)
- ✅ Internet connection

---

## 🚦 Next Steps

### 1. Get Started (5 phút)
```bash
# Set credentials
$env:LAMBDATEST_USERNAME="your_username"
$env:LAMBDATEST_ACCESS_KEY="your_key"

# Run
.\run-lambdatest.bat
```

### 2. Customize Tests
- Edit: `src/selenium/LambdaTestRunner.java`
- Thay URL test: `driver.get("your_url_here");`
- Thêm test cases mới

### 3. Add More Browsers
- Edit: `testng.xml`
- Thêm `<test>` blocks mới
- Supported: Chrome, Firefox, Safari, Edge, Opera, IE

### 4. Setup CI/CD
- Add GitHub secrets
- Push code
- Watch Actions run automatically

### 5. View Results
- Dashboard: https://automation.lambdatest.com/timeline
- Click vào test run
- Xem video & logs

---

## 💬 Support

### Cần giúp đỡ?

**Documentation:**
- 📖 Quick Start: [`LAMBDATEST_QUICKSTART.md`](LAMBDATEST_QUICKSTART.md)
- 📖 Full Guide: [`LAMBDATEST_SETUP.md`](LAMBDATEST_SETUP.md)

**LambdaTest:**
- 🌐 Docs: https://www.lambdatest.com/support/docs/
- 💬 Community: https://community.lambdatest.com/
- 📧 Email: support@lambdatest.com

**Issues:**
- 🐛 GitHub Issues: Create new issue
- 💡 Feature Requests: Welcome!

---

## ✅ Checklist

- [ ] Đã đọc `LAMBDATEST_QUICKSTART.md`
- [ ] Đã đăng ký LambdaTest account
- [ ] Đã set credentials (environment variables)
- [ ] Đã chạy `.\run-lambdatest.bat` thành công
- [ ] Đã xem kết quả trên dashboard
- [ ] Đã xem video recording
- [ ] Đã customize test cases (optional)
- [ ] Đã setup GitHub Actions (optional)

---

## 🎉 Success!

Khi bạn chạy tests thành công, bạn sẽ thấy:

```
╔═══════════════════════════════════════════════╗
║   LAMBDATEST AUTOMATION - DATETIMECHECKER    ║
╚═══════════════════════════════════════════════╝

🚀 Started session: Test on Chrome latest - Windows 10
📍 Platform: Windows 10
🌐 Browser: Chrome latest

=== RUNNING TEST SUITE ===

[Test 1/4] Opening website... ✓
[Test 2/4] Verifying page title... ✓
[Test 3/4] Testing search functionality... ✓
[Test 4/4] Verifying search results... ✓

✅ ALL TESTS PASSED!

📊 View results: https://automation.lambdatest.com/timeline
```

---

## 🌟 Pro Tips

1. **Start Small**: Chạy 1 browser trước (mode 1), sau đó scale lên 5 browsers (mode 2)
2. **Watch Videos**: Video recording giúp debug nhanh hơn
3. **Use Parallel**: Parallel testing tiết kiệm 80% thời gian
4. **Setup CI/CD**: Automation hoàn toàn - push code là tests chạy
5. **Read Logs**: Network & console logs rất hữu ích cho debugging

---

**🚀 Ready to test on 3000+ browser combinations!**

**Questions?** → Đọc [`LAMBDATEST_SETUP.md`](LAMBDATEST_SETUP.md)

**Let's go!** → Run `.\run-lambdatest.bat` 🎯
