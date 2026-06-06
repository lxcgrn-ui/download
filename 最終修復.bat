@echo off
chcp 65001 >nul

echo 正在執行第一階段：DISM 系統映像修復，請稍候...
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo 正在執行第二階段：SFC 系統檔案掃描，請稍候...
sfc /scannow

echo.
echo 正在產生完成提示...
mshta vbscript:Execute("msgbox ""系統檔案已修復完畢！視窗將在 3 秒後自動關閉。"",64,""修復完成"":close")

timeout /t 3 /nobreak >nul
exit