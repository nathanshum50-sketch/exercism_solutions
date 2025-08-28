module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n == 1 = Just 1
  | n > 1 && n <= 64 = Just (2^(n-1))
  | otherwise = Nothing

total :: Integer
total = sum [n|Just n <- map square [1..64]]

