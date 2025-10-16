@echo off
chcp 65001 > nul
cls
echo.
echo ════════════════════════════════════════════════════════
echo    TEST GIỐNG HỆT CI/CD (Linux style)
echo ════════════════════════════════════════════════════════
echo.
echo Script này sẽ chạy giống hệt như workflow trên GitHub
echo.

REM Clean build
if exist "build" rmdir /s /q build
if exist "coverage" rmdir /s /q coverage

echo [1/5] Create directories...
mkdir build\classes
mkdir build\test-classes
mkdir coverage

echo.
echo [2/5] Compile DateTimeChecker.java...
javac -encoding UTF-8 -cp "lib/*" -d build/classes src/DateTimeChecker.java

if %ERRORLEVEL% NEQ 0 (
    echo ❌ COMPILE FAILED - Main source
    pause
    exit /b 1
)
echo ✅ Main source compiled

echo.
echo [3/5] Compile DateTimeCheckerTest.java...
javac -encoding UTF-8 -cp "lib/*;build/classes" -d build/test-classes DateTimeCheckerTest.java

if %ERRORLEVEL% NEQ 0 (
    echo ❌ COMPILE FAILED - Test source
    echo.
    echo Showing detailed error:
    javac -encoding UTF-8 -cp "lib/*;build/classes" DateTimeCheckerTest.java
    pause
    exit /b 1
)
echo ✅ Test compiled

echo.
echo [4/5] Run tests with --select-class...
echo.
java -javaagent:lib/jacoco/jacocoagent.jar=destfile=coverage/jacoco.exec -cp "build/classes;build/test-classes;lib/*" org.junit.platform.console.ConsoleLauncher --select-class=DateTimeCheckerTest --details=verbose

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ TESTS FAILED!
    echo Exit code: %ERRORLEVEL%
    echo.
    echo Đây là lý do CI/CD fail!
    echo.
    pause
    exit /b 1
)
echo ✅ Tests passed

echo.
echo [5/5] Generate coverage...
java -jar lib/jacoco/jacococli.jar report coverage/jacoco.exec --classfiles build/classes --sourcefiles src --html coverage/html

echo.
echo ════════════════════════════════════════════════════════
echo ✅ ALL STEPS PASSED!
echo ════════════════════════════════════════════════════════
echo.
echo Nếu script này pass → CI/CD cũng sẽ pass
echo Nếu script này fail → Đó là lỗi cần sửa
echo.
echo Opening coverage report...
start coverage\html\index.html

pause
