@echo off
echo ========================================
echo    STEP-BY-STEP COVERAGE DEMO
echo ========================================
echo.

echo Step 1: Testing with original 8 test cases only...
echo (This will show DECREASED coverage due to new code)
echo.
pause

REM Temporarily rename additional tests
if exist "test\AdditionalTests.java" (
    ren "test\AdditionalTests.java" "AdditionalTests.java.bak"
)

call run-tests.bat

echo.
echo ========================================
echo Step 2: Now adding 7 more test cases...
echo (This will show INCREASED coverage)
echo ========================================
echo.
pause

REM Restore additional tests
if exist "test\AdditionalTests.java.bak" (
    ren "test\AdditionalTests.java.bak" "AdditionalTests.java"
)

call run-tests.bat

echo.
echo ========================================
echo       COVERAGE DEMONSTRATION COMPLETE
echo ========================================
echo.
echo 🎯 What you observed:
echo   1. Adding new code WITHOUT tests = DECREASED coverage
echo   2. Adding tests for new code = INCREASED coverage  
echo.
echo 📊 This shows the importance of maintaining good test coverage!
echo.
pause