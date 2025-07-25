#[[ Adds a subdirectory with a binary directory at with root at 
    "${CMAKE_BINARY_DIR}/external/${lib_name}" and mark it as
    EXCLUDE_FROM_ALL and SYSTEM
]]
macro(AddExternalSubdirectory lib_name)
    add_subdirectory(
            "${EXTERNAL_LIBS_SOURCES_DIR}/${lib_name}" 
            "${CMAKE_BINARY_DIR}/external/${lib_name}"
            EXCLUDE_FROM_ALL
            SYSTEM
    )
endmacro()
