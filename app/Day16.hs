module Day16 (part1, part2) where

    import Data.Char(digitToInt, intToDigit)

    patternForElement :: Int -> [Int]
    patternForElement i = tail . cycle $ [0, 1, 0, (-1)] >>= replicate i
    
    phase :: [Int] -> [Int]
    phase input = (\i -> (lastDigit . sum $ (zipWith (*) input (patternForElement i)))) <$> [1..length input]
        where lastDigit i = abs i `mod` 10

    runNPhases :: Int -> String -> String
    runNPhases n input = map intToDigit . take 8 $ iterate phase (digitToInt <$> input)  !! n
    
    part1 :: FilePath -> IO String
    part1 path = (runNPhases 100) <$> readFile path

    part2 :: FilePath -> IO String
    part2 path = return "TODO"