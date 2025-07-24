include("Utils")
include("ExternalsUtils")

block()
    set(lib_name "tracy")
    Announce("Configuring \"${lib_name}\" profiler.")
    
    # building options
    ForceBool(TRACY_STATIC ON)  # Whether to build Tracy as a static library
    ForceBool(TRACY_Fortran OFF)  # Build Fortran bindings
    ForceBool(TRACY_LTO OFF)  # Enable Link-Time optimization

    # this key is also overridable, but is better to use the build type to 
    # set it, can be forced for other build types
    if(CONFIG_IS_PROFILE OR ENABLE_TRACY_PROFILING)
        ForceBool(TRACY_ENABLE ON)  # Enable profiling
    else ()
        ForceBool(TRACY_ENABLE OFF)  # Disable profiling
    endif ()
    
    # ======= default profiler configuration =======
    # Note: all these keys are overridable with definitions of the same name
    ForceBool(TRACY_ON_DEMAND OFF)  # On-demand profiling
    ForceBool(TRACY_CALLSTACK OFF)  # Enforce callstack collection for tracy regions
    ForceBool(TRACY_NO_CALLSTACK OFF)  # Disable all callstack related functionality
    ForceBool(TRACY_NO_CALLSTACK_INLINES OFF)  # Disables the inline functions in callstacks
    ForceBool(TRACY_ONLY_LOCALHOST OFF)  # Only listen on the localhost interface
    ForceBool(TRACY_NO_BROADCAST OFF)  # Disable client discovery by broadcast to local network
    ForceBool(TRACY_ONLY_IPV4 OFF)  # Tracy will only accept connections on IPv4 addresses (disable IPv6)
    ForceBool(TRACY_NO_CODE_TRANSFER OFF)  # Disable collection of source code
    ForceBool(TRACY_NO_CONTEXT_SWITCH OFF)  # Disable capture of context switches
    ForceBool(TRACY_NO_EXIT OFF)  # Client executable does not exit until all profile data is sent to server
    ForceBool(TRACY_NO_SAMPLING OFF)  # Disable call stack sampling
    ForceBool(TRACY_NO_VERIFY OFF)  # Disable zone validation for C API
    ForceBool(TRACY_NO_VSYNC_CAPTURE OFF)  # Disable capture of hardware Vsync events
    ForceBool(TRACY_NO_FRAME_IMAGE OFF)  # Disable the frame image support and its thread
    ForceBool(TRACY_NO_SYSTEM_TRACING OFF)  # Disable systrace sampling
    ForceBool(TRACY_PATCHABLE_NOPSLEDS OFF)  # Enable nopsleds for efficient patching by system-level tools (e.g. rr)
    ForceBool(TRACY_DELAYED_INIT OFF)  # Enable delayed initialization of the library (init on first call)
    ForceBool(TRACY_MANUAL_LIFETIME OFF)  # Enable the manual lifetime management of the profile
    ForceBool(TRACY_FIBERS OFF)  # Enable fibers support
    ForceBool(TRACY_NO_CRASH_HANDLER OFF)  # Disable crash handling
    ForceBool(TRACY_TIMER_FALLBACK OFF)  # Use lower resolution timers
    ForceBool(TRACY_LIBUNWIND_BACKTRACE OFF)  # Use libunwind backtracing where supported
    ForceBool(TRACY_SYMBOL_OFFLINE_RESOLVE OFF)  # Instead of full runtime symbol resolution, only resolve the image path and offset to enable offline symbol resolution
    ForceBool(TRACY_LIBBACKTRACE_ELF_DYNLOAD_SUPPORT OFF)  # Enable libbacktrace to support dynamically loaded elfs in symbol resolution resolution after the first symbol resolve operation
    ForceBool(TRACY_DEBUGINFOD OFF)  # Enable debuginfod support

    AddExternalSubdirectory(${lib_name})
endblock()
