@echo off
REM =====================================================================
REM  fetch-deps.bat
REM
REM  One-time setup for building the grSim Visual Studio project.
REM  Installs dependencies that cannot live inside the .vcxproj itself:
REM    * vcpkg             -> %USERPROFILE%\vcpkg      (env: VCPKG_ROOT)
REM    * qt5-base, ode, protobuf via vcpkg (x64-windows triplet)
REM    * VarTypes          -> windows\deps\vartypes-install (static lib)
REM
REM  Requirements on PATH: git, cmake, a "Developer Command Prompt for VS 2022"
REM  (or just run this from one, so MSBuild / cl.exe are available).
REM =====================================================================

setlocal EnableDelayedExpansion

pushd "%~dp0"
set "WIN_DIR=%CD%"
popd
pushd "%~dp0\.."
set "REPO_ROOT=%CD%"
popd

REM --- Visual Studio / cmake sanity -----------------------------------
where cmake >nul 2>&1 || (
    echo [deps] ERROR: cmake not on PATH. Launch from "Developer Command Prompt for VS 2022".
    exit /b 1
)
where git >nul 2>&1 || (
    echo [deps] ERROR: git not on PATH. Install Git for Windows.
    exit /b 1
)

REM --- vcpkg ----------------------------------------------------------
if "%VCPKG_ROOT%"=="" set "VCPKG_ROOT=%USERPROFILE%\vcpkg"

if not exist "%VCPKG_ROOT%\.git" (
    echo [deps] Cloning vcpkg into %VCPKG_ROOT%
    git clone https://github.com/microsoft/vcpkg.git "%VCPKG_ROOT%" || exit /b 1
)
if not exist "%VCPKG_ROOT%\vcpkg.exe" (
    echo [deps] Bootstrapping vcpkg
    call "%VCPKG_ROOT%\bootstrap-vcpkg.bat" -disableMetrics || exit /b 1
)
setx VCPKG_ROOT "%VCPKG_ROOT%" >nul

echo [deps] Installing qt5-base ode protobuf (x64-windows). This can take a while...
"%VCPKG_ROOT%\vcpkg.exe" install --classic qt5-base:x64-windows ode:x64-windows protobuf:x64-windows || exit /b 1

REM --- VarTypes (not on vcpkg) ----------------------------------------
set "VT_SRC=%WIN_DIR%\deps\vartypes-src"
set "VT_BUILD=%WIN_DIR%\deps\vartypes-build"
set "VT_INSTALL=%WIN_DIR%\deps\vartypes-install"

if not exist "%VT_SRC%\.git" (
    echo [deps] Cloning VarTypes
    git clone --branch jpfeltracco/build_static https://github.com/jpfeltracco/vartypes "%VT_SRC%" || exit /b 1
)

if not exist "%VT_INSTALL%\include\vartypes\VarTypes.h" (
    echo [deps] Configuring VarTypes
    cmake -S "%VT_SRC%" -B "%VT_BUILD%" ^
          -G "Visual Studio 17 2022" -A x64 ^
          -DVARTYPES_BUILD_STATIC=ON ^
          -DCMAKE_TOOLCHAIN_FILE="%VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake" ^
          -DVCPKG_TARGET_TRIPLET=x64-windows ^
          -DCMAKE_INSTALL_PREFIX="%VT_INSTALL%" || exit /b 1
    echo [deps] Building + installing VarTypes ^(Release^) to %VT_INSTALL%
    cmake --build "%VT_BUILD%" --config Release --parallel || exit /b 1
    cmake --install "%VT_BUILD%" --config Release --prefix "%VT_INSTALL%" || exit /b 1
    echo [deps] Building + installing VarTypes ^(Debug^) to %VT_INSTALL%\debug
    cmake --build "%VT_BUILD%" --config Debug --parallel || exit /b 1
    cmake --install "%VT_BUILD%" --config Debug --prefix "%VT_INSTALL%\debug" || exit /b 1
)

echo.
echo [deps] All dependencies are ready.
echo   VCPKG_ROOT           = %VCPKG_ROOT%
echo   VarTypes install dir = %VT_INSTALL%
echo.
echo Next: open windows\grSim.sln in Visual Studio 2022, choose
echo       Release^|x64, and press F7.
echo.
endlocal
