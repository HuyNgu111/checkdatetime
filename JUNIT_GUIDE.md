# Hướng dẫn chạy JUnit Tests

## Bước 1: Tải JUnit Libraries

Để chạy tests, bạn cần tải các file JAR của JUnit 5:

1. Tải JUnit 5 từ: https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/5.10.1/
   - junit-jupiter-5.10.1.jar
   - junit-jupiter-api-5.10.1.jar  
   - junit-jupiter-engine-5.10.1.jar
   - junit-platform-commons-1.10.1.jar
   - junit-platform-engine-1.10.1.jar
   - junit-platform-launcher-1.10.1.jar
   - apiguardian-api-1.1.2.jar
   - opentest4j-1.3.0.jar

2. Tải tất cả file JAR và đặt vào thư mục `lib/` trong project

## Bước 2: Hoặc sử dụng command line đơn giản

Chạy lệnh sau từ thư mục gốc của project:

```bash
# Windows PowerShell
mkdir lib -Force
Invoke-WebRequest -Uri "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/5.10.1/junit-jupiter-5.10.1.jar" -OutFile "lib/junit-jupiter-5.10.1.jar"
```

## Bước 3: Cập nhật build.xml 

Đã được cập nhật tự động để hỗ trợ JUnit testing.

## Bước 4: Chạy tests

**Lưu ý:** Test file đã được di chuyển ra thư mục root của project để tương thích với cấu trúc package.

```bash
# Tải JUnit libraries trước
.\download-junit.ps1

# Sử dụng script chạy test tự động
.\run-tests.bat

# Hoặc chạy thủ công:
# Compile classes
javac -cp "lib/*" src\DateTimeChecker.java DateTimeCheckerTest.java

# Chạy tests
java -cp ".;lib/*" org.junit.platform.console.ConsoleLauncher --scan-classpath --classpath="."
```

## Cấu trúc 8 Test Cases đã tạo:

1. **testIsWeekendSaturday**: Kiểm tra thứ 7 có phải cuối tuần
2. **testIsWeekendSunday**: Kiểm tra chủ nhật có phải cuối tuần  
3. **testIsNotWeekendMonday**: Kiểm tra thứ 2 không phải cuối tuần
4. **testIsWorkingHoursValid**: Kiểm tra giờ làm việc hợp lệ (8h-17h)
5. **testIsNotWorkingHours**: Kiểm tra ngoài giờ làm việc
6. **testIsWorkingDay**: Kiểm tra ngày làm việc (không cuối tuần + trong giờ)
7. **testIsLunchTime**: Kiểm tra giờ nghỉ trưa (12h-13h)
8. **testTimePeriodsAndMessages**: Kiểm tra buổi sáng, tối và các message functions

## Chạy từng test riêng lẻ

```bash
# Chạy test cụ thể
java -cp "build/classes;build/test/classes;lib/*" org.junit.platform.console.ConsoleLauncher --select-method DateTimeCheckerTest#testIsWeekendSaturday
```