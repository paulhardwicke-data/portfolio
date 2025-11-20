#!/usr/bin/env bash
set -euo pipefail

cd "/c/Users/paulh/Documents/github/paulhardwicke-data/portfolio"

echo "[INFO] Current directory:"
pwd
echo

if [[ ! -d .git ]]; then
  echo "[ERROR] No Git repo found here (.git missing). Run portfolio_setup.bat first."
  exit 1
fi

[[ -f "index.html" ]] || echo "[WARN] index.html not found. Are you in the portfolio folder?"

# .gitignore verification
if [[ -f ".gitignore" ]]; then
  echo "[CHECK] .gitignore exists. Showing ignored files..."
  git status --ignored || true
  echo
  echo "[CHECK] To trace why a file is ignored, run:"
  echo "  git check-ignore -v assets/images/example.jpg"
else
  echo "[WARN] .gitignore not found in this folder."
fi
echo

# Stage, commit (timestamp), push
echo "[INFO] Staging..."
git add -A || true

timestamp="$(date '+%Y-%m-%d %H:%M')"
echo "[INFO] Committing..."
git commit -m "Site update $timestamp" || echo "[INFO] No changes to commit."

echo "[INFO] Pushing..."
git push origin main

echo "[DONE] Update complete."