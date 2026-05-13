@echo off
chcp 65001 >nul
echo.
echo ╔══════════════════════════════════════════╗
echo ║   Déploiement Portfolio — Charlie T.    ║
echo ╚══════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo [1/4] Ajout des fichiers...
git add .

echo [2/4] Commit...
git commit -m "Update portfolio" 2>nul || (
  git commit --allow-empty -m "Initial deploy"
)

echo [3/4] Push vers GitHub...
git push -u origin main

echo.
echo ✅ Déployé ! Votre site sera disponible dans 30 secondes sur :
echo    https://toucharli3.github.io/portfolio
echo.
pause
