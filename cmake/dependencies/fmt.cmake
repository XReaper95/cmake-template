include("Utils")
include("ExternalsUtils")

block()
    set(lib_name "fmt")
    Announce("Configuring \"${lib_name}\" external library.")

    ForceBool(FMT_DOC OFF)
    ForceBool(FMT_INSTALL OFF)
    ForceBool(FMT_TEST OFF)
    ForceBool(FMT_FUZZ OFF)
    ForceBool(FMT_CUDA_TEST OFF)
    ForceBool(FMT_OS ON)
    ForceBool(FMT_MODULE OFF)
    ForceBool(FMT_SYSTEM_HEADERS OFF)
    ForceBool(FMT_UNICODE ON)

    AddExternalSubdirectory(${lib_name})
endblock()
