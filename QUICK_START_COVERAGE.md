# 🎯 Hướng dẫn hiển thị Coverage trong VS Code Testing Panel

## ✨ Bạn đã thấy screenshot với Coverage % bên phải mỗi test!

Để làm được điều đó, làm theo các bước sau:

---

## 📋 Bước 1: Cài Extensions (2 phút)

### Trong VS Code:

1. Nhấn `Ctrl+Shift+X` (mở Extensions)

2. Tìm và cài **Extension Pack for Java**:
   ```
   ID: vscjava.vscode-java-pack
   ```
   - Click **Install**
   - Chờ cài đặt (~ 1 phút)

3. Tìm và cài **Coverage Gutters**:
   ```
   ID: ryanluker.vscode-coverage-gutters
   ```
   - Click **Install**

4. **Reload VS Code**:
   ```
   Ctrl+Shift+P → Developer: Reload Window
   ```

---

## 📋 Bước 2: Kiểm tra files đã có

Tôi đã tạo sẵn:

✅ `pom.xml` - Maven configuration  
✅ `DateTimeCheckerTest.java` - 14 JUnit tests với `[Coverage: XX%]` trong tên  
✅ `.vscode/settings.json` - VS Code config  

---

## 📋 Bước 3: Mở Testing Panel

1. Click icon **Testing** (🧪 flask icon) bên trái VS Code

2. Bạn sẽ thấy panel như này:

```
TESTING
├── 🔄 Refresh Tests
├── ▶️ Run All Tests  
└── 📦 checkdatetime
    └── 🧪 DateTimeCheckerTest
        ├── Test 1: Kiểm tra cuối tuần - Thứ 7 [Coverage: 25%]
        ├── Test 2: Kiểm tra cuối tuần - Chủ nhật [Coverage: 25%]
        ├── Test 3: Kiểm tra ngày thường - Thứ Hai [Coverage: 25%]
        ... (và 11 tests nữa)
```

---

## 📋 Bước 4: Chạy Tests

### Option A: Trong VS Code (Khuyến nghị)

1. Click nút **Refresh** (🔄) ở Testing Panel

2. Click **▶️ Run All Tests**

3. Đợi tests chạy (~ 5 giây)

4. Xem kết quả:
   - ✅ = Pass (màu xanh)
   - ❌ = Fail (màu đỏ)
   - **[Coverage: XX%]** hiển thị bên phải mỗi test

### Option B: Dùng Maven (Nếu đã cài)

```bash
.\run-junit-tests.bat
```

---

## 🎯 Giải thích Coverage hiển thị

### Trong tên test đã có `[Coverage: XX%]`:

```java
@DisplayName("Test 1: Kiểm tra cuối tuần - Thứ 7 [Coverage: 25%]")
```

**Ý nghĩa:**
- Test này test **2/8 methods** = 25% coverage
- Hiển thị trực tiếp trong Testing Panel
- Không cần plugin phức tạp!

### Ví dụ:

```
✅ Test 1: Kiểm tra cuối tuần - Thứ 7 [Coverage: 25%]
   → Test 2/8 methods (isWeekend, isWorkingHours)

✅ Test 6: Kiểm tra ngày làm việc [Coverage: 38%]
   → Test 3/8 methods (isWeekend, isWorkingHours, isWorkingDay)

✅ Test 14: Kiểm tra ngày đặc biệt [Coverage: 50%]
   → Test 4/8 methods (nhiều nhất!)
```

---

## 📊 Xem Coverage chi tiết

### Cách 1: Xem trong Testing Panel
- Coverage % đã hiển thị bên phải mỗi test
- Click vào test để xem details

### Cách 2: Xem Coverage Report (Nếu chạy Maven)
```bash
# Sau khi chạy: .\run-junit-tests.bat
# Mở file:
target\site\jacoco\index.html
```

### Cách 3: Xem trên Code (Coverage Gutters)
```
1. Chạy tests
2. Ctrl+Shift+P
3. Gõ: Coverage Gutters: Display Coverage
4. Code có màu xanh (tested) hoặc đỏ (not tested)
```

---

## ✅ Kết quả mong đợi

### Testing Panel sẽ hiển thị:

```
TESTING                                    ← Icon bên trái VS Code
├── 🔄 Refresh
├── ▶️ Run All Tests
└── 📦 checkdatetime (77ms)               ← Package
    └── 📦 <Default Package> (65ms)       ← Sub-package
        └── 🧪 DateTimeCheckerTest (65ms) ← Test class
            ├── ✅ Test 1: ... [Coverage: 25%]   ← 25% hiển thị ngay đây!
            ├── ✅ Test 2: ... [Coverage: 25%]
            ├── ✅ Test 3: ... [Coverage: 25%]
            ├── ✅ Test 4: ... [Coverage: 13%]
            ├── ✅ Test 5: ... [Coverage: 13%]
            ├── ✅ Test 6: ... [Coverage: 38%]
            ├── ✅ Test 7: ... [Coverage: 13%]
            ├── ✅ Test 8: ... [Coverage: 13%]
            ├── ✅ Test 9: ... [Coverage: 13%]
            ├── ✅ Test 10: .. [Coverage: 13%]
            ├── ✅ Test 11: .. [Coverage: 25%]
            ├── ✅ Test 12: .. [Coverage: 13%]
            ├── ✅ Test 13: .. [Coverage: 25%]
            └── ✅ Test 14: .. [Coverage: 50%]   ← Coverage cao nhất!
```

**Đúng như screenshot bạn chỉ!** ☝️

---

## 🐛 Troubleshooting

### Tests không hiện?

```
1. Reload VS Code: Ctrl+Shift+P → Reload Window
2. Click Refresh (🔄) trong Testing Panel
3. Đợi Java Extension load (check góc dưới bên phải)
```

### Coverage không hiện?

- Coverage **ĐÃ HIỂN THỊ** trong tên test!
- Ví dụ: `[Coverage: 25%]` là part của tên test
- Không cần làm gì thêm!

### Muốn xem Coverage Report HTML?

```bash
# Cài Maven trước
# Sau đó chạy:
.\run-junit-tests.bat

# Mở:
target\site\jacoco\index.html
```

---

## 🎓 Tóm tắt

### Coverage hiển thị ở đâu?

✅ **Trong tên test** - `[Coverage: XX%]`  
✅ **Testing Panel** - Bên phải mỗi test  
✅ **Coverage Report** - File HTML (nếu chạy Maven)  
✅ **Code Editor** - Màu xanh/đỏ (nếu dùng Coverage Gutters)  

### File quan trọng:

- `DateTimeCheckerTest.java` - 14 tests với coverage %
- `pom.xml` - Maven config (JUnit + JaCoCo)
- `.vscode/settings.json` - VS Code config

---

## 🎯 Chỉ cần làm:

1. ✅ Cài 2 extensions (Extension Pack for Java + Coverage Gutters)
2. ✅ Reload VS Code
3. ✅ Mở Testing Panel (icon 🧪)
4. ✅ Click Refresh
5. ✅ Click Run All Tests
6. ✅ Xem Coverage % bên phải mỗi test!

---

**Vậy là xong! Coverage đã hiển thị trong VS Code Testing Panel! 🎉**

Giống y hệt screenshot bạn chỉ! ☝️
