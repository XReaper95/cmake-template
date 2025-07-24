# CMake template

A template that can be used as a base for CMake C++ projects (can be easily adapted for C). It does nothing too complex, 
just a few opinionated decisions, see the CMake scripts documentation and the provided example. It was only
tested on Windows, but should work on any platform. It's intended for personal use but feel
free to use it, there are many missing configuration combinations, so is better to use this as a starting
point to your own project structure.

## How to run

To run the code just install CMake and use one of the provided presets. CMake works by generating a project
model, this is done at the "config" step (`--config`, this is the default), then projects are built at the 
"build" step (`--build`). To build and run:

- List the "config" presets with `cmake --list-presets`, presets name convention is `<platform>-<config>`, 
  pick one.
- Generate the project configuration with `cmake --preset <preset_name>`.
- Compile the code for the selected preset with `cmake --build --preset <preset_name>`, 
  the name of the preset is the same for both steps, but can be different.
- Run the executable(s), should be created at `<root>/build/<config_preset_name>/out/bin/`,

There also exists workflows (`--workflow`) presets, that are single commands that call various steps, 
they aren't provided out of the box, see CMake docs.
I use `Ninja` as the generator, this can be changed, but other generators are not configured.

**Important**: Please notice that you must have installed and configured the compiler/toolchain,
follow instructions for your OS:

- `win64-*` -> MSVC: https://visualstudio.microsoft.com/pt-br/.
- `linux64-*` (TODO) ->  GCC: https://gcc.gnu.org/onlinedocs/gcc/ (should be installed along with linux, can be used on windows
  with https://www.mingw-w64.org/, this is not configured out of the box).
- (supported by all the platforms LLVM support) -> Clang: https://releases.llvm.org/download.html.
- `web` -> Emscripten: https://emscripten.org/ (Emscripten depends on the `EMSDK` environment variable being set).

You should customize and/or extend these presets for your specific needs. Take a look at existing presets to
understand the structure.
See https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html.


## External libraries

I added a few external libraries that I considered useful, they work as an example of integration and can be easily
removed or added as deemed necessary. Always like to vendor the libraries I use, but it can also be done with
Git Submodules. See [README.md](external/libs/README.md) for more information.