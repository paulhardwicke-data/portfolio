@echo off
setlocal ENABLEDELAYEDEXPANSION

REM ==============================================================================
REM Portfolio update script with .gitignore verification
REM Run from: C:\Users\paulh\Documents\github\paulhardwicke-data\portfolio
REM ==============================================================================

REM Navigate to the portfolio folder
cd /d "C:\Users\paulh\Documents\github\paulhardwicke-data\portfolio"

echo [INFO] Current directory:
cd
echo.

REM Quick checks
if not exist ".git" (
  echo [ERROR] No Git repo found here (.git missing). Run portfolio_setup.bat first.
  exit /b 1
)

if not exist "index.html" (
  echo [WARN] index.html not found. Are you in the portfolio folder?
)

REM ------------------------------------------------------------------------------
REM .gitignore verification
REM ------------------------------------------------------------------------------

if exist ".gitignore" (
  echo [CHECK] .gitignore exists. Showing ignored files...
  REM List ignored files (if any)
  git status --ignored

  echo.
  echo [CHECK] Sample rule trace (if you suspect a file is ignored incorrectly):
  echo   Example: git check-ignore -v assets\\images\\example.jpg
  echo   Replace the path with a real file to see which rule is ignoring it.
) else (
  echo [WARN] .gitignore not found in this folder. Consider adding one to keep the repo clean.
)
echo.

REM ------------------------------------------------------------------------------
REM Stage changes
REM ------------------------------------------------------------------------------
echo [INFO] Staging all changes...
git add -A

REM Prepare timestamp for commit message (YYYY-MM-DD HH:MM)
for /f "tokens=1-5 delims=/: " %%a in ("%date% %time%") do (
  set YEAR=%%c
  set MONTH=%%a
  set DAY=%%b
  set HOUR=%%d
  set MIN=%%e
)
set COMMIT_MSG=Site update !YEAR!-!MONTH!-!DAY! !HOUR!:!MIN!

REM Commit changes
echo [INFO] Committing changes...
git commit -m "!COMMIT_MSG!"
if errorlevel 1 (
  echo [INFO] No changes to commit.
)

REM ------------------------------------------------------------------------------
REM Push to origin/main
REM ------------------------------------------------------------------------------
echo [INFO] Pushing to GitHub (origin -> main)...
git push origin main
if errorlevel 1 (
  echo [ERROR] Push failed. Diagnostics:
  echo --- Repo root ---
  git rev-parse --show-toplevel
  echo --- Remote(s) ---
  git remote -v
  echo --- Status ---
  git status
  echo --- End diagnostics ---
  exit /b 1
)

echo.
echo [DONE] Update complete. Pages will auto-deploy from main (root).
endlocal