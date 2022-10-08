module ExampleLibrary where

invert :: Bool -> Bool
invert True = False
invert False = True

writeBool :: Bool -> String
writeBool True = "True"
writeBool False = "False"
