include("SymlinkContent")

include("dependencies/example_library")

project("SomeGame" C)

add_executable(${PROJECT_NAME} "main.c")

# link required external libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
        example_lib_target)

# C standard stuff
set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD 11)
set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD_REQUIRED ON)
set_target_properties(${PROJECT_NAME} PROPERTIES C_EXTENSIONS OFF)

# set warnings
target_compile_options(${PROJECT_NAME} PRIVATE
        "$<${COMPILER_GCC_LIKE}:-Wall;-Wextra;-W;-Werror;-pedantic-errors>"
        "$<${COMPILER_MSVC_LIKE}:/nologo;/W4;/WX>"
)

# this is set by the Emscripten toolchain
if (EMSCRIPTEN)
    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".html")

    # do emscripten stuff, handle resources
else ()
    # add symlink to resources
    symlink_content(${PROJECT_NAME} contents)

    # desktop specific stuff
endif ()
