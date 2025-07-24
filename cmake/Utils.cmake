#[[ Prints a message with a custom formatting. ]]
function(Announce message)
    message("=========================================================")
    message("${message}")
    message("=========================================================")
endfunction()

#[[ Same as set(${name} ${value} CACHE BOOL "" FORCE). ]]
macro(ForceBool name value)
    set(${name} ${value} CACHE BOOL "" FORCE)
endmacro()

#[[ Same as set(${name} ${value} CACHE STRING "" FORCE). ]]
macro(ForceString name value)
    set(${name} ${value} CACHE STRING "" FORCE)
endmacro()

#[[ Prints every element from ${list_var}. ]]
function(PrintList list_var)
    foreach (item ${list_var})
        message(STATUS "DEBUG item: ${item}")
    endforeach ()
endfunction()
