@echo off
echo 正在更新 hosts 文件...

REM 需要管理员权限运行
net session >nul 2>&1
if %errorLevel% == 0 (
    echo # Block WebRTC STUN/TURN servers >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.l.google.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun1.l.google.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun2.l.google.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun3.l.google.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun4.l.google.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.stunprotocol.org >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.services.mozilla.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.webrtc.org >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.counterpath.net >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.voip.blackberry.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 0.0.0.0 stun.voipgate.com >> %SystemRoot%\System32\drivers\etc\hosts
    echo 处理完成！
) else (
    echo 请以管理员权限运行此脚本！
)
pause 