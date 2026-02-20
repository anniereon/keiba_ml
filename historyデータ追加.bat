:: batファイルをANSIで保存

@echo off
set /p ANSWER="このバッチを実行しますか？ (y/n): "
if /i not "%ANSWER%"=="y" exit

@echo off
setlocal
cd /d %~dp0

:: 仮想環境をアクティベート
call .venv\Scripts\activate

:: pyフォルダに移動
cd py

:: historyデータ追加
python "historyデータ追加.py"

:: 直前のコマンド（python）がエラー(0以外)を返したら終了させる
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] historyデータ追加に失敗しました
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo すべての処理が正常に完了しました
pause