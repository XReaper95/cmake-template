include("Utils")
include("ExternalsUtils")

# All dependencies should provide a function similar to the one bellow, to allow
# integration with the main project

#[[ Example function to configure an external library, this should perform
    any necessary steps to customize the build and integration with 
    the main project.
]]
function(configure_external_library)
    set(LIB_NAME "example_library")
    announce("Configuring \"${LIB_NAME}\" external library.")

    # set CMake customization flags, if the library provides them 
    force_bool(EXTERNAL_LIBRARY_CMAKE_FLAG ON)

    # then just add the library with `add_external_subdirectory`, this is 
    # just a macro for:
    # add_subdirectory("${EXTERNAL_LIBS_SOURCES_DIR}/${LIB_NAME}" 
    #                   "${CMAKE_BINARY_DIR}/external/${LIB_NAME}" EXCLUDE_FROM_ALL)
    add_external_subdirectory(${LIB_NAME})

    # perform any intermediary steps to get the library integration working

    # IMPORTANT: linking should be done by each library/executable in their own CMakeLists.txt
    # target_link_libraries(${target} PRIVATE example_lib_target)

    # for libraries that don't have CMake integration, like header only ones,
    # a CMakeLists.txt script should be added to them, like the provided 
    # example. (see `external/libs/example_library/CMakeLists.txt`)
endfunction()