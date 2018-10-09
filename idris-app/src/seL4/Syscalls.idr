{-
Copyright 2018, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

{-
  ported from kernel/libsel4/include/sel4/syscalls.h
-}

module seL4.Syscalls

%access public export
%default total

-- void seL4_DebugPutChar(char c);
seL4_DebugPutChar : Char -> IO ()
seL4_DebugPutChar c = foreign FFI_C "seL4_DebugPutChar" (Char -> IO ()) c
