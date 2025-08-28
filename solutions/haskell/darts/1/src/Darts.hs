module Darts (score) where

score :: Float -> Float -> Int
score x y = test (distance x y)
  where
    distance x y = x*x + y*y
    test z
      | z > 100 = 0
      | z > 25 = 1
      | z > 1 = 5
      | otherwise = 10