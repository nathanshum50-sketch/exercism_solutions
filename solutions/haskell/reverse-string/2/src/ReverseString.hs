module ReverseString (reverseString) where

reverseString :: String -> String
reverseString input = flip input []
  where flip input output = if null input then output
                            else flip (tail input) ((head input):output)