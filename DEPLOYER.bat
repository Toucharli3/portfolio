@echo off
chcp 65001 >nul
echo.
echo  ╔══════════════════════════════════════════╗
echo  ║   Mise à jour Portfolio — Charlie T.    ║
echo  ╚══════════════════════════════════════════╝
echo.

cd /d "%~dp0"

:: Trouver git
set GIT=git
where git >nul 2>&1 || (
  if exist "C:\Program Files\Git\bin\git.exe" set GIT="C:\Program Files\Git\bin\git.exe"
)

echo [1/3] Ajout des modifications...
%GIT% add .

echo [2/3] Commit...
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set TODAY=%%c-%%b-%%a
%GIT% commit -m "Update %TODAY%" 2>nul || echo    (rien de nouveau a envoyer)

echo [3/3] Envoi vers GitHub...
%GIT% push origin main 2>&1

echo.
echo  ✅ En ligne dans ~30 secondes sur :
echo  https://toucharli3.github.io/portfolio/
echo.
echo  ─────────────────────────────────────────
echo  NOTE : Si le push echoue (token expire),
echo  regenerez un token sur github.com/settings/tokens
echo  et lancez cette commande dans Git Bash :
echo  git remote set-url origin https://NOUVEAU_TOKEN@github.com/Toucharli3/portfolio.git
echo  ─────────────────────────────────────────
echo.
pause
