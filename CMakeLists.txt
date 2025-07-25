cmake_minimum_required(VERSION 3.23)
project("CMakeTemplateExample" CXX)

# set the CMake modules path, required to import using " include(...)"
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# ========== Global Configuration, options and imports ===========
include("GlobalConfig")
include("Options")
include("SymlinkContent")
include("ExternalsUtils")

# ========== Dependencies ===========
# order matters for transitive dependencies
include("dependencies/fmt")
include("dependencies/tracy")

# ======================= Main Project =======================
Announce("Configuring main project")

# project sources
set(project_files src/main.cpp)

# main executable, includes, linked libraries and compiler flags
add_executable(${PROJECT_NAME} ${project_files})
target_include_directories(${PROJECT_NAME} PRIVATE "src")
target_link_libraries(${PROJECT_NAME} PRIVATE
        fmt::fmt
        Tracy::TracyClient
)

# C++ features
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)

# compiler flags
if (CXX_COMPILER_IS_GNU_LIKE)
    target_compile_options(${PROJECT_NAME} PRIVATE
            -Wall
            -Wextra
            -W
            -Werror
            -pedantic-errors
            -Wno-language-extension-token
    )
elseif (CXX_COMPILER_IS_MSVC_LIKE)
    target_compile_options(${PROJECT_NAME} PRIVATE
            /W4
            /WX
    )
else ()
    message(FATAL_ERROR "Unknown compiler frontend.")
endif ()

if (NOT TARGET_PLATFORM_IS_WEB)
    # content handling
    SymlinkContent(${PROJECT_NAME} "contents")
else ()
    # handle content when targeting the web, this is different 
    # from other platforms
endif ()

# source code macro pre-definitions
function(AddMacroDefinitions definitions)
    target_compile_definitions(${PROJECT_NAME} PRIVATE ${definitions})
endfunction()

# build type
if (CONFIG_IS_DEV)
    AddMacroDefinitions("DEV_BUILD")
    message(STATUS "Build type: Development")
elseif (CONFIG_IS_SHIPPING)
    AddMacroDefinitions("SHIPPING_BUILD")
    message(STATUS "Build type: Shipping")
elseif (CONFIG_IS_PROFILE)
    AddMacroDefinitions("PROFILE_BUILD")
    message(STATUS "Build type: Profile (Shipping with debug info)")
endif ()

# platform
message(STATUS "Building for '${CMAKE_SYSTEM_NAME}' platform")
