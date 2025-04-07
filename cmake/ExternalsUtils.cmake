#[[ Adds a subdirectory with a binary directory at with root at 
    "${CMAKE_BINARY_DIR}/external/${lib_name}" and mark it as
    EXCLUDE_FROM_ALL.
]]
macro(add_external_subdirectory lib_name)
    add_subdirectory("${EXTERNAL_LIBS_SOURCES_DIR}/${lib_name}" "${CMAKE_BINARY_DIR}/external/${lib_name}" EXCLUDE_FROM_ALL)
endmacro()

#[[ Should be used to copy header files to a custom included path
    this allows includes to be used like `#include "thirdparty/<lib_name>/..."`.
    
    Parameters:
        lib_name: The name of the external library, used to resolve the `path` parameter.
        path: The path to the file to copy, should be relative to "${EXTERNAL_LIBS_SOURCES_DIR}/${lib_name}".
]]
function(copy_thirdparty_includes lib_name path)
    set(ORIGIN_DIR "${EXTERNAL_LIBS_SOURCES_DIR}/${lib_name}")
    set(DESTINATION_DIR "${THIRDPARTY_INCLUDES_DIR}/${lib_name}/")

    file(COPY "${ORIGIN_DIR}/${path}" DESTINATION "${DESTINATION_DIR}")
endfunction()

#[[ Add the path  "${EXTERNAL_LIBS_SOURCES_DIR}" to the ${target} include directories,
    this allows includes to be used like `#include "thirdparty/<lib_name>/...".
]]
macro(target_include_thirdparty target)
    target_include_directories(${target} SYSTEM PUBLIC "${THIRDPARTY_INCLUDES_DIR}/..")
endmacro()