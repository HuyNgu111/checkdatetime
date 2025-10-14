@echo off
chcp 65001 > nul
echo ========================================
echo      DATETIME CHECKER TEST SUITE
echo ========================================
echo.

echo Creating build directories...
if not exist "build\classes" mkdir build\classes
if not exist "build\test-classes" mkdir build\test-classes
if not exist "coverage" mkdir coverage

echo.
echo [1/5] Compiling main source...
javac -encoding UTF-8 -cp "lib/*" -d build/classes src/*.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Main source compilation failed!
    pause
    exit /b 1
)
echo [✓] Main source compiled successfully

echo.
echo [2/5] Compiling test source...
REM Compile the main test file with 15 test cases
javac -encoding UTF-8 -cp "lib/*;build/classes" -d build/test-classes DateTimeCheckerTest.java

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Test compilation failed!
    pause
    exit /b 1
)
echo [✓] Test source compiled successfully

echo.
echo [3/5] Running JUnit tests with JaCoCo coverage...
echo Running all 15 test cases...

java -javaagent:lib/jacoco/jacocoagent.jar=destfile=coverage/jacoco.exec -cp "build/classes;build/test-classes;lib/*" org.junit.platform.console.ConsoleLauncher --scan-classpath --classpath="build/test-classes" --details=verbose

echo.
echo [4/5] Generating coverage report...
java -jar lib/jacoco/jacococli.jar report coverage/jacoco.exec --classfiles build/classes --sourcefiles src --html coverage/html --xml coverage/coverage.xml --csv coverage/coverage.csv

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Coverage report generation failed!
    pause
    exit /b 1
)

echo.
echo [5/5] Coverage report generated successfully!
echo ========================================
echo           TEST RESULTS
echo ========================================
echo [✓] All 15 test cases executed
echo [✓] Coverage report generated
echo.
echo 📊 Coverage Reports Available:
echo    - HTML: coverage/html/index.html
echo    - XML:  coverage/coverage.xml  
echo    - CSV:  coverage/coverage.csv
echo.
echo 🌐 Opening HTML report...
echo ========================================

REM Automatically open the coverage report
start "" "coverage/html/index.html"

echo.
echo Press any key to exit...
pause > nul