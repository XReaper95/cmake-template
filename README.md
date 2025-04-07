# CMake template

A template that can be used as a base for C/C++ projects. It does nothing too complex, just a
few opinionated decisions, see the scripts documentation and the provided example. It was only
tested on Windows, but should work on any platform. It is intended for personal use but feel
free to use it.

## How to run

To run the code just install CMake and use one of the provided workflows:

- List them with `cmake --workflow --list-presets`
- Configure and compile with `cmake --workflow <selected_workflow>`
- Run the executable, should be created at `<root>/build/<workflow_name>/out/bin/<config>/`,
  workflows name convention is `<compiler>-<arch>-<config>`, for example Visual Studio
  compiler (MSVC), x64 and debug should be `msvc-x64-debug`.

**Important**: Please notice that you must have installed and configured the compiler/toolchain,
follow instructions for your OS, only MSVC is windows only, the others can be used
from any platform:

- MSVC: https://visualstudio.microsoft.com/pt-br/.
- GCC: https://gcc.gnu.org/onlinedocs/gcc/ (should be installed along with linux, can be used on windows
  with https://www.mingw-w64.org/).
- Clang: https://releases.llvm.org/download.html.
- Emscripten: https://emscripten.org/ (Emscripten depends on the `EMSDK` environment variable being set).

You should customize and/or extend these workflows for your specific needs.
See https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html.

For an example on how to use this, see https://github.com/XReaper95/raylib-game-template.