module SumOfMultiples (sumOfMultiples) where
import Data.List (nub, concatMap)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum (nub (concatMap (multiples limit) factors))
  where
    multiples limit n
      | n <= 0 = []
      | otherwise = takeWhile (< limit) [n*i| i <- [1..limit `div` n]]