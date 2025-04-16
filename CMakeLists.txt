cmake_minimum_required(VERSION 3.23)
project("<CHANGE_ME>" C)

# set the CMake modules path, required to import using " include(...)"
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include("Dependencies/example_library")

# ========== Global Configuration ===========
include("Config")

# ========== Game ===========
add_subdirectory(src)

# ========= Dependencies ============
configure_external_library()
