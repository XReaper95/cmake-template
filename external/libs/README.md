# External libraries

Dependencies are embedded (vendored), and documented following the template. Library integration 
should be done in a file named `<dependency_name.cmake>`, that lives at`<project_root>/cmake/dependencies`. 
For consistency, `dependency_name` should match the name of the top level folder here. Libraries that do
not support CMake should be wrapped by creating a CMakeLists.txt file for them (set the `Wrapped` item),
this file is better commited at the root of the library.


##  \<library name\> (TEMPLATE)

- Description: A small description for the library.
- Upstream: GitHub/Gitlab/CodeBerg link, if any.
- Version: branch, tag or any identifier (optionally the exact commit hash here)
- License: name of the license (i.e `MIT`)
- Updated: `dd/mm/YYYY (example format)` (last time this dependency was manually updated)
- Wrapped: `yes/no` (a CMakeLists.txt wrapper was used)
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