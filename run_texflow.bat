@echo off
title TexFlow - Textile Production Management Platform
echo =======================================================
echo Starting TexFlow (MERN Textile Management Platform)...
echo =======================================================
echo.

echo Starting Backend Server on http://localhost:5000...
start cmd /k "title TexFlow Backend && cd backend && npm start"

timeout /t 3 /nobreak >nul

echo Starting Frontend Server on http://localhost:5173...
start cmd /k "title TexFlow Frontend && cd frontend && npm run dev"

timeout /t 3 /nobreak >nul

echo.
echo =======================================================
echo TexFlow is running!
echo Frontend: http://localhost:5173
echo Backend:  http://localhost:5000
echo =======================================================
start http://localhost:5173
