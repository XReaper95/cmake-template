# ========== Global variables ===========

#[[ The root of the project. ]]
set(PROJECT_ROOT_DIR "${PROJECT_SOURCE_DIR}")

#[[ Sources of external libraries. ]]
set(EXTERNAL_LIBS_SOURCES_DIR "${PROJECT_ROOT_DIR}/external/libs")

#[[ Build Type ]]
string(COMPARE EQUAL "Debug" "${CMAKE_BUILD_TYPE}" CONFIG_IS_DEV)
string(COMPARE EQUAL "Release" "${CMAKE_BUILD_TYPE}" CONFIG_IS_SHIPPING)
string(COMPARE EQUAL "RelWithDebInfo" "${CMAKE_BUILD_TYPE}" CONFIG_IS_PROFILE)

#[[ Compiler frontends (for flags) ]]
string(COMPARE EQUAL "GNU" "${CMAKE_CXX_COMPILER_FRONTEND_VARIANT}" CXX_COMPILER_IS_GNU_LIKE)
string(COMPARE EQUAL "MSVC" "${CMAKE_CXX_COMPILER_FRONTEND_VARIANT}" CXX_COMPILER_IS_MSVC_LIKE)

#[[ Host platform ]]
string(COMPARE EQUAL "Windows" "${CMAKE_HOST_SYSTEM_NAME}" HOST_PLATFORM_IS_WINDOWS)
string(COMPARE EQUAL "Linux" "${CMAKE_HOST_SYSTEM_NAME}" HOST_PLATFORM_IS_LINUX)
string(COMPARE EQUAL "Darwin" "${CMAKE_HOST_SYSTEM_NAME}" HOST_PLATFORM_IS_MACOS)

#[[ Target platform ]]
string(COMPARE EQUAL "Windows" "${CMAKE_SYSTEM_NAME}" TARGET_PLATFORM_IS_WINDOWS)
string(COMPARE EQUAL "Linux" "${CMAKE_SYSTEM_NAME}" TARGET_PLATFORM_IS_LINUX)
string(COMPARE EQUAL "Darwin" "${CMAKE_SYSTEM_NAME}" TARGET_PLATFORM_IS_MACOS)
string(COMPARE EQUAL "Emscripten" "${CMAKE_SYSTEM_NAME}" TARGET_PLATFORM_IS_WEB)

# ========== Global configuration ===========
#[[ Generate compile_commands.json (compilation database) ]]
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)