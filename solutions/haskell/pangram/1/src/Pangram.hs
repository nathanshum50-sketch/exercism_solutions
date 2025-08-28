module Pangram (isPangram) where

import Data.Char(toLower,isLetter)

isPangram :: String -> Bool
isPangram text = all (`elem` loweredLetters) ['a'..'z']
  where
    loweredText = map toLower text
    loweredLetters = filter isLetter loweredText
