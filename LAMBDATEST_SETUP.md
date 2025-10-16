# 🚀 LambdaTest Automation Setup Guide

## 📋 Tổng quan

LambdaTest là nền tảng cloud testing cho phép bạn chạy automated tests trên **3000+ browsers và operating systems** mà không cần cài đặt gì.

### ✨ Tính năng
- ✅ **Cross-browser testing**: Chrome, Firefox, Safari, Edge, Opera...
- ✅ **Cross-platform**: Windows, macOS, Linux, iOS, Android
- ✅ **Video recording**: Ghi lại toàn bộ test session
- ✅ **Screenshots**: Tự động chụp mỗi bước
- ✅ **Network logs**: Xem tất cả network requests
- ✅ **Console logs**: Debug với console output
- ✅ **Parallel testing**: Chạy nhiều tests cùng lúc
- ✅ **CI/CD integration**: GitHub Actions, Jenkins, GitLab CI...

---

## 🎯 Bước 1: Đăng ký LambdaTest (MIỄN PHÍ)

### 1.1 Tạo tài khoản
1. Vào: https://accounts.lambdatest.com/register
2. Chọn một trong các cách:
   - 📧 Email + Password
   - 🔷 GitHub account
   - 🔶 Google account
   - 🔵 Microsoft account
3. Verify email (nếu dùng email)

### 1.2 Free Plan bao gồm
- ✅ **100 phút automation testing/tháng** (đủ cho development)
- ✅ **6 concurrent sessions** (chạy 6 browsers cùng lúc)
- ✅ **3000+ browser/OS combinations**
- ✅ **Unlimited manual testing**
- ✅ **Video recordings & screenshots**
- ✅ **Network & console logs**

---

## 🔑 Bước 2: Lấy Credentials

### 2.1 Vào Profile
1. Đăng nhập: https://accounts.lambdatest.com/login
2. Click vào **Profile** (góc phải trên)
3. Hoặc trực tiếp: https://accounts.lambdatest.com/profile

### 2.2 Copy Username và Access Key
Scroll xuống phần **Access Key**, bạn sẽ thấy:
```
Username: your_username_here
Access Key: ********************************
```

Click **Copy** để copy cả hai giá trị.

---

## ⚙️ Bước 3: Cấu hình Credentials

### Cách 1: Environment Variables (Khuyến nghị) ⭐

#### Windows PowerShell:
```powershell
# Temporary (chỉ session hiện tại)
$env:LAMBDATEST_USERNAME="your_username"
$env:LAMBDATEST_ACCESS_KEY="your_access_key"

# Permanent (lưu vĩnh viễn)
[System.Environment]::SetEnvironmentVariable('LAMBDATEST_USERNAME', 'your_username', 'User')
[System.Environment]::SetEnvironmentVariable('LAMBDATEST_ACCESS_KEY', 'your_access_key', 'User')
```

#### Windows CMD:
```batch
REM Temporary
set LAMBDATEST_USERNAME=your_username
set LAMBDATEST_ACCESS_KEY=your_access_key

REM Permanent
setx LAMBDATEST_USERNAME "your_username"
setx LAMBDATEST_ACCESS_KEY "your_access_key"
```

#### Linux/Mac:
```bash
# Temporary
export LAMBDATEST_USERNAME="your_username"
export LAMBDATEST_ACCESS_KEY="your_access_key"

# Permanent (thêm vào ~/.bashrc hoặc ~/.zshrc)
echo 'export LAMBDATEST_USERNAME="your_username"' >> ~/.bashrc
echo 'export LAMBDATEST_ACCESS_KEY="your_access_key"' >> ~/.bashrc
source ~/.bashrc
```

### Cách 2: Sửa trực tiếp trong code

Mở file `src/selenium/LambdaTestRunner.java`, tìm dòng:
```java
private static final String USERNAME = "YOUR_LAMBDATEST_USERNAME";
private static final String ACCESS_KEY = "YOUR_LAMBDATEST_ACCESS_KEY";
```

Thay bằng credentials của bạn:
```java
private static final String USERNAME = "john_doe_123";
private static final String ACCESS_KEY = "abcdef1234567890";
```

---

## 🚀 Bước 4: Chạy Tests

### 4.1 Cài đặt Maven (nếu chưa có)

#### Windows:
1. Download: https://maven.apache.org/download.cgi
2. Extract vào `C:\Program Files\Apache\maven`
3. Thêm vào PATH:
   - System Properties → Environment Variables
   - Thêm `C:\Program Files\Apache\maven\bin` vào PATH
4. Verify: `mvn -version`

#### macOS (dùng Homebrew):
```bash
brew install maven
mvn -version
```

#### Linux (Ubuntu/Debian):
```bash
sudo apt update
sudo apt install maven
mvn -version
```

### 4.2 Chạy automation tests

#### Cách 1: Dùng script (Đơn giản nhất) ⭐
```bash
# Windows
.\run-lambdatest.bat

# Linux/Mac
chmod +x run-lambdatest.sh
./run-lambdatest.sh
```

Script sẽ tự động:
1. ✅ Kiểm tra Java
2. ✅ Kiểm tra Maven
3. ✅ Kiểm tra credentials
4. ✅ Cài đặt dependencies (Selenium, TestNG)
5. ✅ Compile code
6. ✅ Chạy tests
7. ✅ Hiển thị kết quả

#### Cách 2: Dùng Maven trực tiếp
```bash
# Cài dependencies
mvn clean install -DskipTests

# Compile
mvn compile

# Chạy 1 browser (nhanh)
mvn exec:java -Dexec.mainClass="selenium.LambdaTestRunner" -Dexec.args="Chrome latest 'Windows 10'"

# Chạy tất cả 5 browsers song song (đầy đủ)
mvn test -DsuiteXmlFile=testng.xml
```

#### Cách 3: Dùng Java trực tiếp (không cần Maven)
```bash
# Compile
javac -cp "lib/*" -d bin src/selenium/LambdaTestRunner.java

# Run
java -cp "bin:lib/*" selenium.LambdaTestRunner Chrome latest "Windows 10"
```

---

## 📊 Bước 5: Xem Kết quả

### 5.1 LambdaTest Dashboard

Mở: https://automation.lambdatest.com/timeline

Bạn sẽ thấy:
- ✅ **Test runs**: Tất cả test sessions
- 🎥 **Video**: Recording của toàn bộ test
- 📸 **Screenshots**: Snapshots của từng bước
- 📊 **Logs**: Console logs, network logs, terminal logs
- ⏱️ **Timeline**: Thời gian chạy từng test
- 📈 **Analytics**: Build trends, pass/fail rates

### 5.2 Click vào một test run để xem chi tiết:

#### Tab: Video
- Xem toàn bộ quá trình test chạy
- Tua nhanh/chậm
- Download video

#### Tab: Screenshots
- Xem screenshots tự động chụp mỗi action
- So sánh visual changes
- Download images

#### Tab: Logs
- **Command Logs**: Mỗi Selenium command
- **Network Logs**: HTTP requests/responses
- **Console Logs**: JavaScript console output
- **Exception Logs**: Errors và exceptions

#### Tab: Metadata
- Browser version
- OS version
- Screen resolution
- Test duration
- Pass/Fail status

### 5.3 Local console output

Trong terminal bạn sẽ thấy:
```
╔═══════════════════════════════════════════════╗
║   LAMBDATEST AUTOMATION - DATETIMECHECKER    ║
╚═══════════════════════════════════════════════╝

🚀 Started session: Test on Chrome latest - Windows 10
📍 Platform: Windows 10
🌐 Browser: Chrome latest

=== RUNNING TEST SUITE ===

[Test 1/4] Opening website...
✓ Website opened successfully
  URL: https://www.google.com

[Test 2/4] Verifying page title...
  Page Title: Google
✓ Title verification passed

[Test 3/4] Testing search functionality...
  Entered: DateTimeChecker automation testing
✓ Search functionality working

[Test 4/4] Verifying search results...
  Current URL: https://www.google.com/search?q=...
✓ Search results loaded successfully

✅ ALL TESTS PASSED!

📊 Test Status: PASSED
📝 Reason: All test cases passed successfully!

🔚 Browser session closed

╔═══════════════════════════════════════════════╗
║           TEST EXECUTION COMPLETED            ║
╚═══════════════════════════════════════════════╝

📊 View detailed results at:
   https://automation.lambdatest.com/timeline
```

---

## 🌐 Browsers & Platforms Supported

### Desktop Browsers:
- ✅ Chrome (70+ versions)
- ✅ Firefox (60+ versions)
- ✅ Safari (11+ versions)
- ✅ Edge (80+ versions)
- ✅ Opera (50+ versions)
- ✅ Internet Explorer (IE11, IE10, IE9)

### Operating Systems:
- ✅ Windows 11, 10, 8.1, 8, 7
- ✅ macOS Ventura, Monterey, Big Sur, Catalina, Mojave
- ✅ Linux (Ubuntu, Fedora, etc.)

### Mobile Browsers:
- ✅ Chrome Mobile
- ✅ Safari Mobile
- ✅ Samsung Internet
- ✅ UC Browser

### Resolutions:
- 1024x768, 1280x1024, 1366x768, 1440x900
- 1680x1050, 1920x1080, 2048x1536, 2560x1440

---

## 🔄 Parallel Testing

Chạy nhiều browsers cùng lúc để tiết kiệm thời gian!

### Configuration trong `testng.xml`:
```xml
<suite name="Parallel Test Suite" parallel="tests" thread-count="5">
    <test name="Chrome on Windows">...</test>
    <test name="Firefox on Windows">...</test>
    <test name="Safari on macOS">...</test>
    <test name="Edge on Windows">...</test>
    <test name="Opera on Linux">...</test>
</suite>
```

### Chạy parallel tests:
```bash
mvn test -DsuiteXmlFile=testng.xml
```

### Kết quả:
- ❌ **Sequential**: 5 browsers × 3 phút = **15 phút**
- ✅ **Parallel**: Tất cả 5 browsers cùng lúc = **~3 phút**

**Tiết kiệm 80% thời gian!** ⚡

---

## 🔧 CI/CD Integration (GitHub Actions)

### Setup GitHub Secrets:
1. Vào repository → **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Thêm 2 secrets:
   - Name: `LAMBDATEST_USERNAME`, Value: `your_username`
   - Name: `LAMBDATEST_ACCESS_KEY`, Value: `your_access_key`

### Workflow đã được tạo tại:
`.github/workflows/lambdatest.yml`

### Tự động chạy khi:
- ✅ Push code lên main/develop branch
- ✅ Tạo Pull Request
- ✅ Chạy thủ công từ Actions tab
- ✅ Schedule: Hàng ngày lúc 00:00 UTC

### Xem kết quả:
1. Vào repository
2. Click tab **Actions**
3. Click vào workflow run
4. Xem logs và summary

---

## 💡 Advanced Features

### 1. Mark Test as Passed/Failed
```java
((JavascriptExecutor) driver).executeScript("lambda-status=passed");
((JavascriptExecutor) driver).executeScript("lambda-status=failed");
```

### 2. Custom Test Name
```java
capabilities.setCapability("name", "My Custom Test Name");
```

### 3. Build Name
```java
capabilities.setCapability("build", "Build v1.0.0 - 2024-01-15");
```

### 4. Enable Network Logs
```java
capabilities.setCapability("network", true);
```

### 5. Enable Console Logs
```java
capabilities.setCapability("console", true);
```

### 6. Video Recording
```java
capabilities.setCapability("video", true);
```

### 7. Custom Resolution
```java
capabilities.setCapability("resolution", "2560x1440");
```

### 8. Tunnel for Local Testing
```java
capabilities.setCapability("tunnel", true);
capabilities.setCapability("tunnelName", "my-tunnel");
```

---

## 🐛 Troubleshooting

### Lỗi: "Invalid credentials"
- ✅ Kiểm tra USERNAME và ACCESS_KEY
- ✅ Đảm bảo không có khoảng trắng thừa
- ✅ Verify tại: https://accounts.lambdatest.com/profile

### Lỗi: "Session timeout"
- ✅ Kiểm tra internet connection
- ✅ Tăng timeout trong code:
  ```java
  driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  ```

### Lỗi: "Concurrent session limit exceeded"
- ✅ Free plan: 6 concurrent sessions
- ✅ Đợi tests cũ hoàn thành
- ✅ Giảm `thread-count` trong testng.xml

### Lỗi: "Build failed"
- ✅ Chạy: `mvn clean install -U`
- ✅ Xóa folder `target/` và build lại
- ✅ Kiểm tra Java version: `java -version`

### Tests chạy quá chậm
- ✅ Sử dụng parallel testing
- ✅ Tối ưu test cases
- ✅ Giảm `Thread.sleep()` trong code

### Video không hiển thị
- ✅ Kiểm tra: `capabilities.setCapability("video", true);`
- ✅ Đợi vài phút sau khi test chạy xong
- ✅ Refresh dashboard page

---

## 📚 Resources

### Documentation:
- 📖 LambdaTest Docs: https://www.lambdatest.com/support/docs/
- 📖 Selenium Docs: https://www.selenium.dev/documentation/
- 📖 TestNG Docs: https://testng.org/doc/

### Tutorials:
- 🎥 LambdaTest YouTube: https://www.youtube.com/c/LambdaTest
- 📝 Getting Started: https://www.lambdatest.com/support/docs/getting-started-with-lambdatest-automation/
- 📝 Selenium Java: https://www.lambdatest.com/support/docs/java-with-selenium/

### Community:
- 💬 Community Forum: https://community.lambdatest.com/
- 💬 Discord: https://discord.gg/lambdatest
- 📧 Support: support@lambdatest.com

### LambdaTest Capabilities Generator:
- 🔧 https://www.lambdatest.com/capabilities-generator/

---

## ✅ Checklist

- [ ] Đã đăng ký LambdaTest account
- [ ] Đã lấy Username và Access Key
- [ ] Đã set environment variables hoặc sửa code
- [ ] Đã cài Maven
- [ ] Đã chạy `mvn clean install`
- [ ] Đã chạy `.\run-lambdatest.bat` thành công
- [ ] Đã xem kết quả trên dashboard
- [ ] Đã xem video recording
- [ ] Đã setup GitHub Actions secrets (optional)
- [ ] Đã test parallel execution (optional)

---

## 🎯 Next Steps

1. ✅ **Customize tests**: Sửa `LambdaTestRunner.java` để test app của bạn
2. ✅ **Add more browsers**: Thêm vào `testng.xml`
3. ✅ **Setup CI/CD**: Push lên GitHub và watch Actions
4. ✅ **Explore dashboard**: Xem tất cả features
5. ✅ **Read documentation**: Học thêm advanced features

---

**🚀 Happy Testing on LambdaTest Cloud!**

💡 **Tip**: Start với 1 browser để test, sau đó scale lên parallel testing khi đã quen!
