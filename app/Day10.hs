module Day10 (part1, part2) where

import Data.List (findIndices, (\\))
import Data.Tuple (swap)

type Pos = (Int,Int)
type Dimension = (Int, Int)

blockedPositions :: Dimension -> Pos -> Pos -> [Pos]
blockedPositions dim (x, y) (x', y') = if (x==x' && y==y') then [] else takeWhile (inRange dim) [(x' + d * (fst dist), y' + d * (snd dist)) | d <- [1 ..]]
    where 
        dist = ((x' - x) `div` (gcd (x' - x) (y' - y)), (y' - y) `div` (gcd (x' - x) (y' - y)))
        inRange (dimX, dimY) (x, y) = x >= 0 && x < dimX && y >= 0 && y < dimY

countDetectableAsteroids :: Dimension -> [Pos] -> Pos -> Int
countDetectableAsteroids dim field pos = pred . length $ field \\ (field >>= (blockedPositions dim pos))

findMostDetectableAsteroids :: Dimension -> [Pos] -> Int
findMostDetectableAsteroids dim field = maximum $ map (countDetectableAsteroids dim field) field

readField :: Dimension -> String -> [Pos]
readField (w, _) = map (swap . (`quotRem` w)) . findIndices ((==) '#') .concat . lines

part1 :: FilePath -> IO Int
part1 f = do
    file <- readFile f
    let field = readField (24, 24) file
    return $ findMostDetectableAsteroids (24, 24) field

part2 :: FilePath -> IO String
part2 f = return "TODO"