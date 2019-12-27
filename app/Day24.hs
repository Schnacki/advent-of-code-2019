module Day24 (part1, part2) where

    import Data.Ix

    data Tile = Bug | Empty deriving Eq
    type Layout = [Tile]
    type Position = (Int, Int)

    layoutRange :: (Position, Position)
    layoutRange = ((0, 0), (4, 4))

    tileAtPosition :: Layout -> Position -> Tile
    tileAtPosition layout (x, y) = layout !! (5 * x + y)

    adjacentPositions :: Position -> [Position]
    adjacentPositions (x, y) = filter (inRange layoutRange) [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]

    countAdjacentBugs :: Layout -> Position -> Int
    countAdjacentBugs layout = length . filter ((==) Bug) . fmap (tileAtPosition layout) . adjacentPositions

    step :: Layout -> Position -> Tile
    step layout pos = case tileAtPosition layout pos of
        Bug -> if adjacentBugs == 1 then Bug else Empty
        Empty -> if adjacentBugs == 1 || adjacentBugs == 2 then Bug else Empty
        where adjacentBugs = countAdjacentBugs layout pos
    
    nextGeneration :: Layout -> Layout
    nextGeneration layout = map (step layout) . range $ layoutRange

    findRepeatingLayout :: Layout -> [Layout] -> Layout
    findRepeatingLayout layout oldLayouts 
        | nextLayout `elem` oldLayouts = nextLayout 
        | otherwise =  findRepeatingLayout nextLayout (layout: oldLayouts)
            where nextLayout = nextGeneration layout

    calculateBioDiversity :: Layout -> Int
    calculateBioDiversity = sum . map (\(i, t) -> if t == Bug then 2 ^ i else 0) . zip [0 ..]

    readLayout :: [String] -> Layout
    readLayout = let 
        parse '#' = Bug
        parse _ = Empty 
        in map parse . concat
                
    part1 :: FilePath -> IO Int
    part1 path = do
        layout <- (readLayout . lines) <$> readFile path
        let repeatingLayout = findRepeatingLayout layout []
        return $ calculateBioDiversity repeatingLayout

    part2 :: FilePath -> IO String
    part2 path = return "TODO"