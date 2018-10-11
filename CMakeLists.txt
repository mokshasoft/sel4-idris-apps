#
# Copyright 2018, Mokshasoft AB (mokshasoft.com)
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#

cmake_minimum_required(VERSION 3.7.2)

project(hello-world C)

add_subdirectory(idris-app)

# For some reason add_executable needs at least one file...
add_executable(hello-world EXCLUDE_FROM_ALL dummy.c)
target_link_libraries(
    hello-world
    Configuration
    idris-app
    sel4
    muslc
    utils
    sel4muslcsys
    sel4platsupport
    sel4utils
    sel4debug
)

# Build the debug kernel since the Idris app relies on seL4_DebugPutChar
ApplyCommonReleaseVerificationSettings(FALSE FALSE)

# We will attempt to generate a simulation script, so try and generate a simulation
# compatible configuration
ApplyCommonSimulationSettings(x86)

# Set this image as the rootserver
DeclareRootserver(hello-world)

# Generate a script for QEMU
GenerateSimulateScript()

set(KernelArch x86 CACHE STRING "" FORCE)
set(KernelX86Sel4Arch ${PLATFORM} CACHE STRING "" FORCE)
