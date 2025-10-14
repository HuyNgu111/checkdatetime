@echo off
chcp 65001 > nul
echo ========================================
echo      QUICK TEST CHECK
echo ========================================

echo Creating build directories...
if not exist "build\classes" mkdir build\classes
if not exist "build\test-classes" mkdir build\test-classes

echo.
echo [1/3] Compiling DateTimeChecker.java...
javac -encoding UTF-8 -cp "lib/*" -d build/classes src/DateTimeChecker.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Main source compilation failed!
    pause
    exit /b 1
)
echo [✓] DateTimeChecker compiled successfully

echo.
echo [2/3] Compiling DateTimeCheckerTest.java...
javac -encoding UTF-8 -cp "lib/*;build/classes" -d build/test-classes DateTimeCheckerTest.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Test compilation failed!
    echo Trying to show compilation errors:
    javac -encoding UTF-8 -cp "lib/*;build/classes" DateTimeCheckerTest.java
    pause
    exit /b 1
)
echo [✓] Test compiled successfully

echo.
echo [3/3] Running a quick test...
java -cp "build/classes;build/test-classes;lib/*" org.junit.platform.console.ConsoleLauncher --scan-classpath --classpath=build/test-classes --details=summary

echo.
echo ========================================
echo        TEST CHECK COMPLETE
echo ========================================
pause