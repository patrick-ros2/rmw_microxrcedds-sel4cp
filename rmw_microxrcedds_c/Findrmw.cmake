
include_directories(
        ~/ros2/include/rmw
)

macro(configure_rmw_library library_target)
#    cmake_parse_arguments(_ARG "" "LANGUAGE" "" ${ARGN})
#    if(_ARG_UNPARSED_ARGUMENTS)
#        message(FATAL_ERROR "configure_rmw_library() called with unused "
#                "arguments: ${_ARG_UNPARSED_ARGUMENTS}")
#    endif()
#
#    if(NOT _ARG_LANGUAGE)
#        set(_ARG_LANGUAGE "CXX")
#    endif()
#
#    if(_ARG_LANGUAGE STREQUAL "C")
#        # Set the visibility to hidden by default if possible
#        if(CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang")
#            # Set the visibility of symbols to hidden by default for gcc and clang
#            # (this is already the default on Windows)
#            set_target_properties(${library_target}
#                    PROPERTIES
#                    COMPILE_FLAGS "-fvisibility=hidden"
#                    )
#        endif()
#
#    elseif(_ARG_LANGUAGE STREQUAL "CXX")
#        # Set the visibility to hidden by default if possible
#        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
#            # Set the visibility of symbols to hidden by default for gcc and clang
#            # (this is already the default on Windows)
#            set_target_properties(${library_target}
#                    PROPERTIES
#                    COMPILE_FLAGS "-fvisibility=hidden -fvisibility-inlines-hidden"
#                    )
#        endif()
#
#    else()
#        message(FATAL_ERROR "configure_rmw_library() called with unsupported "
#                "LANGUAGE: '${_ARG_LANGUAGE}'")
#    endif()
#
#    if(WIN32)
#        # Causes the visibility macros to use dllexport rather than dllimport
#        # which is appropriate when building the dll but not consuming it.
#        target_compile_definitions(${library_target}
#                PRIVATE "RMW_BUILDING_DLL")
#    endif()
endmacro()


function(get_rmw_typesupport var rmw_implementation)
#    cmake_parse_arguments(ARG "" "LANGUAGE" "" ${ARGN})
#    if(ARG_UNPARSED_ARGUMENTS)
#        message(FATAL_ERROR "get_rmw_typesupport() called with unused "
#                "arguments: ${ARG_UNPARSED_ARGUMENTS}")
#    endif()
#    set(resource_type "rmw_typesupport")
#    if(ARG_LANGUAGE)
#        string(TOLOWER "${ARG_LANGUAGE}" ARG_LANGUAGE)
#        set(resource_type "${resource_type}_${ARG_LANGUAGE}")
#    endif()
#    ament_index_has_resource(has_resource "${resource_type}" "${rmw_implementation}")
#    if(has_resource)
#        ament_index_get_resource(resource "${resource_type}" "${rmw_implementation}")
#    else()
#        set(resource "")
#    endif()
#    set(${var} "${resource}" PARENT_SCOPE)
endfunction()

function(register_rmw_implementation)
#    set(all_typesupports "")
#    set(language_labels "")
#
#    foreach(arg_raw ${ARGN})
#        # replace colon with semicolon to turn into a list
#        string(REPLACE ":" ";" arg "${arg_raw}")
#        list(LENGTH arg arg_length)
#        if(arg_length LESS 1)
#            message(FATAL_ERROR
#                    "register_rmw_implementation() called with invalid input: ${arg_raw}")
#        endif()
#        list(GET arg 0 language_label)
#        list(REMOVE_AT arg 0)
#        string(TOLOWER "${language_label}" language_label)
#        # Cache the existing languages labels found (so that we don't have to
#        # check the ament index twice every loop) and error if we've already
#        # encountered the language
#        list(FIND language_labels "${language_label}" label_found)
#        if(NOT ${label_found} EQUAL -1)
#            message(FATAL_ERROR
#                    "register_rmw_implementation() got language '${language_label}' "
#                    "multiple times")
#        endif()
#        list(APPEND language_labels "${language_label}")
#        ament_index_register_resource(
#                "rmw_typesupport_${language_label}" CONTENT "${arg}"
#        )
#        list_append_unique(all_typesupports "${arg}")
#    endforeach()
#
#    ament_index_register_resource("rmw_typesupport" CONTENT "${all_typesupports}")
endfunction()

