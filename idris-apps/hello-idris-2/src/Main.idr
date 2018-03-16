{-
Copyright 2018, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module Main

import seL4.seL4

main : IO ()
main = do
  debugPrint "seL4 <3 Idris #2\n"
  info <- seL4_GetBootinfo
  debugPrintBootInfo info
  seL4_Yield
  seL4_DebugNameThread (cast SeL4_CapInitThreadTCB) "idris rootserver"
  seL4_DebugHalt
  debugPrint "should not be reached..\n"
