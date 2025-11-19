@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM Portfolio Setup & Publisher (Paul Hardwicke) - UPDATED
REM - Uses `python -m pip` to avoid `pip` PATH issues
REM - Checks Python
REM - Ensures pip + Pillow
REM - Runs build_thumbnails.py
REM - Commits & pushes changes to GitHub
REM ============================================================

REM 1) CONFIG: Update if your path or branch differs
set "PROJECT_DIR=C:\Users\paulh\Documents\github\paulhardwicke-data"
set "BRANCH=main"
set "COMMIT_MESSAGE=Build thumbnails & manifest (auto)"

echo.
echo [1/7] Navigating to project directory...
if not exist "%PROJECT_DIR%" (
    echo ERROR: Project directory not found: "%PROJECT_DIR%"
    echo Please edit PROJECT_DIR at the top of this script.
    goto :end
)
cd /d "%PROJECT_DIR%" || goto :end

REM 2) Check Python availability
echo.
echo [2/7] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo Python not found on PATH.
    echo - You need Python 3 installed and added to PATH.
    echo - Download: https://www.python.org/downloads/
    echo - During install, tick "Add Python to PATH".
    choice /M "Open Python download page now?"
    if errorlevel 2 (
        echo Skipping install prompt. Exiting.
        goto :end
    ) else (
        start "" "https://www.python.org/downloads/"
        echo After installation completes, re-run this script.
        goto :end
    )
) else (
    for /f "tokens=2 delims= " %%v in ('python --version') do set "PY_VER=%%v"
    echo Found Python: %PY_VER%
)

REM 3) Ensure pip is available (via python -m pip)
echo.
echo [3/7] Ensuring pip is available...
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo Pip not found. Attempting to bootstrap pip...
    python -m ensurepip --upgrade
    if errorlevel 1 (
        echo ERROR: Could not bootstrap pip. Please install pip manually.
        goto :end
    )
)

REM 4) Install/upgrade Pillow using python -m pip
echo.
echo [4/7] Installing/upgrading Pillow (image library)...
python -m pip install --upgrade pip
if errorlevel 1 (
    echo WARNING: Could not upgrade pip. Continuing...
)

python -m pip show pillow >nul 2>&1
if errorlevel 1 (
    echo Pillow not found. Installing...
    python -m pip install pillow
    if errorlevel 1 (
        echo ERROR: Pillow installation failed.
        goto :end
    )
) else (
    echo Pillow already installed. Upgrading to latest...
    python -m pip install --upgrade pillow
)

REM 5) Run build_thumbnails.py
echo.
echo [5/7] Running build_thumbnails.py to create thumbnails & manifest...
if not exist "%PROJECT_DIR%\build_thumbnails.py" (
    echo ERROR: build_thumbnails.py not found in project root.
    echo Please ensure the file exists.
    goto :end
)

python build_thumbnails.py
if errorlevel 1 (
    echo ERROR: Thumbnail build failed. Check console output above.
    goto :end
)

REM 6) Git commit & push
echo.
echo [6/7] Committing and pushing changes to GitHub...

REM Ensure repo initialised and remote exists
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Initialising Git repo...
    git init
    git branch -M %BRANCH%
    REM Check remote
    git remote -v | findstr /i "origin" >nul 2>&1
    if errorlevel 1 (
        echo Remote 'origin' not set. Please run:
        echo   git remote add origin https://github.com/paulhardwicke-data/paulhardwicke-data.git
        echo and then re-run this script.
        goto :end
    )
)

REM Stage generated assets + root changes
git add assets\images\thumbs assets\images\manifest.json .nojekyll README.md index.html styles.css script.js build_thumbnails.py 2>nul

REM Optional: add PDFs if newly moved
git add assets\docs\*.pdf assets\docs\research\*.pdf 2>nul

REM Commit if there are staged changes
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "%COMMIT_MESSAGE%"
) else (
    echo No changes to commit.
)

REM Push
git push -u origin %BRANCH%

echo.
echo [7/7] ✅ Done. Your thumbnails & manifest are built and pushed.

:end
echo.
echo Script finished.
endlocal