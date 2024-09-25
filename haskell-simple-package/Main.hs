module Main where

import HaskellSay (haskellSay)
import ExampleLibrary

main :: IO ()
main = haskellSay $ "If inverted, False is " ++ writeBool (invert False)

