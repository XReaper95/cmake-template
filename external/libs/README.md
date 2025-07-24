# External libraries

## (GUIDE) <library name>

- Description: A small description for the library.
- Upstream: GitHub/Gitlab/CodeBerg link, if any.
- Version: branch, tag or any identifier (optionally the exact commit hash here)
- License: name of the license (i.e `MIT`)
- Updated: `dd/mm/YYYY (example format)` (last time this dependency was manually updated)
- Files extracted from upstream:
    - A list of files extracted from the dependency repository, since dependencies
      are embedded, it's better to bring only required files, this should be tested
      thoroughly, as dependencies can break in many ways if this is done.

## {fmt}

- Description: A modern formatting library.
- Upstream: https://github.com/fmtlib/fmt
- Version: Releases Page, file `fmt-11.1.4.zip`, version `11.1.4`.
- License: `MIT`
- Updated: `15/04/2025`
- Files extracted from upstream:
    - `include/**`
    - `src/**`
    - `support/**`
    - `ChangeLog.md`  (required by the build)
    - `CMakeLists.txt`
    - `LICENSE`
    - `README.md`  (required by the build)


## tracy

- Description: Frame profiler
- Upstream: https://github.com/wolfpld/tracy
- Version: `0.12.2` (c556831ddc6fe26d2fce01c14c97205a9dad46d5)
- License: `3-clause BSD`
- Updated: `07/23/2025`
- Files extracted from upstream:
    - `cmake`
    - `public`
    - `Config.cmake.in`
    - `CMakeLists.txt`
    - `LICENSE`