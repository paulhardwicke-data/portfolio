@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Navigate to the portfolio folder
cd /d "C:\Users\paulh\Documents\github\paulhardwicke-data\portfolio"

REM Stage all changes
echo [INFO] Staging changes...
git add -A

REM Prepare timestamp for commit message
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

REM Push to origin main
echo [INFO] Pushing to GitHub...
git push origin main

echo [DONE] Update complete.
endlocal