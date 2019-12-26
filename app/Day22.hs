module Day22 (part1, part2) where

    import ListUtil(partitionToSize)
    import Data.List (transpose, stripPrefix, findIndex)
    import Data.Maybe (catMaybes)

    type Stack = [Int]

    data Shuffle = Deal | Cut Int | DealWithIncrement Int deriving Show

    shuffle :: Stack -> Shuffle -> Stack
    shuffle stack Deal = reverse stack
    shuffle stack (Cut n) = let (top, bottom) = splitAt index stack in bottom ++ top
        where index = if n >= 0 then n else length stack + n
    -- really ugly, but it works...
    shuffle stack (DealWithIncrement inc) = concatMap catMaybes . transpose . partitionToSize (length stack) $ stack >>= (\l -> (Just l) : (replicate (inc - 1) Nothing))

    parseLine :: String -> Shuffle
    parseLine string
        | Just cut <- stripPrefix "cut " string = Cut $ read cut
        | Just inc <- stripPrefix "deal with increment " string = DealWithIncrement $ read inc
        | otherwise = Deal

    part1 :: FilePath -> IO Int
    part1 path = do
        lines <- lines <$> readFile path
        let shuffledStack = foldl shuffle [0..10006] (parseLine <$> lines)
        let Just result = findIndex ( == 2019) shuffledStack
        return $ result

    part2 :: FilePath -> IO String
    part2 path = return "TODO"