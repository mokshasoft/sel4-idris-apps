#
# Copyright 2019, Mokshasoft AB (mokshasoft.com)
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#

cmake_minimum_required(VERSION 3.7.2)

# Use the BUILD_APP variable to control which app is built
if("${BUILD_APP}" STREQUAL "cooperative-multitasking")
    add_subdirectory(cooperative-multitasking)
else()
    add_subdirectory(hello-world)
endif()
