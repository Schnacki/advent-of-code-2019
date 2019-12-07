module Day3 (part1) where

import qualified Data.List as L
import qualified Data.Set as S

type Position = (Int, Int)
data Direction = R Int | D Int | U Int | L Int deriving Show

move:: Direction -> Position -> [Position]
move (R ds) (x, y) = [(x + dist, y) | dist <- [1 .. ds]]
move (D ds) (x, y) = [(x, y - dist) | dist <- [1 .. ds]]
move (U ds) (x, y) = [(x, y + dist) | dist <- [1 .. ds]]
move (L ds) (x, y) = [(x - dist, y) | dist <- [1 .. ds]]

moveSequence:: [Direction] -> Position -> [Position]
moveSequence [] pos = []
moveSequence (direction:ds) pos = let moves = move direction pos 
    in moves ++ (moveSequence ds (last moves))

readRouteFile :: FilePath -> IO ([Direction],[Direction])
readRouteFile file = do
    routeLines <- lines <$> readFile file 
    let routes = parseRoute <$> routeLines
    return (routes !! 0,routes !! 1)
        where 
            parseRoute str = case L.findIndex (==',') str of
                Just index -> (readDirection $ take index str):parseRoute (drop (index + 1) str)
                Nothing -> [readDirection str]
            readDirection ('R':xs) = R $ read xs
            readDirection ('D':xs) = D $ read xs
            readDirection ('U':xs) = U $ read xs
            readDirection ('L':xs) = L $ read xs

findClosestIntersection :: [Direction] -> [Direction] -> Int
findClosestIntersection dir1 dir2 = let
    route1 = S.fromList $ moveSequence dir1 (0,0)
    route2 = S.fromList $ moveSequence dir2 (0,0)
    manhattanMetric (x,y) = (abs x) + (abs y)
    in minimum $ S.map manhattanMetric $ S.intersection route1 route2

part1 :: FilePath -> IO Int
part1 file = do
    routes <- readRouteFile file
    return $ findClosestIntersection (fst routes) (snd routes)