module Day03 (part1, part2) where

import qualified Data.List as L
import qualified Data.Set as S
import qualified Data.Map as M

-- part 1:

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

findClosestIntersection :: [Direction] -> [Direction] -> Int
findClosestIntersection dir1 dir2 = let
    route1 = S.fromList $ moveSequence dir1 (0, 0)
    route2 = S.fromList $ moveSequence dir2 (0, 0)
    manhattanMetric (x, y) = (abs x) + (abs y)
    in minimum . S.map manhattanMetric $ S.intersection route1 route2

part1 :: FilePath -> IO Int
part1 file = do
    (route1, route2) <- readRouteFile file
    return $ findClosestIntersection route1 route2

-- Part 2:

type Position' = (Int, Int, Int)

move':: Direction -> Position' -> [Position']
move' (R ds) (x, y, d) = [(x + dist, y, d + dist) | dist <- [1 .. ds]]
move' (D ds) (x, y, d) = [(x, y - dist, d + dist) | dist <- [1 .. ds]]
move' (U ds) (x, y, d) = [(x, y + dist, d + dist) | dist <- [1 .. ds]]
move' (L ds) (x, y, d) = [(x - dist, y, d + dist) | dist <- [1 .. ds]]

moveSequence':: [Direction] -> Position' -> [Position']
moveSequence' [] pos = []
moveSequence' (direction:ds) pos = let moves = move' direction pos 
    in moves ++ (moveSequence' ds (last moves))

findIntersectionWithMinimalSteps :: [Direction] -> [Direction] -> Int
findIntersectionWithMinimalSteps dir1 dir2 = let
    route1 = M.fromList $ map (\(x,y,d) -> ((x,y),d)) (moveSequence' dir1 (0, 0, 0))
    route2 = M.fromList $ map (\(x,y,d) -> ((x,y),d)) (moveSequence' dir2 (0, 0, 0))
    minimalSteps (_, x) (_, y) = compare x y
    in snd . L.minimumBy minimalSteps . M.toList $ M.intersectionWith (+) route1 route2
    
part2 :: FilePath -> IO Int
part2 file = do
    (route1, route2) <- readRouteFile file
    return $ findIntersectionWithMinimalSteps route1 route2

-- Utility:

readRouteFile :: FilePath -> IO ([Direction], [Direction])
readRouteFile file = do
    routeLines <- lines <$> readFile file 
    let routes = parseRoute <$> routeLines
    return (routes !! 0, routes !! 1)
        where 
            parseRoute str = case L.findIndex (==',') str of
                Just index -> (readDirection $ take index str):parseRoute (drop (index + 1) str)
                Nothing -> [readDirection str]
            readDirection ('R':xs) = R $ read xs
            readDirection ('D':xs) = D $ read xs
            readDirection ('U':xs) = U $ read xs
            readDirection ('L':xs) = L $ read xs