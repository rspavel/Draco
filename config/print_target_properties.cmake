# ---------------------------------------------------------------------------- #
# file   config/print_target_properties.cmake
# author Kelly Thompson
# brief  Use these tools for debugging cmake code.  Calling
#        print_targets_properties( <target> ) will print all data associated
#        with the named target.
# note   Copyright (C) 2016-2018 Los Alamos National Security, LLC.
#        All rights reserved
#
# Ref: Original idea taken from  http://www.kitware.com/blog/home/post/390
#
# Use:
#    include( print_target_properties )
#    print_targets_properties( "target01;target02" )
#
# Updates: The list of targets known by cmake may need to updated
# periodically. See the instructions below for a bash command that will help.
#------------------------------------------------------------------------------#

function(echo_target_property tgt prop)
  # v for value, d for defined, s for set

  get_property(v TARGET ${tgt} PROPERTY ${prop})
  get_property(d TARGET ${tgt} PROPERTY ${prop} DEFINED)
  get_property(s TARGET ${tgt} PROPERTY ${prop} SET)

  # only produce output for values that are set
  if(s)
    message("'${prop}' = '${v}'")
    # message("tgt='${tgt}' prop='${prop}'")
    # message("  value='${v}'")
    # message("  defined='${d}'")
    # message("  set='${s}'")
    # message("")
  endif()
endfunction()

#------------------------------------------------------------------------------#
function(echo_target tgt)
  if(NOT TARGET ${tgt})
    message("There is no target named '${tgt}'")
    return()
  endif()

  # properties documented at
  # https://cmake.org/cmake/help/v3.5/manual/cmake-properties.7.html#properties-on-targets
  # props=`cmake --help-property-list`
  # for p in $props; do
  # case $p in
  # *\<CONFIG\>* )
  # echo $p | sed -e 's/<CONFIG>/DEBUG/'
  # echo $p | sed -e 's/<CONFIG>/RELEASE/'
  # echo $p | sed -e 's/<CONFIG>/RELWITHDEBINFO/'
  # ;;
  # *\<LANG\>* )
  # echo $p | sed -e 's/<LANG>/C/'
  # echo $p | sed -e 's/<LANG>/CXX/'
  # echo $p | sed -e 's/<LANG>/Fortran/'
  # ;;
  # omit the following
  # VS_DEPLOYMENT_LOCATION | MACOSX_PACKAGE_LOCATION | LOCATION | LOCATION_DEBUG | LOCATION_RELEASE | LOCATION_RELWITHDEBINFO) ;;
  # *\<section\> | *\<an-attribute\> | *\<variable\> | *\<tagname\> | *\<refname\> ) ;;
  # * ) echo $p ;;
  # esac
  # done
  set(props
    ABSTRACT
    ADDITIONAL_MAKE_CLEAN_FILES
    ADVANCED
    ALIASED_TARGET
    ALLOW_DUPLICATE_CUSTOM_TARGETS
    ANDROID_ANT_ADDITIONAL_OPTIONS
    ANDROID_API
    ANDROID_API_MIN
    ANDROID_ARCH
    ANDROID_ASSETS_DIRECTORIES
    ANDROID_GUI
    ANDROID_JAR_DEPENDENCIES
    ANDROID_JAR_DIRECTORIES
    ANDROID_JAVA_SOURCE_DIR
    ANDROID_NATIVE_LIB_DEPENDENCIES
    ANDROID_NATIVE_LIB_DIRECTORIES
    ANDROID_PROCESS_MAX
    ANDROID_PROGUARD
    ANDROID_PROGUARD_CONFIG_PATH
    ANDROID_SECURE_PROPS_PATH
    ANDROID_SKIP_ANT_STEP
    ANDROID_STL_TYPE
    ARCHIVE_OUTPUT_DIRECTORY
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE
    ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO
    ARCHIVE_OUTPUT_NAME
    ARCHIVE_OUTPUT_NAME_DEBUG
    ARCHIVE_OUTPUT_NAME_RELEASE
    ARCHIVE_OUTPUT_NAME_RELWITHDEBINFO
    ATTACHED_FILES
    ATTACHED_FILES_ON_FAIL
    AUTOGEN_BUILD_DIR
    AUTOGEN_SOURCE_GROUP
    AUTOGEN_TARGETS_FOLDER
    AUTOGEN_TARGET_DEPENDS
    AUTOMOC
    AUTOMOC_DEPEND_FILTERS
    AUTOMOC_MOC_OPTIONS
    AUTOMOC_SOURCE_GROUP
    AUTOMOC_TARGETS_FOLDER
    AUTORCC
    AUTORCC_OPTIONS
    AUTORCC_SOURCE_GROUP
    AUTOUIC
    AUTOUIC_OPTIONS
    AUTOUIC_SEARCH_PATHS
    BINARY_DIR
    BUILDSYSTEM_TARGETS
    BUILD_RPATH
    BUILD_WITH_INSTALL_NAME_DIR
    BUILD_WITH_INSTALL_RPATH
    BUNDLE
    BUNDLE_EXTENSION
    CACHE_VARIABLES
    CLEAN_NO_CUSTOM
    CMAKE_CONFIGURE_DEPENDS
    CMAKE_CXX_KNOWN_FEATURES
    CMAKE_C_KNOWN_FEATURES
    COMPATIBLE_INTERFACE_BOOL
    COMPATIBLE_INTERFACE_NUMBER_MAX
    COMPATIBLE_INTERFACE_NUMBER_MIN
    COMPATIBLE_INTERFACE_STRING
    COMPILE_DEFINITIONS
    COMPILE_DEFINITIONS_DEBUG
    COMPILE_DEFINITIONS_RELEASE
    COMPILE_DEFINITIONS_RELWITHDEBINFO
    COMPILE_FEATURES
    COMPILE_FLAGS
    COMPILE_OPTIONS
    COMPILE_PDB_NAME
    COMPILE_PDB_NAME_DEBUG
    COMPILE_PDB_NAME_RELEASE
    COMPILE_PDB_NAME_RELWITHDEBINFO
    COMPILE_PDB_OUTPUT_DIRECTORY
    COMPILE_PDB_OUTPUT_DIRECTORY_DEBUG
    COMPILE_PDB_OUTPUT_DIRECTORY_RELEASE
    COMPILE_PDB_OUTPUT_DIRECTORY_RELWITHDEBINFO
    COST
    CPACK_DESKTOP_SHORTCUTS
    CPACK_NEVER_OVERWRITE
    CPACK_PERMANENT
    CPACK_STARTUP_SHORTCUTS
    CPACK_START_MENU_SHORTCUTS
    CPACK_WIX_ACL
    CROSSCOMPILING_EMULATOR
    CUDA_EXTENSIONS
    CUDA_PTX_COMPILATION
    CUDA_RESOLVE_DEVICE_SYMBOLS
    CUDA_SEPARABLE_COMPILATION
    CUDA_STANDARD
    CUDA_STANDARD_REQUIRED
    CXX_CLANG_TIDY
    CXX_COMPILER_LAUNCHER
    CXX_CPPLINT
    CXX_EXTENSIONS
    CXX_INCLUDE_WHAT_YOU_USE
    CXX_STANDARD
    CXX_STANDARD_REQUIRED
    CXX_VISIBILITY_PRESET
    C_CLANG_TIDY
    C_COMPILER_LAUNCHER
    C_EXTENSIONS
    C_INCLUDE_WHAT_YOU_USE
    C_STANDARD
    C_STANDARD_REQUIRED
    C_VISIBILITY_PRESET
    DEBUG_CONFIGURATIONS
    DEBUG_OUTPUT_NAME
    DEBUG_POSTFIX
    DEFINE_SYMBOL
    DEFINITIONS
    DEPENDS
    DEPLOYMENT_REMOTE_DIRECTORY
    DISABLED
    DISABLED_FEATURES
    EchoString
    ECLIPSE_EXTRA_NATURES
    ENABLED_FEATURES
    ENABLED_LANGUAGES
    ENABLE_EXPORTS
    ENVIRONMENT
    EXCLUDE_FROM_ALL
    EXCLUDE_FROM_DEFAULT_BUILD
    EXCLUDE_FROM_DEFAULT_BUILD_DEBUG
    EXCLUDE_FROM_DEFAULT_BUILD_RELEASE
    EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO
    EXPORT_NAME
    EXTERNAL_OBJECT
    FAIL_REGULAR_EXPRESSION
    FIND_LIBRARY_USE_LIB32_PATHS
    FIND_LIBRARY_USE_LIB64_PATHS
    FIND_LIBRARY_USE_LIBX32_PATHS
    FIND_LIBRARY_USE_OPENBSD_VERSIONING
    FIXTURES_CLEANUP
    FIXTURES_REQUIRED
    FIXTURES_SETUP
    FOLDER
    Fortran_CLANG_TIDY
    Fortran_COMPILER_LAUNCHER
    Fortran_CPPLINT
    Fortran_FORMAT
    Fortran_INCLUDE_WHAT_YOU_USE
    Fortran_MODULE_DIRECTORY
    Fortran_VISIBILITY_PRESET
    FRAMEWORK
    FRAMEWORK_VERSION
    GENERATED
    GENERATOR_FILE_NAME
    GENERATOR_IS_MULTI_CONFIG
    GLOBAL_DEPENDS_DEBUG_MODE
    GLOBAL_DEPENDS_NO_CYCLES
    GNUtoMS
    HAS_CXX
    HEADER_FILE_ONLY
    HELPSTRING
    IMPLICIT_DEPENDS_INCLUDE_TRANSFORM
    IMPORTED
    IMPORTED_CONFIGURATIONS
    IMPORTED_IMPLIB
    IMPORTED_IMPLIB_DEBUG
    IMPORTED_IMPLIB_RELEASE
    IMPORTED_IMPLIB_RELWITHDEBINFO
    IMPORTED_LIBNAME
    IMPORTED_LIBNAME_DEBUG
    IMPORTED_LIBNAME_RELEASE
    IMPORTED_LIBNAME_RELWITHDEBINFO
    IMPORTED_LINK_DEPENDENT_LIBRARIES
    IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG
    IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE
    IMPORTED_LINK_DEPENDENT_LIBRARIES_RELWITHDEBINFO
    IMPORTED_LINK_INTERFACE_LANGUAGES
    IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG
    IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE
    IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO
    IMPORTED_LINK_INTERFACE_LIBRARIES
    IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG
    IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE
    IMPORTED_LINK_INTERFACE_LIBRARIES_RELWITHDEBINFO
    IMPORTED_LINK_INTERFACE_MULTIPLICITY
    IMPORTED_LINK_INTERFACE_MULTIPLICITY_DEBUG
    IMPORTED_LINK_INTERFACE_MULTIPLICITY_RELEASE
    IMPORTED_LINK_INTERFACE_MULTIPLICITY_RELWITHDEBINFO
    IMPORTED_LOCATION
    IMPORTED_LOCATION_DEBUG
    IMPORTED_LOCATION_RELEASE
    IMPORTED_LOCATION_RELWITHDEBINFO
    IMPORTED_NO_SONAME
    IMPORTED_NO_SONAME_DEBUG
    IMPORTED_NO_SONAME_RELEASE
    IMPORTED_NO_SONAME_RELWITHDEBINFO
    IMPORTED_OBJECTS
    IMPORTED_OBJECTS_DEBUG
    IMPORTED_OBJECTS_RELEASE
    IMPORTED_OBJECTS_RELWITHDEBINFO
    IMPORTED_SONAME
    IMPORTED_SONAME_DEBUG
    IMPORTED_SONAME_RELEASE
    IMPORTED_SONAME_RELWITHDEBINFO
    IMPORT_PREFIX
    IMPORT_SUFFIX
    INCLUDE_DIRECTORIES
    INCLUDE_REGULAR_EXPRESSION
    INSTALL_NAME_DIR
    INSTALL_RPATH
    INSTALL_RPATH_USE_LINK_PATH
    INTERFACE_AUTOUIC_OPTIONS
    INTERFACE_COMPILE_DEFINITIONS
    INTERFACE_COMPILE_FEATURES
    INTERFACE_COMPILE_OPTIONS
    INTERFACE_INCLUDE_DIRECTORIES
    INTERFACE_LINK_LIBRARIES
    INTERFACE_POSITION_INDEPENDENT_CODE
    INTERFACE_SOURCES
    INTERFACE_SYSTEM_INCLUDE_DIRECTORIES
    INTERPROCEDURAL_OPTIMIZATION
    INTERPROCEDURAL_OPTIMIZATION_DEBUG
    INTERPROCEDURAL_OPTIMIZATION_RELEASE
    INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO
    IN_TRY_COMPILE
    IOS_INSTALL_COMBINED
    JOB_POOLS
    JOB_POOL_COMPILE
    JOB_POOL_LINK
    KEEP_EXTENSION
    LABELS
    LANGUAGE
    LIBRARY_OUTPUT_DIRECTORY
    LIBRARY_OUTPUT_DIRECTORY_DEBUG
    LIBRARY_OUTPUT_DIRECTORY_RELEASE
    LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO
    LIBRARY_OUTPUT_NAME
    LIBRARY_OUTPUT_NAME_DEBUG
    LIBRARY_OUTPUT_NAME_RELEASE
    LIBRARY_OUTPUT_NAME_RELWITHDEBINFO
    LINKER_LANGUAGE
    LINK_DEPENDS
    LINK_DEPENDS_NO_SHARED
    LINK_DIRECTORIES
    LINK_FLAGS
    LINK_FLAGS_DEBUG
    LINK_FLAGS_RELEASE
    LINK_FLAGS_RELWITHDEBINFO
    LINK_INTERFACE_LIBRARIES
    LINK_INTERFACE_LIBRARIES_DEBUG
    LINK_INTERFACE_LIBRARIES_RELEASE
    LINK_INTERFACE_LIBRARIES_RELWITHDEBINFO
    LINK_INTERFACE_MULTIPLICITY
    LINK_INTERFACE_MULTIPLICITY_DEBUG
    LINK_INTERFACE_MULTIPLICITY_RELEASE
    LINK_INTERFACE_MULTIPLICITY_RELWITHDEBINFO
    LINK_LIBRARIES
    LINK_SEARCH_END_STATIC
    LINK_SEARCH_START_STATIC
    LINK_WHAT_YOU_USE
    LISTFILE_STACK
    MACOSX_BUNDLE
    MACOSX_BUNDLE_INFO_PLIST
    MACOSX_FRAMEWORK_INFO_PLIST
    MACOSX_RPATH
    MACROS
    MANUALLY_ADDED_DEPENDENCIES
    MAP_IMPORTED_CONFIG_DEBUG
    MAP_IMPORTED_CONFIG_RELEASE
    MAP_IMPORTED_CONFIG_RELWITHDEBINFO
    MEASUREMENT
    MODIFIED
    NAME
    NO_SONAME
    NO_SYSTEM_FROM_IMPORTED
    OBJECT_DEPENDS
    OBJECT_OUTPUTS
    OSX_ARCHITECTURES
    OSX_ARCHITECTURES_DEBUG
    OSX_ARCHITECTURES_RELEASE
    OSX_ARCHITECTURES_RELWITHDEBINFO
    OUTPUT_NAME
    OUTPUT_NAME_DEBUG
    OUTPUT_NAME_RELEASE
    OUTPUT_NAME_RELWITHDEBINFO
    PACKAGES_FOUND
    PACKAGES_NOT_FOUND
    PARENT_DIRECTORY
    PASS_REGULAR_EXPRESSION
    PDB_NAME
    PDB_NAME_DEBUG
    PDB_NAME_RELEASE
    PDB_NAME_RELWITHDEBINFO
    PDB_OUTPUT_DIRECTORY
    PDB_OUTPUT_DIRECTORY_DEBUG
    PDB_OUTPUT_DIRECTORY_RELEASE
    PDB_OUTPUT_DIRECTORY_RELWITHDEBINFO
    POSITION_INDEPENDENT_CODE
    POST_INSTALL_SCRIPT
    PREDEFINED_TARGETS_FOLDER
    PREFIX
    PRE_INSTALL_SCRIPT
    PRIVATE_HEADER
    PROCESSORS
    PROJECT_LABEL
    PUBLIC_HEADER
    RELEASE_OUTPUT_NAME
    RELEASE_POSTFIX
    RELWITHDEBINFO_OUTPUT_NAME
    RELWITHDEBINFO_POSTFIX
    REPORT_UNDEFINED_PROPERTIES
    REQUIRED_FILES
    RESOURCE
    RESOURCE_LOCK
    RULE_LAUNCH_COMPILE
    RULE_LAUNCH_CUSTOM
    RULE_LAUNCH_LINK
    RULE_MESSAGES
    RUNTIME_OUTPUT_DIRECTORY
    RUNTIME_OUTPUT_DIRECTORY_DEBUG
    RUNTIME_OUTPUT_DIRECTORY_RELEASE
    RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO
    RUNTIME_OUTPUT_NAME
    RUNTIME_OUTPUT_NAME_DEBUG
    RUNTIME_OUTPUT_NAME_RELEASE
    RUNTIME_OUTPUT_NAME_RELWITHDEBINFO
    RUN_SERIAL
    SKIP_AUTOGEN
    SKIP_AUTOMOC
    SKIP_AUTORCC
    SKIP_AUTOUIC
    SKIP_BUILD_RPATH
    SKIP_RETURN_CODE
    SOURCES
    SOURCE_DIR
    SOVERSION
    STATIC_LIBRARY_FLAGS
    STATIC_LIBRARY_FLAGS_DEBUG
    STATIC_LIBRARY_FLAGS_RELEASE
    STATIC_LIBRARY_FLAGS_RELWITHDEBINFO
    STRINGS
    SUBDIRECTORIES
    SUFFIX
    SYMBOLIC
    TARGET_ARCHIVES_MAY_BE_SHARED_LIBS
    TARGET_MESSAGES
    TARGET_SUPPORTS_SHARED_LIBS
    TEST_INCLUDE_FILE
    TIMEOUT
    TIMEOUT_AFTER_MATCH
    TYPE
    USE_FOLDERS
    VALUE
    VARIABLES
    VERSION
    VISIBILITY_INLINES_HIDDEN
    VS_CONFIGURATION_TYPE
    VS_COPY_TO_OUT_DIR
    VS_DEBUGGER_WORKING_DIRECTORY
    VS_DEPLOYMENT_CONTENT
    VS_DESKTOP_EXTENSIONS_VERSION
    VS_DOTNET_REFERENCES
    VS_DOTNET_REFERENCES_COPY_LOCAL
    VS_DOTNET_TARGET_FRAMEWORK_VERSION
    VS_GLOBAL_KEYWORD
    VS_GLOBAL_PROJECT_TYPES
    VS_GLOBAL_ROOTNAMESPACE
    VS_INCLUDE_IN_VSIX
    VS_IOT_EXTENSIONS_VERSION
    VS_IOT_STARTUP_TASK
    VS_KEYWORD
    VS_MOBILE_EXTENSIONS_VERSION
    VS_RESOURCE_GENERATOR
    VS_SCC_AUXPATH
    VS_SCC_LOCALPATH
    VS_SCC_PROJECTNAME
    VS_SCC_PROVIDER
    VS_SDK_REFERENCES
    VS_SHADER_ENTRYPOINT
    VS_SHADER_FLAGS
    VS_SHADER_MODEL
    VS_SHADER_TYPE
    VS_STARTUP_PROJECT
    VS_TOOL_OVERRIDE
    VS_USER_PROPS
    VS_WINDOWS_TARGET_PLATFORM_MIN_VERSION
    VS_WINRT_COMPONENT
    VS_WINRT_EXTENSIONS
    VS_WINRT_REFERENCES
    VS_XAML_TYPE
    WILL_FAIL
    WIN32_EXECUTABLE
    WINDOWS_EXPORT_ALL_SYMBOLS
    WORKING_DIRECTORY
    WRAP_EXCLUDE
    XCODE_EMIT_EFFECTIVE_PLATFORM_NAME
    XCODE_EXPLICIT_FILE_TYPE
    XCODE_FILE_ATTRIBUTES
    XCODE_LAST_KNOWN_FILE_TYPE
    XCODE_PRODUCT_TYPE
    XCTEST)

  message("======================== ${tgt} ========================")
  foreach(p ${props})
    echo_target_property("${tgt}" "${p}")
  endforeach()
  message("")
endfunction()

#------------------------------------------------------------------------------#
function(print_targets_properties)
  set(tgts ${ARGV})
  foreach(t ${tgts})
    echo_target("${t}")
  endforeach()
endfunction()

#------------------------------------------------------------------------------#
# End config/print_target_properties.cmake
#------------------------------------------------------------------------------#