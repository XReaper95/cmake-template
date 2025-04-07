include("SymlinkContent")
include("ExternalsUtils")
include("dependencies/example_library")

project("SomeGame" C)

add_executable(${PROJECT_NAME} "main.c")

# C standard stuff
set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD 11)
set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD_REQUIRED ON)
set_target_properties(${PROJECT_NAME} PROPERTIES C_EXTENSIONS OFF)

# this is set by the included Windows toolchain
if (MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /nologo /W4 /WX)
else ()
    # should cover both GCC and CLANG
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -W -Werror -pedantic-errors)
endif ()

# this is set by the Emscripten toolchain
if (EMSCRIPTEN)
    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".html")
    # to emscripten stuff, handle resources
else ()
    # add symlink to resources
    symlink_content(${PROJECT_NAME} contents)
endif ()

# configure external dependencies
configure_external_library(${PROJECT_NAME})

# configure thirdparty include directory, required to include files 
# like #include "thirdparty/<some_lib>/...", this is optional
target_include_thirdparty(${PROJECT_NAME})
