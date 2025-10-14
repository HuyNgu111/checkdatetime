@echo off
echo ========================================
echo    COVERAGE COMPARISON ANALYSIS
echo ========================================
echo.

echo Running tests to see new coverage...
call run-tests.bat

echo.
echo ========================================
echo          ANALYSIS RESULTS
echo ========================================
echo.
echo After adding new methods to DateTimeChecker:
echo.
echo 🔍 NEW METHODS ADDED (not covered by tests):
echo   - isLateNight()           : Check late night (22h-6h)
echo   - isAfternoon()           : Check afternoon (12h-18h)  
echo   - isMorningRush()         : Check morning rush (7h-9h)
echo   - isEveningRush()         : Check evening rush (17h-19h)
echo   - getDetailedTimeMessage(): Get detailed time description
echo   - isSpecialDay()          : Check special days in month
echo   - getHoursUntilEndOfWork(): Calculate hours until work ends
echo.
echo 📊 EXPECTED COVERAGE CHANGES:
echo   - Instructions Coverage: Will DECREASE (more code, same tests)
echo   - Branches Coverage:     Will DECREASE (new if-else conditions)
echo   - Lines Coverage:        Will DECREASE (more lines, same tests)  
echo   - Methods Coverage:      Will DECREASE (more methods, same tests)
echo.
echo 🎯 TO IMPROVE COVERAGE: Add more test cases for new methods!
echo.

pause