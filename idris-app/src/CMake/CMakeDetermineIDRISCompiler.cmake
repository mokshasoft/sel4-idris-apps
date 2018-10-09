# Find the Idris compiler
find_program(
    CMAKE_IDRIS_COMPILER
        NAMES "idris"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "Idris compiler"
)
mark_as_advanced(CMAKE_IDRIS_COMPILER)

set(CMAKE_IDRIS_SOURCE_FILE_EXTENSIONS idr;IDRIS)
set(CMAKE_IDRIS_OUTPUT_EXTENSION .c)
set(CMAKE_IDRIS_COMPILER_ENV_VAR "IDRIS")

# Configure variables set in this file for fast reload later on
configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/CMakeIDRISCompiler.cmake.in
    ${CMAKE_PLATFORM_INFO_DIR}/CMakeIDRISCompiler.cmake)
