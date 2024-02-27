@echo off
title Nettoyage de la Corbeille et Optimisation du Système

:: Vérifier les privilèges d'administration
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Vous devez exécuter ce script en tant qu'administrateur.
    echo Redémarrage en cours avec les privilèges d'administration...
    pause
    powershell start -verb runas '%0'
    exit /b
)

:: Effacer l'écran
cls

:: Afficher l'en-tête
echo.
echo © 2024 Kamion. Tous droits réservés.
echo.

:: Nettoyage de la corbeille
echo === Nettoyage de la corbeille ===
echo.
echo Suppression des fichiers dans la corbeille...
echo.
rd /s /q C:\$Recycle.Bin
echo.
echo La corbeille est maintenant nettoyée.
echo.

:: Optimisation des performances
echo === Optimisation des performances ===
echo.
echo Suppression des fichiers temporaires et inutiles...
echo.
echo Nettoyage du cache DNS...
ipconfig /flushdns
echo.
echo Réparation des fichiers système...
sfc /scannow
echo.
echo Vérification des mises à jour du système...
echo.
wuauclt /detectnow
echo.
echo Défragmentation du disque dur...
echo.
defrag C: /U /V
echo.
echo Vérification des erreurs du disque dur...
echo.
chkdsk C: /f /r /x
echo.
echo Suppression des fichiers temporaires des utilisateurs...
echo.
del /q /f %userprofile%\AppData\Local\Temp\*.*

echo.
echo Optimisation terminée.

pause
