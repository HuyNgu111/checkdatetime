# 📊 Hướng dẫn tạo Coverage Report

## 🎯 Coverage Report là gì?

**Coverage Report** là báo cáo chi tiết về độ bao phủ (coverage) của code khi chạy tests:

- **Line Coverage**: Bao nhiêu % dòng code đã được test
- **Branch Coverage**: Bao nhiêu % nhánh if/else đã được test
- **Method Coverage**: Bao nhiêu % methods đã được test
- **Class Coverage**: Bao nhiêu % classes đã được test

---

## 🚀 Cách tạo Coverage Report (3 cách)

### ⭐ Cách 1: Dùng Script (Khuyến nghị - Dễ nhất!)

```bash
cd d:\PRO192\new_pro192\checkdatetime
.\run-tests-with-coverage.bat
```

**Script sẽ tự động:**
1. ✅ Check Java/Maven
2. ✅ Download dependencies (JUnit 5 + JaCoCo)
3. ✅ Chạy 14 tests
4. ✅ Tạo Coverage Report HTML
5. ✅ Tự động mở report trong browser

---

### Cách 2: Dùng Maven Command

```bash
# Bước 1: Clean project
mvn clean

# Bước 2: Chạy tests và tạo coverage report
mvn test jacoco:report

# Bước 3: Mở report
start target\site\jacoco\index.html
```

---

### Cách 3: Trong VS Code với Extension

1. **Cài Extension: Coverage Gutters**
   ```
   ID: ryanluker.vscode-coverage-gutters
   ```

2. **Chạy tests:**
   - Mở Testing Panel (🧪)
   - Click "Run All Tests"

3. **Xem Coverage:**
   ```
   Ctrl+Shift+P → Coverage Gutters: Display Coverage
   ```
   - Màu xanh = tested ✅
   - Màu đỏ = not tested ❌

---

## 📂 Vị trí các files Report

### Sau khi chạy `mvn test jacoco:report`:

```
checkdatetime/
└── target/
    └── site/
        └── jacoco/
            ├── index.html              ← MỞ FILE NÀY! ⭐
            ├── jacoco.xml              (Coverage XML)
            ├── jacoco.csv              (Coverage CSV)
            └── checkdatetime/
                ├── DateTimeChecker.html
                └── DateTimeCheckerTest.html
```

---

## 📊 Cấu trúc Coverage Report HTML

### Trang chủ (index.html):

```
┌─────────────────────────────────────────────────────┐
│  JaCoCo Coverage Report                             │
├─────────────────────────────────────────────────────┤
│                                                     │
│  📦 Package: checkdatetime                          │
│                                                     │
│  Coverage Summary:                                  │
│  ├─ Instruction Coverage:  100%  ████████████      │
│  ├─ Branch Coverage:       100%  ████████████      │
│  ├─ Line Coverage:         100%  ████████████      │
│  ├─ Complexity:            15                      │
│  ├─ Method Coverage:       100%  (8/8)             │
│  └─ Class Coverage:        100%  (1/1)             │
│                                                     │
│  📄 Classes:                                        │
│  ├─ DateTimeChecker.java         100% coverage     │
│  └─ DateTimeCheckerTest.java     N/A (test file)   │
│                                                     │
└─────────────────────────────────────────────────────┘
```

### Click vào DateTimeChecker.java:

```
┌─────────────────────────────────────────────────────┐
│  DateTimeChecker.java                               │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Method Coverage:                                   │
│  ├─ isWeekend()               100%  ✅             │
│  ├─ isWorkingHours()          100%  ✅             │
│  ├─ isWorkingDay()            100%  ✅             │
│  ├─ isLunchTime()             100%  ✅             │
│  ├─ isMorning()               100%  ✅             │
│  ├─ isEvening()               100%  ✅             │
│  ├─ getWeekendMessage()       100%  ✅             │
│  └─ getWorkingHoursMessage()  100%  ✅             │
│                                                     │
│  Source Code (với màu sắc):                         │
│  10:  public static boolean isWeekend(...) {       │
│  11:    DayOfWeek day = dateTime.getDayOfWeek();   │ ← Màu xanh = tested
│  12:    return day == SATURDAY || day == SUNDAY;   │ ← Màu xanh = tested
│  13:  }                                             │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## 🎨 Màu sắc trong Report

### Trong HTML Report:

| Màu | Ý nghĩa |
|-----|---------|
| 🟢 **Xanh lá** | Dòng code đã được test ✅ |
| 🔴 **Đỏ** | Dòng code CHƯA được test ❌ |
| 🟡 **Vàng** | Branch chỉ test 1 phía (if/else) ⚠️ |
| ⚪ **Trắng** | Code không thể test (comments, declarations) |

### Coverage Percentage:

| % | Màu | Đánh giá |
|---|-----|----------|
| 80-100% | 🟢 Xanh | Excellent ⭐⭐⭐ |
| 60-79% | 🟡 Vàng | Good ⭐⭐ |
| 0-59% | 🔴 Đỏ | Poor ⭐ |

---

## 📈 Ví dụ Coverage Report

### Package Level:
```
Package: checkdatetime
├─ Instruction Coverage:  347/347    (100%)  ✅
├─ Branch Coverage:       24/24      (100%)  ✅
├─ Line Coverage:         89/89      (100%)  ✅
├─ Complexity:            15
├─ Method Coverage:       8/8        (100%)  ✅
└─ Class Coverage:        1/1        (100%)  ✅
```

### Method Level:
```
Method: isWeekend(LocalDateTime)
├─ Instruction Coverage:  8/8      (100%)  ✅
├─ Branch Coverage:       2/2      (100%)  ✅
├─ Line Coverage:         3/3      (100%)  ✅
└─ Complexity:            3

Tested by:
  ✓ testIsWeekendSaturday()
  ✓ testIsWeekendSunday()
  ✓ testIsNotWeekendMonday()
```

---

## 🔍 Chi tiết từng loại Coverage

### 1. **Line Coverage** (Độ bao phủ dòng)
```java
// 100% Line Coverage
public static boolean isWeekend(LocalDateTime dt) {    // Line 1 ✅
    DayOfWeek day = dt.getDayOfWeek();                  // Line 2 ✅
    return day == SATURDAY || day == SUNDAY;            // Line 3 ✅
}
```

### 2. **Branch Coverage** (Độ bao phủ nhánh)
```java
// 100% Branch Coverage
if (hour >= 8 && hour <= 17) {    // Tested: true ✅ và false ✅
    return true;
} else {
    return false;
}
```

### 3. **Method Coverage** (Độ bao phủ method)
```
8/8 methods tested = 100% ✅
  ✓ isWeekend()
  ✓ isWorkingHours()
  ✓ isWorkingDay()
  ✓ isLunchTime()
  ✓ isMorning()
  ✓ isEvening()
  ✓ getWeekendMessage()
  ✓ getWorkingHoursMessage()
```

---

## 🛠️ Tùy chỉnh Coverage Report

### Thay đổi ngưỡng Coverage trong pom.xml:

```xml
<configuration>
    <rules>
        <rule>
            <element>PACKAGE</element>
            <limits>
                <limit>
                    <counter>LINE</counter>
                    <value>COVEREDRATIO</value>
                    <minimum>0.80</minimum>  ← Thay đổi ở đây (80%)
                </limit>
            </limits>
        </rule>
    </rules>
</configuration>
```

---

## 📊 Các metrics trong Report

### 1. **Instruction Coverage** (Coverage lệnh)
- Đếm số lượng bytecode instructions
- Chính xác nhất
- **Target: 100%**

### 2. **Branch Coverage** (Coverage nhánh)
- Đếm các nhánh if/else, switch
- Đảm bảo test cả true/false
- **Target: 100%**

### 3. **Line Coverage** (Coverage dòng)
- Đếm số dòng code
- Dễ hiểu nhất
- **Target: ≥ 80%**

### 4. **Complexity** (Độ phức tạp)
- McCabe Cyclomatic Complexity
- Số đường đi khác nhau trong code
- **Target: < 10 per method**

### 5. **Method Coverage**
- % methods đã test
- **Target: 100%**

### 6. **Class Coverage**
- % classes đã test
- **Target: 100%**

---

## 📸 Screenshots Report (Mô tả)

### 1. Package Overview:
```
┌────────────────────────────────────────┐
│ checkdatetime                   100%   │ ← Package name + coverage
├────────────────────────────────────────┤
│ Element          Missed  Covered  %    │
├────────────────────────────────────────┤
│ Instructions        0      347   100%  │ ← Màu xanh
│ Branches            0       24   100%  │ ← Màu xanh
│ Lines               0       89   100%  │ ← Màu xanh
│ Methods             0        8   100%  │ ← Màu xanh
│ Classes             0        1   100%  │ ← Màu xanh
└────────────────────────────────────────┘
```

### 2. Class Detail:
```
┌────────────────────────────────────────┐
│ DateTimeChecker.java                   │
├────────────────────────────────────────┤
│ Method                      Coverage   │
├────────────────────────────────────────┤
│ isWeekend()                 100% ✅    │
│ isWorkingHours()            100% ✅    │
│ isWorkingDay()              100% ✅    │
│ isLunchTime()               100% ✅    │
│ isMorning()                 100% ✅    │
│ isEvening()                 100% ✅    │
│ getWeekendMessage()         100% ✅    │
│ getWorkingHoursMessage()    100% ✅    │
└────────────────────────────────────────┘
```

### 3. Source Code View:
```
Màu xanh lá:   Dòng đã test ✅
Màu đỏ:        Dòng chưa test ❌
Màu vàng:      Branch 1 phía ⚠️
```

---

## ✅ Kết quả mong đợi

### Sau khi chạy script:

```
[Bước 1/4] Kiểm tra Java... OK ✅
[Bước 2/4] Kiểm tra Maven... OK ✅
[Bước 3/4] Download dependencies... OK ✅
[Bước 4/4] Chạy tests và tạo Coverage Report...

Running checkdatetime.DateTimeCheckerTest
Tests run: 14, Failures: 0, Errors: 0, Skipped: 0

============================================================
  HOÀN THÀNH! Coverage Report đã được tạo!
============================================================

📊 Coverage Report HTML:
   target\site\jacoco\index.html       ← Mở file này!

📄 Coverage XML:
   target\site\jacoco\jacoco.xml

📝 Test Results:
   target\surefire-reports\

Đang mở Coverage Report trong browser...
```

Browser tự động mở **index.html** với:
- ✅ 100% Instruction Coverage
- ✅ 100% Branch Coverage
- ✅ 100% Line Coverage
- ✅ 100% Method Coverage (8/8)
- ✅ 100% Class Coverage (1/1)

---

## 🎯 Checklist

- [ ] Cài Maven (nếu chưa có)
- [ ] Chạy script: `.\run-tests-with-coverage.bat`
- [ ] Đợi tests chạy xong (~ 30 giây)
- [ ] Mở `target\site\jacoco\index.html`
- [ ] Xem coverage 100% ✅
- [ ] Click vào `DateTimeChecker.java` để xem chi tiết
- [ ] Kiểm tra tất cả methods đều xanh lá ✅

---

## 💡 Tips

1. **Chạy coverage trước mỗi commit** để đảm bảo code quality
2. **Target: ≥ 80% coverage** cho production code
3. **100% coverage không = bug-free** nhưng giảm thiểu risks
4. **Xem màu đỏ** trong report để biết code nào chưa test
5. **Branch coverage quan trọng** hơn line coverage

---

## 🐛 Troubleshooting

### Report không được tạo?
```bash
# Check Maven
mvn -version

# Clean và chạy lại
mvn clean test jacoco:report
```

### File index.html không mở?
```bash
# Mở thủ công
start target\site\jacoco\index.html
```

### Coverage = 0%?
```bash
# Check tests đã chạy chưa
mvn test
# Nếu tests pass, chạy:
mvn jacoco:report
```

---

## 📞 Cần giúp?

1. Chạy script: `.\run-tests-with-coverage.bat`
2. Nếu lỗi, check:
   - Java đã cài? (`java -version`)
   - Maven đã cài? (`mvn -version`)
   - Tests pass? (xem console output)
3. Mở file: `target\site\jacoco\index.html`

---

**Chúc bạn thành công! 🎉**

Coverage Report sẽ giúp bạn:
- ✅ Biết code nào đã test
- ✅ Biết code nào chưa test
- ✅ Đảm bảo quality
- ✅ Tự tin khi refactor
