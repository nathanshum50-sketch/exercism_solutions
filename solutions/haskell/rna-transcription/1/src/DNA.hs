module DNA (toRNA) where
import Data.Traversable(traverse)

toRNA :: String -> Either Char String
toRNA xs = traverse transform xs
  where
    transform :: Char -> Either Char Char
    transform 'G' = Right 'C'
    transform 'C' = Right 'G'
    transform 'T' = Right 'A'
    transform 'A' = Right 'U'
    transform c = Left c
