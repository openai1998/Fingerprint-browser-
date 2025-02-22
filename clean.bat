@echo off
echo 正在清理浏览器数据...

REM 删除用户数据目录
if exist "UserData" (
    rmdir /s /q "UserData"
    echo 用户数据已清理
)

REM 删除临时文件
if exist "temp.txt" del /f /q temp.txt

REM 删除其他可能的缓存目录
if exist "%TEMP%\chrome_*" rmdir /s /q "%TEMP%\chrome_*"

echo 清理完成！
pause 