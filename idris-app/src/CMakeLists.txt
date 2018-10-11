#
# Copyright 2018, Mokshasoft AB (mokshasoft.com)
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#

cmake_minimum_required(VERSION 3.7.2)

project(idris-app-c C)

# Compile the Idris source to a C-file
file(GLOB IDR_SRCS
    *.idr
    seL4/*.idr
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/main.c
    COMMAND idris
        -i ${CMAKE_CURRENT_SOURCE_DIR}
        --sourcepath ${CMAKE_CURRENT_SOURCE_DIR}
        --codegen C
        --codegenonly
        -o ${CMAKE_CURRENT_BINARY_DIR}/main.c
        Main.idr
    DEPENDS ${IDR_SRCS}
)
add_custom_target(idr2c DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/main.c)

# Compile the generated C-file to a static library
add_library(idris-app STATIC EXCLUDE_FROM_ALL
    ${CMAKE_CURRENT_BINARY_DIR}/main.c
)
add_dependencies(idris-app idr2c)
target_link_libraries(
    idris-app
    Configuration
    sel4-idris-rts
    sel4
    muslc
)
