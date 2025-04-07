#[[ Prints a message with a custom formatting. ]]
function(announce message)
    message("=========================================================")
    message("${message}")
    message("=========================================================")
endfunction()

#[[ Same as set(${name} ${value} CACHE BOOL "" FORCE). ]]
macro(force_bool name value)
    set(${name} ${value} CACHE BOOL "" FORCE)
endmacro()

#[[ Same as set(${name} ${value} CACHE STRING "" FORCE). ]]
macro(force_string name value)
    set(${name} ${value} CACHE STRING "" FORCE)
endmacro()
