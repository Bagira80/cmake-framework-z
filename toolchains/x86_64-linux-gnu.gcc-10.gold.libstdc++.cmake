##
# @file
# @brief A CMake toolchain file for GCC
# @details Sets the following:
#          - platform    : x86_64-linux-gnu
#          - compiler    : GCC (version 10)
#          - linker      : Gold linker
#          - std-library : libstdc++ (GNU)
#

# Cross-compiling?
if (NOT CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL "x86_64" OR NOT CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set( CMAKE_SYSTEM_PROCESSOR "x86_64" )
    set( CMAKE_SYSTEM_NAME      "Linux" )
    # Sadly, we currently do not know which Linux version we are targeting!
    if (NOT DEFINED CMAKE_SYSTEM_VERSION)
        message( WARNING "CMAKE_SYSTEM_VERSION cannot be set automatically! Please provide one via command-line." )
    endif()
endif()

set( CMAKE_C_COMPILER "gcc-10" )
set( CMAKE_C_COMPILER_TARGET "x86_64-linux-gnu" )
set( CMAKE_CXX_COMPILER "g++-10" )
set( CMAKE_CXX_COMPILER_TARGET "x86_64-linux-gnu" )

set( CMAKE_LINKER "ld.gold" CACHE FILEPATH "Default linker" )
set( CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=gold" )
set( CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=gold" )
set( CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=gold" )
