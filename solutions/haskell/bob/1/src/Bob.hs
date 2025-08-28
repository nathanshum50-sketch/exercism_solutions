module Bob (responseFor) where

import Data.Char(isUpper, isSpace, isLower)

responseFor :: String -> String
responseFor xs
  | isSilent xs = "Fine. Be that way!"
  | allUpper xs && isQuestion xs = "Calm down, I know what I'm doing!"
  | isQuestion xs = "Sure."
  | allUpper xs = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    allUpper xs = any isUpper xs && not (any isLower xs)
    isQuestion xs = not (null xs) && last (filter (not. isSpace) xs) == '?'
    isSilent xs = null xs || all isSpace xs