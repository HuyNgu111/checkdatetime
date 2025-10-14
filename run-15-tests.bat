@echo off
chcp 65001 > nul
echo ========================================
echo    RUNNING 15 TEST CASES WITH COVERAGE
echo ========================================

REM Tạo thư mục build
if not exist "build\classes" mkdir build\classes
if not exist "build\test-classes" mkdir build\test-classes
if not exist "coverage" mkdir coverage

echo.
echo [1/4] Compiling DateTimeChecker.java...
javac -encoding UTF-8 -cp "lib/*" -d build/classes src/DateTimeChecker.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Main source compilation failed!
    pause
    exit /b 1
)
echo [✓] DateTimeChecker compiled successfully

echo.
echo [2/4] Compiling DateTimeCheckerTest.java (from root directory)...
javac -encoding UTF-8 -cp "lib/*;build/classes" -d build/test-classes DateTimeCheckerTest.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Test compilation failed!
    echo Showing detailed error:
    javac -encoding UTF-8 -cp "lib/*;build/classes" DateTimeCheckerTest.java
    pause
    exit /b 1
)
echo [✓] Test compiled successfully

echo.
echo [3/4] Running JUnit tests with JaCoCo coverage...
java -javaagent:lib/jacoco/jacocoagent.jar=destfile=coverage/jacoco.exec -cp "build/classes;build/test-classes;lib/*" org.junit.platform.console.ConsoleLauncher --scan-classpath --classpath=build/test-classes --details=verbose

echo.
echo [4/4] Generating coverage report...
java -jar lib/jacoco/jacococli.jar report coverage/jacoco.exec --classfiles build/classes --sourcefiles src --html coverage/html --xml coverage/coverage.xml --csv coverage/coverage.csv

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Coverage report generation failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo          COVERAGE RESULTS
echo ========================================
echo [✓] All 15 test cases executed
echo [✓] Coverage report generated
echo.
echo 📊 Coverage Reports:
echo    - HTML: coverage/html/index.html
echo    - XML:  coverage/coverage.xml  
echo    - CSV:  coverage/coverage.csv
echo.
echo 🌐 Opening HTML report...
start "" "coverage/html/index.html"

echo.
pause