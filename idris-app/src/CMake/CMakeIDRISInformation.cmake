# This file sets the basic flags for the Idris compiler
if(NOT CMAKE_IDRIS_COMPILE_OBJECT)
    set(CMAKE_IDRIS_COMPILE_OBJECT
        "<CMAKE_IDRIS_COMPILER> \
        -i .. \
	--sourcepath .. \
	--codegen C \
	--codegenonly \
	-o <OBJECT> \
	<SOURCE>"
    )
endif()
set(CMAKE_IDRIS_INFORMATION_LOADED 1)
