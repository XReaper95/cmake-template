cmake_minimum_required(VERSION 3.23)
project("<CHANGE_ME>" C)

# set the CMake modules path, required to import using " include(...)"
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# ========== Global Configuration ===========
include("Config") # must be a relative path

# ========== Game ===========
add_subdirectory(src)
