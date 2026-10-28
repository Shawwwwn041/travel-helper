@echo off
chcp 65001 >nul
cd /d %~dp0
echo 正在下載最新版本...
git pull
echo 正在部署到 shilu.web.app ...
firebase deploy --only hosting:shilu
echo.
echo 完成！按任意鍵關閉。
pause >nul
