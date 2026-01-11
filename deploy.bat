@echo off
REM Ray Logistics - Quick Deploy Script (Windows)

echo.
echo ========================================
echo   Ray Logistics - Vercel Deployment
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)

REM Check if Vercel CLI is installed
where vercel >nul 2>nul
if %errorlevel% neq 0 (
    echo [INFO] Vercel CLI not found. Installing...
    call npm install -g vercel
    echo [SUCCESS] Vercel CLI installed!
) else (
    echo [SUCCESS] Vercel CLI already installed
)

echo.
echo Choose deployment method:
echo 1. Deploy to production (recommended)
echo 2. Deploy preview/test version
echo 3. Check deployment status
echo 4. View deployment logs
echo 5. Exit
echo.

set /p choice="Enter choice (1-5): "

if "%choice%"=="1" goto production
if "%choice%"=="2" goto preview
if "%choice%"=="3" goto status
if "%choice%"=="4" goto logs
if "%choice%"=="5" goto end
goto invalid

:production
echo.
echo [INFO] Deploying to production...
call vercel --prod
goto end

:preview
echo.
echo [INFO] Creating preview deployment...
call vercel
goto end

:status
echo.
echo [INFO] Checking deployment status...
call vercel ls
goto end

:logs
echo.
echo [INFO] Viewing logs...
call vercel logs
goto end

:invalid
echo [ERROR] Invalid choice
goto end

:end
echo.
echo [SUCCESS] Done!
echo.
echo For detailed instructions, see VERCEL_DEPLOYMENT_GUIDE.md
echo.
pause
