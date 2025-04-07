# External libraries

This is similar to how Godot handles dependencies, they should be embedded, and documented
following the template. Cmake integration should be done in a file named `<dependency_name.cmake>`,
that lives at `<project_root>/cmake/dependencies`. For consistency, `dependency_name` should match
the name of the top level folder here.

## example_library (library name)

- Description: A small description for the library.
- Upstream: GitHub/Gitlab/Codeberg link, if any.
- Version: branch, tag or any identifier (git commit hash here, this is the most important part)
- License: name of the license (i.e `MIT`)
- Updated: `dd/mm/YYYY` (last time this dependency was manually updated)
- Files extracted from upstream:
    - A list of files extracted from the dependency repository, since dependencies
      are embedded, it's better to bring only required files, this should be tested
      thoroughly, as dependencies can break in many ways if this is done.