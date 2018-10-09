{-
Copyright 2018, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

{-
  ported from file ./kernel/libsel4/include/sel4/sel4.h
-}

module seL4.seL4

import public seL4.Syscalls
import public seL4.seL4Debug

%include C "sel4/sel4.h"

