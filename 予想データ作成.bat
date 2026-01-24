:: batファイルをANSIで保存

@echo off
setlocal
cd /d %~dp0

:: 仮想環境をアクティベート
call .venv\Scripts\activate

:: pyフォルダに移動
cd py

:: レース出走データ取得
python "レース出走データ取得.py"

:: 直前のコマンド（python）がエラー(0以外)を返したら終了させる
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] レース出走データ取得に失敗しました
    pause
    exit /b %ERRORLEVEL%
)

:: 予想データ作成
python "予想データ作成.py"

:: 直前のコマンド（python）がエラー(0以外)を返したら終了させる
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] 予想データ作成に失敗しました
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo すべての処理が正常に完了しました