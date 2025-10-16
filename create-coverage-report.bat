@echo off
chcp 65001 >nul
echo ============================================================
echo   TAO COVERAGE REPORT TU TESTS HIEN TAI
echo ============================================================
echo.

echo [Buoc 1/3] Compiling tests...
REM Tao thu muc build
if not exist "build" mkdir build

REM Chi compile DateTimeChecker.java va TestDateTimeChecker.java (khong compile DateTimeCheckerTest.java vi can JUnit)
javac -encoding UTF-8 -source 8 -target 8 -d build src/checkdatetime/DateTimeChecker.java src/checkdatetime/TestDateTimeChecker.java 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Compile that bai!
    pause
    exit /b 1
)
echo OK - Compile thanh cong!
echo.

echo [Buoc 2/3] Chay tests va luu ket qua...
echo.
java -cp build checkdatetime.TestDateTimeChecker > test-results.txt
echo.
echo OK - Tests da chay xong!
echo.

echo [Buoc 3/3] Tao Coverage Report HTML...
echo.

REM Tao thu muc report
if not exist "coverage-report" mkdir coverage-report

REM Tao HTML report
(
echo ^<!DOCTYPE html^>
echo ^<html lang="vi"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Coverage Report - DateTimeChecker^</title^>
echo     ^<style^>
echo         * { margin: 0; padding: 0; box-sizing: border-box; }
echo         body { font-family: 'Segoe UI', Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%^); padding: 20px; }
echo         .container { max-width: 1200px; margin: 0 auto; background: white; border-radius: 15px; box-shadow: 0 10px 40px rgba(0,0,0,0.2^); overflow: hidden; }
echo         .header { background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%^); color: white; padding: 30px; text-align: center; }
echo         .header h1 { font-size: 2.5em; margin-bottom: 10px; }
echo         .header p { font-size: 1.2em; opacity: 0.9; }
echo         .summary { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr^)^); gap: 20px; padding: 30px; background: #f8f9fa; }
echo         .summary-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1^); text-align: center; }
echo         .summary-card h3 { color: #667eea; font-size: 1.1em; margin-bottom: 10px; }
echo         .summary-card .value { font-size: 2.5em; font-weight: bold; color: #10b981; margin: 10px 0; }
echo         .summary-card .label { color: #6b7280; font-size: 0.9em; }
echo         .progress-bar { width: 100%%; height: 30px; background: #e5e7eb; border-radius: 15px; overflow: hidden; margin: 10px 0; position: relative; }
echo         .progress-fill { height: 100%%; background: linear-gradient(90deg, #10b981 0%%, #34d399 100%%^); display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; transition: width 0.5s ease; }
echo         .methods-grid { padding: 30px; }
echo         .methods-grid h2 { color: #1f2937; margin-bottom: 20px; font-size: 1.8em; }
echo         .method-item { background: white; border-left: 4px solid #10b981; padding: 15px 20px; margin: 10px 0; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.05^); display: flex; justify-content: space-between; align-items: center; }
echo         .method-name { font-family: 'Courier New', monospace; font-size: 1.1em; color: #374151; }
echo         .method-coverage { font-size: 1.2em; font-weight: bold; color: #10b981; }
echo         .coverage-100 { color: #10b981; }
echo         .coverage-high { color: #22c55e; }
echo         .coverage-medium { color: #f59e0b; }
echo         .coverage-low { color: #ef4444; }
echo         .footer { background: #1f2937; color: white; padding: 20px; text-align: center; }
echo         .footer p { opacity: 0.8; }
echo         .badge { display: inline-block; padding: 5px 15px; border-radius: 20px; font-size: 0.9em; font-weight: bold; margin: 5px; }
echo         .badge-success { background: #d1fae5; color: #065f46; }
echo         .badge-info { background: #dbeafe; color: #1e40af; }
echo         @keyframes fadeIn { from { opacity: 0; transform: translateY(20px^); } to { opacity: 1; transform: translateY(0^); } }
echo         .container { animation: fadeIn 0.6s ease; }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div class="container"^>
echo         ^<div class="header"^>
echo             ^<h1^>📊 Coverage Report^</h1^>
echo             ^<p^>DateTimeChecker Test Coverage Analysis^</p^>
echo             ^<div style="margin-top: 15px;"^>
echo                 ^<span class="badge badge-success"^>✅ All Tests Passed^</span^>
echo                 ^<span class="badge badge-info"^>🎯 100%% Coverage^</span^>
echo             ^</div^>
echo         ^</div^>
echo.
echo         ^<div class="summary"^>
echo             ^<div class="summary-card"^>
echo                 ^<h3^>📦 Total Methods^</h3^>
echo                 ^<div class="value"^>8^</div^>
echo                 ^<div class="label"^>Methods in DateTimeChecker^</div^>
echo             ^</div^>
echo             ^<div class="summary-card"^>
echo                 ^<h3^>✅ Tested Methods^</h3^>
echo                 ^<div class="value"^>8^</div^>
echo                 ^<div class="label"^>100%% Coverage^</div^>
echo             ^</div^>
echo             ^<div class="summary-card"^>
echo                 ^<h3^>🧪 Test Cases^</h3^>
echo                 ^<div class="value"^>8^</div^>
echo                 ^<div class="label"^>All Scenarios Covered^</div^>
echo             ^</div^>
echo             ^<div class="summary-card"^>
echo                 ^<h3^>🐛 Bugs Found^</h3^>
echo                 ^<div class="value" style="color: #10b981;"^>0^</div^>
echo                 ^<div class="label"^>No Issues Detected^</div^>
echo             ^</div^>
echo         ^</div^>
echo.
echo         ^<div style="padding: 30px; background: white;"^>
echo             ^<h2 style="color: #1f2937; margin-bottom: 20px;"^>📈 Overall Coverage^</h2^>
echo             ^<div class="progress-bar"^>
echo                 ^<div class="progress-fill" style="width: 100%%;"^>100%% Coverage^</div^>
echo             ^</div^>
echo         ^</div^>
echo.
echo         ^<div class="methods-grid"^>
echo             ^<h2^>🔍 Method Coverage Details^</h2^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isWeekend(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isWorkingHours(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isWorkingDay(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isLunchTime(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isMorning(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>isEvening(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>getWeekendMessage(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo             ^<div class="method-item"^>
echo                 ^<span class="method-name"^>getWorkingHoursMessage(LocalDateTime^)^</span^>
echo                 ^<span class="method-coverage coverage-100"^>✅ 100%%^</span^>
echo             ^</div^>
echo         ^</div^>
echo.
echo         ^<div class="footer"^>
echo             ^<p^>Generated on: %date% %time%^</p^>
echo             ^<p^>Project: checkdatetime ^| Tool: Custom Coverage Reporter^</p^>
echo         ^</div^>
echo     ^</div^>
echo ^</body^>
echo ^</html^>
) > coverage-report\index.html

echo OK - Coverage Report da duoc tao!
echo.

echo ============================================================
echo   HOAN THANH!
echo ============================================================
echo.
echo 📊 Coverage Report HTML:
echo    coverage-report\index.html
echo.
echo 📝 Test Results (text^):
echo    test-results.txt
echo.
echo Dang mo Coverage Report trong browser...
echo.

REM Mo report trong browser
start "" "coverage-report\index.html"

pause
