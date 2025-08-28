module Bob (responseFor) where

import Data.Char(isUpper, isSpace, isLetter)

responseFor :: String -> String
responseFor xs
  | isSilent xs = "Fine. Be that way!"
  | isShouting xs && isQuestion xs = "Calm down, I know what I'm doing!"
  | isQuestion xs = "Sure."
  | isShouting xs = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    notSpace = filter (not. isSpace) xs
    letters = filter isLetter xs
    isShouting xs = any isLetter letters && all isUpper letters
    isQuestion xs = not (null notSpace) && last notSpace == '?'
    isSilent xs = null notSpace