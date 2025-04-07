include("Utils")

# All dependencies should provide a function similar to the one bellow, to allow
# integration with the main project

#[[ Example function to configure an external library, this should perform
    any necessary steps to customize the build and integration with 
    the main project.
    
    Parameters:
        target: The CMake target that will have this library as dependency.
]]
function(configure_external_library target)
    set(LIB_NAME "example_library")

    # set CMake customization flags, if the library provides them 
    force_bool(EXTERNAL_LIBRARY_CMAKE_FLAG ON)

    # then just add the library with `add_external_subdirectory`, this is 
    # just a macro for:
    # add_subdirectory("${EXTERNAL_LIBS_SOURCES_DIR}/${LIB_NAME}" 
    #                   "${CMAKE_BINARY_DIR}/external/${LIB_NAME}" EXCLUDE_FROM_ALL)
    add_external_subdirectory(${LIB_NAME})
    # link it to the provided target, notice that the library target may have
    # any name, consult the documentation or browse its CMake scripts
    target_link_libraries(${target} PRIVATE example_lib_target)

    # for libraries that don't have CMake integration, like header only ones,
    # a CMakeLists.txt script should be added to them, like the provided 
    # example. (see `external/libs/example_library/CMakeLists.txt`)

    # copy the library headers to a "thirdparty" directory to allow
    # to include them like `#include "thirdparty/${LIB_NAME}/..."`,
    # this is just a convenience and it is not required at all,
    # it helps to keep includes cleaner, if you use this keep, 
    # the library's headers with the same structure within
    # the "thirdparty" directory to avoid surprises,
    # notice that the second `path` parameter is relative to the 
    # library directory at `external/libs/${LIB_NAME}`
    copy_thirdparty_includes(${LIB_NAME} "include/hello.h")
endfunction()