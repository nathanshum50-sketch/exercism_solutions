module Acronym (abbreviate) where

import Data.Char (isAlpha,toUpper,isUpper)

abbreviate :: String -> String
abbreviate [] = []
abbreviate xs = concatMap (first . letters) list
  where
    list = words $ map (\c -> if c == '-' then ' ' else c) xs
    letters str = filter isAlpha str
    first :: String -> String
    first [] = []
    first (x:xs) = toUpper x : (if not . all isUpper $ x:xs then filter isUpper xs else [])