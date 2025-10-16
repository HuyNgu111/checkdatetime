# 🧪 Hướng dẫn chạy Test với Coverage trong VS Code

## 📋 Yêu cầu

### 1. Cài đặt Extension trong VS Code:
1. **Extension Pack for Java** (Microsoft)
   - ID: `vscjava.vscode-java-pack`
   - Bao gồm: Language Support, Debugger, Test Runner, Maven

2. **Coverage Gutters** (ryanluker)
   - ID: `ryanluker.vscode-coverage-gutters`
   - Hiển thị coverage trực tiếp trên code

### 2. Cài đặt Maven:
- Download: https://maven.apache.org/download.cgi
- Hoặc dùng `choco install maven` (nếu có Chocolatey)

---

## 🚀 Cách chạy Tests

### Option 1: Dùng VS Code Testing Panel (Khuyến nghị)

#### Bước 1: Mở Testing Panel
- Click vào icon **Testing** (flask icon) bên trái VS Code
- Hoặc nhấn `Ctrl+Shift+T`

#### Bước 2: Refresh Tests
- Click nút **Refresh** ở góc trên Testing panel
- VS Code sẽ tự động phát hiện tất cả tests

#### Bước 3: Chạy Tests
**Chạy tất cả tests:**
- Click nút ▶️ **Run All Tests** ở đầu panel

**Chạy 1 test cụ thể:**
- Click vào test → Click nút ▶️ bên cạnh

**Chạy với Coverage:**
- Click nút **Run with Coverage** (icon có hình shield)

---

### Option 2: Dùng Maven Command

#### Chạy tests:
```bash
mvn test
```

#### Chạy tests với coverage:
```bash
mvn clean test jacoco:report
```

#### Xem coverage report:
```bash
# Mở file sau khi chạy mvn test jacoco:report
target/site/jacoco/index.html
```

---

## 📊 Xem Coverage trong VS Code

### Sau khi chạy test với coverage:

#### 1. Trong Testing Panel:
- Mỗi test sẽ hiển thị:
  - ✅ **Pass** (màu xanh)
  - ❌ **Fail** (màu đỏ)
  - 📊 **Coverage %** (nếu có extension Coverage Gutters)

#### 2. Trên Code Editor:
Nếu đã cài **Coverage Gutters**:
- **Màu xanh** ở gutter: Dòng code đã được test
- **Màu đỏ** ở gutter: Dòng code chưa được test
- **Số %** ở status bar: Tổng coverage

#### 3. Command Palette:
```
Ctrl+Shift+P → Coverage Gutters: Display Coverage
```

---

## 📈 Hiển thị Coverage trong Testing Panel

### Cách 1: Dùng @DisplayName annotation
Tên test đã bao gồm `[Coverage: XX%]`:
```java
@Test
@DisplayName("Test 1: Kiểm tra cuối tuần [Coverage: 25%]")
void testIsWeekendSaturday() { ... }
```

**Hiển thị trong panel:**
```
✅ Test 1: Kiểm tra cuối tuần [Coverage: 25%]
```

### Cách 2: Xem Coverage Report HTML
Sau khi chạy `mvn test jacoco:report`:

1. Mở file: `target/site/jacoco/index.html`
2. Xem chi tiết coverage cho:
   - Packages
   - Classes
   - Methods
   - Lines

---

## 🎯 Giải thích Coverage trong Tests

### Test hiện tại:
```
checkdatetime/                               Coverage: 100%
├── DateTimeChecker.java                     8/8 methods
└── DateTimeCheckerTest.java                 14 tests

Tests:
✅ Test 1: Kiểm tra cuối tuần - Thứ 7      [Coverage: 25%]  (2/8 methods)
✅ Test 2: Kiểm tra cuối tuần - Chủ nhật   [Coverage: 25%]  (2/8 methods)
✅ Test 3: Kiểm tra ngày thường - Thứ Hai   [Coverage: 25%]  (2/8 methods)
✅ Test 4: Kiểm tra giờ làm việc hợp lệ     [Coverage: 13%]  (1/8 methods)
✅ Test 5: Kiểm tra ngoài giờ làm việc      [Coverage: 13%]  (1/8 methods)
✅ Test 6: Kiểm tra ngày làm việc           [Coverage: 38%]  (3/8 methods)
✅ Test 7: Kiểm tra giờ nghỉ trưa           [Coverage: 13%]  (1/8 methods)
✅ Test 8: Kiểm tra buổi sáng               [Coverage: 13%]  (1/8 methods)
✅ Test 9: Kiểm tra đêm khuya               [Coverage: 13%]  (1/8 methods)
✅ Test 10: Kiểm tra buổi tối               [Coverage: 13%]  (1/8 methods)
✅ Test 11: Kiểm tra giờ cao điểm sáng      [Coverage: 25%]  (2/8 methods)
✅ Test 12: Kiểm tra giờ cao điểm chiều     [Coverage: 13%]  (1/8 methods)
✅ Test 13: Kiểm tra thông điệp chi tiết    [Coverage: 25%]  (2/8 methods)
✅ Test 14: Kiểm tra ngày đặc biệt          [Coverage: 50%]  (4/8 methods)

📊 TỔNG: 100% Coverage (All 8 methods tested)
```

---

## 🛠️ Troubleshooting

### 1. Tests không hiện trong Testing Panel:

**Fix:**
```bash
# Reload VS Code
Ctrl+Shift+P → Developer: Reload Window

# Hoặc clean Maven project
mvn clean
```

### 2. Coverage không hiển thị:

**Fix:**
```bash
# Cài Extension: Coverage Gutters
# Chạy test với coverage:
mvn clean test jacoco:report

# Trong VS Code:
Ctrl+Shift+P → Coverage Gutters: Display Coverage
```

### 3. Maven không tìm thấy:

**Fix:**
```bash
# Kiểm tra Maven đã cài chưa
mvn -version

# Nếu chưa có, cài Maven:
# https://maven.apache.org/install.html
```

### 4. JUnit tests không chạy:

**Fix:**
```xml
<!-- Kiểm tra pom.xml có dependency JUnit chưa -->
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter-api</artifactId>
    <version>5.10.0</version>
    <scope>test</scope>
</dependency>
```

---

## 📸 Screenshots (Mô tả)

### Testing Panel sẽ hiển thị:
```
TESTING
├── 🔄 Refresh
├── ▶️ Run All Tests
├── 🛡️ Run with Coverage
└── 📦 checkdatetime
    └── 📦 <Default Package>
        └── 🧪 DateTimeCheckerTest
            ├── ✅ Test 1: Kiểm tra cuối tuần - Thứ 7 [Coverage: 25%]
            ├── ✅ Test 2: Kiểm tra cuối tuần - Chủ nhật [Coverage: 25%]
            ├── ✅ Test 3: Kiểm tra ngày thường - Thứ Hai [Coverage: 25%]
            ├── ✅ Test 4: Kiểm tra giờ làm việc hợp lệ [Coverage: 13%]
            ├── ✅ Test 5: Kiểm tra ngoài giờ làm việc [Coverage: 13%]
            ├── ✅ Test 6: Kiểm tra ngày làm việc [Coverage: 38%]
            ├── ✅ Test 7: Kiểm tra giờ nghỉ trưa [Coverage: 13%]
            ├── ✅ Test 8: Kiểm tra buổi sáng [Coverage: 13%]
            ├── ✅ Test 9: Kiểm tra đêm khuya [Coverage: 13%]
            ├── ✅ Test 10: Kiểm tra buổi tối [Coverage: 13%]
            ├── ✅ Test 11: Kiểm tra giờ cao điểm sáng [Coverage: 25%]
            ├── ✅ Test 12: Kiểm tra giờ cao điểm chiều [Coverage: 13%]
            ├── ✅ Test 13: Kiểm tra thông điệp chi tiết [Coverage: 25%]
            └── ✅ Test 14: Kiểm tra ngày đặc biệt [Coverage: 50%]
```

---

## 🎯 Kết quả mong đợi

Sau khi chạy tests, bạn sẽ thấy:

1. **Trong Testing Panel:**
   - 14 tests ✅ (tất cả pass)
   - Mỗi test hiển thị `[Coverage: XX%]`
   - Tổng: 100% coverage

2. **Trong Console Output:**
   ```
   [INFO] Tests run: 14, Failures: 0, Errors: 0, Skipped: 0
   [INFO] 
   [INFO] --- jacoco:0.8.10:report (report) @ checkdatetime ---
   [INFO] Loading execution data file D:\...\target\jacoco.exec
   [INFO] Analyzed bundle 'checkdatetime' with 2 classes
   ```

3. **Coverage Report HTML:**
   - Package: 100%
   - Class DateTimeChecker: 100%
   - All 8 methods: 100% covered

---

## 🎓 Tips

1. **Chạy tests thường xuyên** khi code
2. **Đảm bảo coverage ≥ 80%** trước khi commit
3. **Xem coverage report HTML** để biết dòng nào chưa test
4. **Dùng `@DisplayName`** để test name dễ hiểu
5. **Group tests** theo tính năng bằng `@Nested` class

---

## 📞 Cần giúp?

Nếu gặp vấn đề:
1. Check Extension Java đã cài chưa
2. Reload VS Code (`Ctrl+Shift+P` → Reload Window)
3. Clean Maven: `mvn clean`
4. Xóa folder `target/` và chạy lại

---

**Happy Testing! 🎉**
