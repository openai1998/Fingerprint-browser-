@echo off

REM Set working directory
set CHROME_PATH=Chromium\chrome-win
if not exist "%CHROME_PATH%" (
    echo Chrome path not found: %CHROME_PATH%
    pause
    exit /b 1
)

REM Change to Chrome directory
cd /d "%CHROME_PATH%"

REM Clean UserData
if exist "UserData" (
    echo Cleaning cache...
    rmdir /s /q "UserData"
)
mkdir "UserData"

REM Read fingerprint.json
set "json_path=..\..\fingerprint.json"
if not exist "%json_path%" (
    echo fingerprint.json not found: %json_path%
    pause
    exit /b 1
)

REM Use PowerShell to parse JSON
for /f "delims=" %%i in ('powershell -Command "Get-Content %json_path% | ConvertFrom-Json | Select-Object -ExpandProperty proxy | Select-Object -ExpandProperty server"') do set "PROXY_SERVER=%%i"

REM Check if PROXY_SERVER is set
if "%PROXY_SERVER%"=="" (
    echo Failed to parse proxy server from JSON
    pause
    exit /b 1
)

REM Start Chrome
start "" chrome.exe --ruyi="%json_path%" ^
    --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4654.0 Safari/537.36 Edg/96.0.4654.0" ^
    --lang=en-US ^
    --time-zone-for-testing=America/Los_Angeles ^
    --user-data-dir="UserData" ^
    --proxy-server="%PROXY_SERVER%" ^
    --disable-sync ^
    --disable-gpu-shader-disk-cache ^
    --disable-background-timer-throttling ^
    --disable-client-side-phishing-detection ^
    --disable-default-apps ^
    --disable-popup-blocking ^
    --no-default-browser-check ^
    --no-experiments ^
    --webrtc-ip-handling-policy=disable ^
    --enforce-webrtc-ip-permission-check ^
    --disable-webrtc-hw-encoding ^
    --disable-webrtc-hw-decoding ^
    --disable-webrtc-multiple-routes ^
    --disable-webrtc-hide-local-ips-with-mdns ^
    --disable-features=WebRtcHideLocalIpsWithMdns,WebRTC,PeerConnection ^
    --disable-webrtc ^
    --disable-site-isolation-trials ^
    --disable-reading-from-canvas ^
    --disable-remote-fonts ^
    --disable-notifications ^
    --disable-permissions-api ^
    --no-sandbox ^
    --disable-webgl ^
    --disable-webgl2 ^
    --disable-3d-apis ^
    --disable-media-stream ^
    --disable-peer-connection ^
    --proxy-bypass-list="<-loopback>" ^
    --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" ^
    https://www.browserscan.net/ 