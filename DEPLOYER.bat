@echo off
chcp 65001 >nul
echo.
echo  ╔══════════════════════════════════════════╗
echo  ║   Déploiement Portfolio — Charlie T.    ║
echo  ╚══════════════════════════════════════════╝
echo.

cd /d "%~dp0"

:: Chercher git dans les emplacements courants
set GIT=git
where git >nul 2>&1 || (
  if exist "C:\Program Files\Git\bin\git.exe" set GIT="C:\Program Files\Git\bin\git.exe"
  if exist "C:\Program Files (x86)\Git\bin\git.exe" set GIT="C:\Program Files (x86)\Git\bin\git.exe"
)

:: Configurer le remote si pas encore fait
%GIT% remote get-url origin >nul 2>&1 || (
  echo [0/4] Configuration du dépôt GitHub...
  %GIT% remote add origin https://github.com/Toucharli3/portfolio.git
)

echo [1/4] Ajout des fichiers...
%GIT% add .

echo [2/4] Commit...
%GIT% commit -m "Update portfolio %date% %time%" 2>nul

echo [3/4] Envoi vers GitHub ^(une fenêtre de connexion peut s'ouvrir^)...
%GIT% push -u origin main

echo.
echo  ✅ Déployé avec succès !
echo.
echo  Votre site sera disponible dans ~30 secondes sur :
echo  https://toucharli3.github.io/portfolio
echo.
echo  ^(Si c'est le premier déploiement, allez d'abord activer GitHub Pages :
echo   Repo GitHub ^> Settings ^> Pages ^> Source : GitHub Actions^)
echo.
pause
