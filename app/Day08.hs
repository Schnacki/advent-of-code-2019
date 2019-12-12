module Day08 (part1, part2) where

import Data.List(minimumBy, transpose)

type Layer = [Char]

partitionToSize :: Int -> Layer -> [Layer]
partitionToSize size list = case (splitAt size list) of
    (xs,[]) -> [xs]
    (xs,ys) -> xs:(partitionToSize size ys)

-- Part 1

countDigits :: Char -> Layer -> Int
countDigits digit = length . filter ((==) digit)

layerWithFewestZeroes :: [Layer] -> Layer
layerWithFewestZeroes = minimumBy compareZeroDigits
    where compareZeroDigits l1 l2 = compare (countDigits '0' l1) (countDigits '0' l2)

part1 :: FilePath -> IO Int
part1 file = do
    input <- readFile file
    let layer = layerWithFewestZeroes $ partitionToSize 150 input
    return $ (countDigits '1' layer) * (countDigits '2' layer)

-- Part 2

decode :: [Layer] -> String
decode = map extractColor . transpose
    where extractColor = foldl1 $ \x y-> if (x == '2') then y else x

part2 :: FilePath -> IO String
part2 file = readFile file >>= return . decode . partitionToSize 150