# ========== Reference directories ===========

#[[ The root of the project. ]]
set(PROJECT_ROOT_DIR "${PROJECT_SOURCE_DIR}")

#[[ Sources of external libraries. ]]
set(EXTERNAL_LIBS_SOURCES_DIR "${PROJECT_ROOT_DIR}/external/libs")

#[[ Directory where external library includes will be copied, 
    this allows includes to be used like `#include "thirdparty/<lib_name>/..." .
]]
set(THIRDPARTY_INCLUDES_DIR "${CMAKE_BINARY_DIR}/../../external_includes/thirdparty")

#[[ Compiler type, for setting flags, etc. ]]
set(COMPILER_GCC_LIKE "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU,LCC>")
set(COMPILER_MSVC_LIKE "$<COMPILE_LANG_AND_ID:CXX,MSVC>")

