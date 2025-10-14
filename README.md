# DateTimeChecker Project

![CI](https://github.com/HuyNgu111/checkdatetime/actions/workflows/ci.yml/badge.svg)
[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![JUnit](https://img.shields.io/badge/JUnit-5-green.svg)](https://junit.org/junit5/)
[![JaCoCo](https://img.shields.io/badge/Coverage-JaCoCo-blue.svg)](https://www.jacoco.org/)

## 📋 Mô tả

DateTimeChecker là một ứng dụng Java kiểm tra và phân loại thời gian, cung cấp các chức năng:
- Kiểm tra cuối tuần
- Kiểm tra giờ làm việc
- Kiểm tra giờ nghỉ trưa
- Kiểm tra các khoảng thời gian trong ngày
- Tạo thông điệp mô tả thời gian

## ✨ Tính năng

### Các phương thức chính:

- **isWeekend()** - Kiểm tra cuối tuần (Thứ 7, Chủ nhật)
- **isWorkingHours()** - Kiểm tra giờ làm việc (8h-17h)
- **isWorkingDay()** - Kiểm tra ngày làm việc
- **isLunchTime()** - Kiểm tra giờ nghỉ trưa (12h-13h)
- **isMorning()** - Kiểm tra buổi sáng (6h-12h)
- **isAfternoon()** - Kiểm tra buổi chiều (12h-18h)
- **isEvening()** - Kiểm tra buổi tối (18h-22h)
- **isLateNight()** - Kiểm tra đêm khuya (22h-6h)
- **isMorningRush()** - Kiểm tra giờ cao điểm sáng (7h-9h)
- **isEveningRush()** - Kiểm tra giờ cao điểm chiều (17h-19h)
- **isSpecialDay()** - Kiểm tra ngày đặc biệt
- **getDetailedTimeMessage()** - Lấy thông điệp chi tiết về thời gian
- **getHoursUntilEndOfWork()** - Tính giờ còn lại đến hết giờ làm việc

## 🧪 Testing

Project bao gồm **15 test cases** sử dụng JUnit 5:

- Test 1-3: Kiểm tra cuối tuần
- Test 4-5: Kiểm tra giờ làm việc
- Test 6: Kiểm tra ngày làm việc
- Test 7: Kiểm tra giờ nghỉ trưa
- Test 8: Kiểm tra các khoảng thời gian và messages
- Test 9: Kiểm tra đêm khuya
- Test 10: Kiểm tra buổi chiều
- Test 11: Kiểm tra giờ cao điểm sáng
- Test 12: Kiểm tra giờ cao điểm chiều
- Test 13: Kiểm tra message chi tiết
- Test 14: Kiểm tra ngày đặc biệt
- Test 15: Kiểm tra giờ còn lại đến hết giờ làm việc

## 📊 Coverage Report

Code coverage được tạo tự động bằng JaCoCo và có thể xem trong GitHub Actions Artifacts.

### Chạy tests local:

```bash
.\run-15-tests.bat
```

Coverage report sẽ được tạo tại: `coverage/html/index.html`

## 🚀 CI/CD

Project sử dụng GitHub Actions để tự động:
- ✅ Compile source code
- ✅ Compile test code
- ✅ Chạy 15 JUnit test cases
- ✅ Tạo JaCoCo coverage report
- ✅ Upload artifacts (coverage report)

CI/CD workflow chạy tự động khi:
- Push code lên branch main/master/develop
- Tạo Pull Request
- Chạy thủ công qua GitHub Actions

### Xem kết quả CI/CD:
👉 [GitHub Actions](https://github.com/HuyNgu111/checkdatetime/actions)

## 🛠️ Công nghệ sử dụng

- **Java**: 17+
- **JUnit**: 5.10.0
- **JaCoCo**: 0.8.8
- **Build Tool**: Apache Ant
- **CI/CD**: GitHub Actions

## 📁 Cấu trúc Project

```
checkdatetime/
├── src/
│   └── DateTimeChecker.java          # Main source code
├── DateTimeCheckerTest.java          # JUnit test cases
├── .github/
│   └── workflows/
│       └── ci.yml                     # GitHub Actions workflow
├── lib/                               # JUnit & JaCoCo libraries
├── build.xml                          # Ant build configuration
├── run-15-tests.bat                   # Script chạy tests
└── coverage/                          # Coverage reports (generated)
```

## 🏃 Chạy Project

### Compile và chạy tests:

**Windows:**
```batch
.\run-15-tests.bat
```

**Linux/Mac:**
```bash
# Compile
javac -encoding UTF-8 -cp "lib/*" -d build/classes src/DateTimeChecker.java
javac -encoding UTF-8 -cp "lib/*:build/classes" -d build/test-classes DateTimeCheckerTest.java

# Run tests
java -javaagent:lib/jacoco/jacocoagent.jar=destfile=coverage/jacoco.exec \
  -cp "build/classes:build/test-classes:lib/*" \
  org.junit.platform.console.ConsoleLauncher \
  --scan-classpath --classpath=build/test-classes
```

### Xem Coverage Report:

Sau khi chạy tests, mở file: `coverage/html/index.html`

## 📝 Scripts hữu ích

- `run-15-tests.bat` - Chạy tất cả 15 test cases với coverage
- `quick-test.bat` - Chạy tests nhanh
- `view-cicd-guide.bat` - Xem hướng dẫn CI/CD
- `push-to-github.bat` - Push code lên GitHub

## 👨‍💻 Tác giả

- GitHub: [@HuyNgu111](https://github.com/HuyNgu111)
- Repository: [checkdatetime](https://github.com/HuyNgu111/checkdatetime)

## 📄 License

This project is open source and available for educational purposes.

## 🎯 Mục đích

Project này được tạo ra để:
- Thực hành Unit Testing với JUnit 5
- Học cách sử dụng JaCoCo để đo coverage
- Tìm hiểu CI/CD với GitHub Actions
- Làm việc với Java Time API

---

⭐ **Star repository này nếu bạn thấy hữu ích!**
