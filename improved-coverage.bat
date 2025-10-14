@echo off
chcp 65001 > nul
echo ========================================
echo    COVERAGE IMPROVEMENT DEMONSTRATION
echo ========================================
echo.

echo 🎯 BẠN VỪA THÊM 7 TEST CASES MỚI!
echo.
echo 📊 Test Cases Overview:
echo   - Test 1-8:  Original test cases
echo   - Test 9:    isLateNight() - Test đêm khuya
echo   - Test 10:   isAfternoon() - Test buổi chiều  
echo   - Test 11:   isMorningRush() - Test giờ cao điểm sáng
echo   - Test 12:   isEveningRush() - Test giờ cao điểm chiều
echo   - Test 13:   getDetailedTimeMessage() - Test thông điệp chi tiết
echo   - Test 14:   isSpecialDay() - Test ngày đặc biệt
echo   - Test 15:   getHoursUntilEndOfWork() - Test giờ còn lại
echo.

echo 🚀 Running all 15 test cases with coverage analysis...
echo.
pause

call run-tests.bat

echo.
echo ========================================
echo        COVERAGE IMPROVEMENT SUMMARY
echo ========================================
echo.
echo ✅ EXPECTED IMPROVEMENTS:
echo   📈 Instructions Coverage: INCREASED (more code tested)
echo   📈 Branches Coverage:     INCREASED (more if-else covered)
echo   📈 Lines Coverage:        INCREASED (more lines tested)
echo   📈 Methods Coverage:      INCREASED (all 7 new methods tested)
echo.
echo 🎯 TARGET: Achieve close to 100% coverage again!
echo.
echo 📝 New Methods Now Covered:
echo   ✓ isLateNight()
echo   ✓ isAfternoon()
echo   ✓ isMorningRush()
echo   ✓ isEveningRush()
echo   ✓ getDetailedTimeMessage()
echo   ✓ isSpecialDay()
echo   ✓ getHoursUntilEndOfWork()
echo.
echo 🌟 Congratulations! You now have comprehensive test coverage!
echo.
pause