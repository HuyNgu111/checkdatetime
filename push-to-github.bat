@echo off
chcp 65001 > nul
echo ========================================
echo    PUSH CODE TO GITHUB
echo ========================================
echo.

REM Kiểm tra xem đã init git chưa
if not exist ".git" (
    echo [1/7] Initializing Git repository...
    git init
    echo ✓ Git initialized
) else (
    echo [1/7] Git repository already exists
)

echo.
echo [2/7] Configuring Git (if not configured)...
git config user.name >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Please enter your GitHub username:
    set /p username="Username: "
    git config user.name "%username%"
    
    echo Please enter your GitHub email:
    set /p email="Email: "
    git config user.email "%email%"
    echo ✓ Git configured
) else (
    echo ✓ Git already configured
)

echo.
echo [3/7] Creating .gitignore file...
if not exist ".gitignore" (
    echo # Build artifacts > .gitignore
    echo build/ >> .gitignore
    echo *.class >> .gitignore
    echo.>> .gitignore
    echo # Coverage reports >> .gitignore
    echo coverage/ >> .gitignore
    echo *.exec >> .gitignore
    echo.>> .gitignore
    echo # IDE files >> .gitignore
    echo .vscode/ >> .gitignore
    echo .idea/ >> .gitignore
    echo *.iml >> .gitignore
    echo.>> .gitignore
    echo # OS files >> .gitignore
    echo .DS_Store >> .gitignore
    echo Thumbs.db >> .gitignore
    echo desktop.ini >> .gitignore
    echo ✓ .gitignore created
) else (
    echo ✓ .gitignore already exists
)

echo.
echo [4/7] Adding files to git...
git add .
echo ✓ Files added

echo.
echo [5/7] Creating commit...
git commit -m "Add DateTimeChecker project with 15 JUnit test cases and JaCoCo coverage + CI/CD workflow"
if %ERRORLEVEL% EQU 0 (
    echo ✓ Commit created
) else (
    echo ⚠ No changes to commit or commit failed
)

echo.
echo [6/7] Checking remote repository...
git remote -v | findstr origin >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Please enter your GitHub repository URL:
    echo Example: https://github.com/username/repository.git
    set /p remote_url="Repository URL: "
    git remote add origin %remote_url%
    echo ✓ Remote added
) else (
    echo ✓ Remote already configured
    git remote -v
)

echo.
echo [7/7] Pushing to GitHub...
echo Checking current branch...
git branch --show-current >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Creating main branch...
    git branch -M main
)

echo.
echo Pushing to remote...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✅ PUSH SUCCESSFUL!
    echo ========================================
    echo Your code has been pushed to GitHub
    echo You can view it at your repository URL
    echo.
    echo GitHub Actions will automatically run tests
    echo Check Actions tab to see the CI/CD results
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ⚠ PUSH FAILED
    echo ========================================
    echo Possible reasons:
    echo 1. Authentication failed - You may need to:
    echo    - Use GitHub Personal Access Token
    echo    - Or use SSH key
    echo.
    echo 2. Remote repository doesn't exist
    echo    - Create repository on GitHub first
    echo.
    echo 3. Branch protection rules
    echo    - Check repository settings
    echo ========================================
)

echo.
pause
