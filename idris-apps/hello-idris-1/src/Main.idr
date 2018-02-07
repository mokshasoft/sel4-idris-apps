{-
Copyright 2018, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module Main

import seL4

(>>) : Monad m => m a -> m b -> m b
m >> k = m >>= \_ => k

mapM_ : (Monad m, Foldable t) => (a -> m b) -> t a -> m ()
mapM_ f xs = foldr ((>>) . f) (pure ()) xs

debugPrint : String -> IO ()
debugPrint str = mapM_ seL4_DebugPutChar (unpack str)

main : IO ()
main = debugPrint "seL4 <3 Idris\n"
