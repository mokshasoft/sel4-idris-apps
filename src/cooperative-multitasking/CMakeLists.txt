#
# Copyright 2019, Mokshasoft AB (mokshasoft.com)
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#

cmake_minimum_required(VERSION 3.7.2)

#
# This project does currently not build since it depends on pthread support in the Idris RTS.
#

set(name "cooperative-multitasking")

project(${name} C)

file(GLOB static
    *.idr
)

idris_app_link_modules(
    ${name}
    sel4ffi
)
idris_add_app(${name} ${static})
