{-
Copyright 2019, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module Main

import System.Concurrency.Channels
import seL4.seL4

data Message = Add Int Int

adder : IO ()
adder = do
    Just chSender <- listen 1 | Nothing => adder
    Just msg <- unsafeRecv Message chSender | Nothing => adder
    case msg of
        Add x y => do
            ok <- unsafeSend chSender (x + y)
            adder

sendAdd : Channel -> Int -> Int -> IO Int
sendAdd ch i1 i2 = do
    ok <- unsafeSend ch (Add i1 i2)
    Just sum <- unsafeRecv Int ch | Nothing => pure 0
    pure sum

main : IO ()
main = do
    Just idAdder <- spawn adder | Nothing => debugPrint "spawn failed"
    Just ch <- connect idAdder | Nothing => debugPrint "connect failed"
    sum <- sendAdd ch 1 1
    debugPrint $ show sum
