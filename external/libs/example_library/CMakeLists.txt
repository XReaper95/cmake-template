# if a library doesn't have CMake integration, or is header only, 
# it should be added manually, like for example:

cmake_minimum_required(VERSION 3.23)
project("example_library" LANGUAGES C VERSION 0.0.1)

# a real library may provide many targets, and/or a way to choose between
# dynamic and static linking
add_library(example_lib_target STATIC src/impl.c)

# for finding headers
target_include_directories(example_lib_target PRIVATE include)

# library provided options
option(EXTERNAL_LIBRARY_CMAKE_FLAG "A flag to toggle a cool feature." OFF)

if (EXTERNAL_LIBRARY_CMAKE_FLAG)
    # library definitions, to control compilation
    target_compile_definitions(example_lib_target PRIVATE EXTERNAL_LIBRARY_FEATURE)
endif ()