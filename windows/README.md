# grSim — Visual Studio project (Windows x64)

A hand-written Visual Studio 2022 project for grSim. Nothing outside this
folder is modified — sources in `..\src` and headers in `..\include` are
referenced in place, so the Linux CMake build still works unchanged.

## Files

| File | What it is |
|---|---|
| `grSim.sln`              | Visual Studio solution (open this in VS 2022) |
| `grSim.vcxproj`          | The project. Compiles `..\src\*.cpp`, invokes Qt `moc`/`rcc` and `protoc` via `<CustomBuild>` steps, links Qt5/ODE/Protobuf/VarTypes. |
| `grSim.vcxproj.filters`  | Folder tree shown in Solution Explorer |
| `fetch-deps.bat`         | One-time script that installs external dependencies |
| `README.md`              | This file |

Build output: `..\bin\grSim.exe` (same location as the Linux CMake build).

## Prerequisites

1. **Visual Studio 2022** with the "Desktop development with C++" workload.
2. **Git for Windows** — <https://git-scm.com/download/win>.
3. A "Developer Command Prompt for VS 2022" for running `fetch-deps.bat`
   (so `cmake` and `cl.exe` are on PATH).

## One-time setup

External libraries (Qt5, ODE, Protobuf, VarTypes) are not, and cannot
reasonably be, shipped inside a `.vcxproj` — they're gigabytes of code.
Run this once:

```
windows\fetch-deps.bat
```

It will:

- Clone vcpkg to `%USERPROFILE%\vcpkg` and set `VCPKG_ROOT` (persistently).
- Install `qt5-base`, `ode`, `protobuf` for the `x64-windows` triplet
  (this can take 30–60 min on the first run — vcpkg compiles them).
- Clone and build **VarTypes** into `windows\deps\vartypes-install`
  (Release) and `windows\deps\vartypes-install\debug` (Debug).

**Close the terminal and open a new one** after the script finishes, so
`VCPKG_ROOT` is visible to Visual Studio.

## Build

1. Double-click `windows\grSim.sln` (or `File → Open → Project/Solution`
   in Visual Studio 2022).
2. Set the configuration to **`Release | x64`** (top toolbar).
3. `Build → Build Solution` (F7).

The build will:

- Run `protoc` on all 14 `.proto` files → `..\obj\<Config>\generated\*.pb.cc/h`
- Run `moc` on 7 `Q_OBJECT` headers → `..\obj\<Config>\generated\moc_*.cpp`
- Run `rcc` on `resources\textures.qrc` → `..\obj\<Config>\generated\qrc_textures.cpp`
- Compile everything to `..\bin\grSim.exe`
- Copy Qt5/ODE/Protobuf runtime DLLs (and `platforms\qwindows.dll`) next
  to the exe via the `DeployRuntimeDlls` post-link target.

## Run

```
cd bin
grSim.exe
```

On first launch grSim reads config from `..\config\*.ini`; the defaults
work fine.

## How the project is wired

| Concern | Where it lives in `grSim.vcxproj` |
|---|---|
| Dependency roots (`VCPKG_ROOT`, VarTypes) | `<PropertyGroup>` near the top |
| Include dirs (Qt5, VarTypes, project includes, generated dir) | `<ItemDefinitionGroup><ClCompile><AdditionalIncludeDirectories>` |
| Preprocessor defines (`HAVE_WINDOWS`, `HAVE_MSVC`, `_USE_MATH_DEFINES`, `NOMINMAX`, Qt flags) | same group, `<PreprocessorDefinitions>` |
| Link libraries (Qt5`[d]`, `ode`, `libprotobuf[d]`, `vartypes`, `opengl32`, `ws2_32`, …) | per-config `<ItemDefinitionGroup><Link>` |
| Qt `moc` codegen | `<ItemGroup>` of `<CustomBuild>` items on the 7 `Q_OBJECT` headers |
| Qt `rcc` codegen | `<CustomBuild>` on `..\resources\textures.qrc` |
| Protobuf codegen | `<ItemGroup>` of 14 `<CustomBuild>` items on `..\src\proto\*.proto` |
| Windows .rc (app icon) | `<ResourceCompile Include="..\resources\grsim.rc"/>` |
| Runtime DLL deployment | `<Target Name="DeployRuntimeDlls" AfterTargets="Link">` |

The Linux CMake build (see `..\CMakeLists.txt`) is untouched; both build
systems compile the same source tree.

## Troubleshooting

- **`The VCPKG_ROOT environment variable is not set`** / missing include
  or .lib errors referencing `Qt5Core` etc.  
  You didn't open a new terminal / a new VS instance after running
  `fetch-deps.bat`. Close and reopen VS.

- **`moc.exe not found` / `protoc.exe not found`**  
  Verify the paths exist:
  ```
  %VCPKG_ROOT%\installed\x64-windows\tools\qt5\bin\moc.exe
  %VCPKG_ROOT%\installed\x64-windows\tools\qt5\bin\rcc.exe
  %VCPKG_ROOT%\installed\x64-windows\tools\protobuf\protoc.exe
  ```
  If they're elsewhere, edit the `<MocExe>` / `<RccExe>` / `<ProtocExe>`
  properties in `grSim.vcxproj`.

- **`cannot open file 'vartypes.lib'`**  
  `fetch-deps.bat` didn't finish. Re-run it — look for errors in the
  VarTypes clone/configure/build steps.

- **`grSim.exe` launches and immediately says
  *"This application failed to start because no Qt platform plugin
  could be initialized"***  
  The `DeployRuntimeDlls` target should have copied
  `bin\platforms\qwindows.dll`. If missing, copy it manually from
  `%VCPKG_ROOT%\installed\x64-windows\Qt5\plugins\platforms\qwindows.dll`
  to `bin\platforms\`.

- **Link errors about `WinMain`**  
  The project uses `SubSystem=Windows` and links `Qt5EntryPoint.lib`,
  which provides `WinMain` that forwards to `main`. If you see
  `LNK2019: WinMain`, confirm `Qt5EntryPoint.lib` (Release) or
  `Qt5EntryPointd.lib` (Debug) is in the linker inputs.

- **`error C2039: 'M_PI'`**  
  `_USE_MATH_DEFINES` must be defined project-wide (it already is). If
  you edit it out, `<math.h>` on MSVC won't expose `M_PI`.

## VarTypes version

`fetch-deps.bat` pulls the `jpfeltracco/build_static` branch —
exactly what the upstream CMakeLists used (`vartypes_external` in
`..\CMakeLists.txt`, line 119).
