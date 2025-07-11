@echo off
for /d %%i in (*) do (
  if exist "%%i\pubspec.yaml" (
    echo Cleaning %%i ...
    pushd %%i
    flutter clean
    popd
  )
)
echo All Flutter projects cleaned!
pause