# ⚡ LambdaTest Quick Start (5 phút)

## 🎯 Chạy automation tests trên cloud trong 5 phút!

---

## 📋 Step 1: Lấy Credentials (2 phút)

### 1.1 Đăng ký miễn phí
👉 https://accounts.lambdatest.com/register

- Chọn: Email / GitHub / Google / Microsoft
- Free plan: **100 phút automation/tháng** ✅

### 1.2 Lấy Username & Access Key
👉 https://accounts.lambdatest.com/profile

Scroll xuống phần **Access Key** → Click **Copy**

---

## ⚙️ Step 2: Set Credentials (1 phút)

### Windows PowerShell (Khuyến nghị):
```powershell
$env:LAMBDATEST_USERNAME="your_username_here"
$env:LAMBDATEST_ACCESS_KEY="your_access_key_here"
```

### Verify:
```powershell
echo $env:LAMBDATEST_USERNAME
echo $env:LAMBDATEST_ACCESS_KEY
```

**Hoặc** sửa trực tiếp trong file:
- Mở: `src/selenium/LambdaTestRunner.java`
- Tìm dòng 17-18, thay `YOUR_LAMBDATEST_USERNAME` và `YOUR_LAMBDATEST_ACCESS_KEY`

---

## 🚀 Step 3: Chạy Tests (2 phút)

### Cách 1: Dùng script (Đơn giản nhất) ⭐
```bash
.\run-lambdatest.bat
```

Script sẽ tự động:
1. ✅ Check Java & Maven
2. ✅ Install Selenium dependencies
3. ✅ Compile code
4. ✅ Run tests trên LambdaTest Cloud

### Cách 2: Dùng Maven
```bash
# Install dependencies
mvn clean install -DskipTests

# Run tests
mvn exec:java -Dexec.mainClass="selenium.LambdaTestRunner"
```

---

## 📊 Step 4: Xem Kết quả

### Dashboard:
👉 https://automation.lambdatest.com/timeline

Bạn sẽ thấy:
- ✅ Test results (Pass/Fail)
- 🎥 Video recording
- 📸 Screenshots
- 📊 Logs (Console, Network, Terminal)

### Console Output:
```
╔═══════════════════════════════════════════════╗
║   LAMBDATEST AUTOMATION - DATETIMECHECKER    ║
╚═══════════════════════════════════════════════╝

🚀 Started session: Test on Chrome latest - Windows 10
📍 Platform: Windows 10
🌐 Browser: Chrome latest

[Test 1/4] Opening website... ✓
[Test 2/4] Verifying page title... ✓
[Test 3/4] Testing search functionality... ✓
[Test 4/4] Verifying search results... ✓

✅ ALL TESTS PASSED!

📊 View results: https://automation.lambdatest.com/timeline
```

---

## 🎯 Test Configuration

Tests sẽ chạy trên:
- 🌐 **Browser**: Chrome (latest version)
- 💻 **Platform**: Windows 10
- 📺 **Resolution**: 1920x1080
- 🎥 **Video**: Enabled
- 📸 **Screenshots**: Enabled
- 📊 **Logs**: Network + Console enabled

---

## 🌟 Chạy Multiple Browsers (Advanced)

Chạy song song trên 5 browsers:
```bash
mvn test -DsuiteXmlFile=testng.xml
```

Browsers:
1. ✅ Chrome on Windows 10
2. ✅ Firefox on Windows 10
3. ✅ Edge on Windows 10
4. ✅ Safari on macOS Monterey
5. ✅ Chrome on macOS Monterey

**Parallel execution** - Tất cả chạy cùng lúc! ⚡

---

## 🔧 Troubleshooting

### ❌ "Invalid credentials"
```powershell
# Verify credentials
echo $env:LAMBDATEST_USERNAME
echo $env:LAMBDATEST_ACCESS_KEY

# Set lại
$env:LAMBDATEST_USERNAME="correct_username"
$env:LAMBDATEST_ACCESS_KEY="correct_access_key"
```

### ❌ "Maven not found"
1. Download: https://maven.apache.org/download.cgi
2. Extract & Add to PATH
3. Verify: `mvn -version`

### ❌ "Java not found"
1. Download: https://www.oracle.com/java/technologies/downloads/
2. Install & Add to PATH
3. Verify: `java -version`

---

## 📚 Next Steps

1. ✅ **Customize tests**: Edit `src/selenium/LambdaTestRunner.java`
2. ✅ **Add more test cases**: Thêm methods test mới
3. ✅ **Try different browsers**: Sửa `testng.xml`
4. ✅ **Setup CI/CD**: Add GitHub Actions secrets
5. ✅ **Read full guide**: [`LAMBDATEST_SETUP.md`](LAMBDATEST_SETUP.md)

---

## 💡 Pro Tips

### Tip 1: Save Credentials Permanently
```powershell
# Windows PowerShell
[System.Environment]::SetEnvironmentVariable('LAMBDATEST_USERNAME', 'your_username', 'User')
[System.Environment]::SetEnvironmentVariable('LAMBDATEST_ACCESS_KEY', 'your_key', 'User')
```

### Tip 2: Watch Video Recordings
- Go to dashboard → Click test run → Tab "Video"
- See exactly what browser did during test

### Tip 3: Use Parallel Testing
- Saves 80% time!
- Sequential: 15 min (5 browsers × 3 min each)
- Parallel: 3 min (all run together)

### Tip 4: Free Plan Limits
- ✅ 100 minutes/month
- ✅ 6 concurrent sessions
- ✅ Unlimited manual testing
- ✅ 3000+ browser combinations

---

## ✅ Success Checklist

- [ ] LambdaTest account created ✓
- [ ] Credentials copied ✓
- [ ] Environment variables set ✓
- [ ] Maven installed ✓
- [ ] Script executed successfully ✓
- [ ] Dashboard opened ✓
- [ ] Video recording viewed ✓
- [ ] Ready for CI/CD ✓

---

## 🆘 Need Help?

- 📖 Full Guide: [`LAMBDATEST_SETUP.md`](LAMBDATEST_SETUP.md)
- 💬 Community: https://community.lambdatest.com/
- 📧 Support: support@lambdatest.com
- 🎥 Tutorials: https://www.youtube.com/c/LambdaTest

---

**🚀 You're ready! Run `.\run-lambdatest.bat` now!**

**Total time**: ~5 minutes from zero to running tests on cloud! ⏱️
