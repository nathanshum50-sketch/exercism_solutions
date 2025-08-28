module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = (answer 4 && (not (answer 100))) || answer 400
  where
   answer x = year `mod` x == 0