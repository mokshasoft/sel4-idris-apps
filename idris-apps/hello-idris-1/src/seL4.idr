{-
Copyright 2018, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module seL4

%include C "sel4/sel4.h"

public export
seL4_DebugPutChar : Char -> IO ()
seL4_DebugPutChar c = foreign FFI_C "seL4_DebugPutChar" (Char -> IO ()) c

