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

    -- get bootinfo
    info <- seL4_GetBootinfo

    -- give thread a useful name
    seL4_DebugNameThread (cast SeL4_CapInitThreadTCB) "idris rootserver"

    -- print out bootinfo
    debugPrintBootInfo info

    -- get cspace root cnode
    let cspace_cap = SeL4_CapInitThreadCNode

    -- get vspace root page diretory
    let pd_cap = SeL4_CapInitThreadVSpace

    -- Set tcb_cap to a free cap slot index
    let tcb_cap = start $ empty info

    -- Left-overs
    seL4_Yield
    seL4_DebugHalt
    debugPrint "should not be reached..\n"
