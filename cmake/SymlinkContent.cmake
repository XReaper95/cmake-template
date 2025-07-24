#[[ Creates a symlink to the content folder in the binary folder,
    allows to test the project without copying the contents next
    to the executable.
    
    Parameters
        target_name: The name of the target, to obtain the binary folder.
        content_dir: The path to the contents, relative the the project root.
]]
function(SymlinkContent target_name content_dir)
    set(content_dir_path ${PROJECT_ROOT_DIR}/${content_dir})
    get_filename_component(content_dir ${content_dir_path} NAME)

    add_custom_command(
            TARGET ${target_name} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E create_symlink
            ${content_dir_path}
            $<TARGET_FILE_DIR:${target_name}>/${content_dir}
            VERBATIM
            COMMENT "Creates a symlink for the content folder and put it next to the executable."
            COMMAND_EXPAND_LISTS)
endfunction()
