module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, empty, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldr count (Right empty) xs
  where
    count :: Char -> Either String (Map Nucleotide Int) -> Either String (Map Nucleotide Int)
    count 'A' (Right m) = Right (insertWith (+) A 1 m)
    count 'C' (Right m) = Right (insertWith (+) C 1 m)
    count 'T' (Right m) = Right (insertWith (+) T 1 m)
    count 'G' (Right m) = Right (insertWith (+) G 1 m)
    count _ _ = Left "error"
