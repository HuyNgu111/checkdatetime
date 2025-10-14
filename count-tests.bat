@echo off
echo =================================
echo Đếm số lượng test cases
echo =================================

echo.
echo Đang đếm số @Test annotations trong DateTimeCheckerTest.java...
findstr /c:"@Test" DateTimeCheckerTest.java > temp_count.txt
for /f %%i in (temp_count.txt) do echo Tìm thấy %%i test cases
del temp_count.txt

echo.
echo Đang liệt kê tất cả các test cases...
findstr /n "@DisplayName" DateTimeCheckerTest.java

echo.
echo =================================
echo Bây giờ chạy tests để xem coverage
echo =================================
echo.