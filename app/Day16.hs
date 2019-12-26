module Day16 (part1, part2,patternForElement) where

    import Data.Char(digitToInt, intToDigit)

    patternForElement :: Int -> [Int]
    patternForElement i = tail . cycle $ [0, 1, 0, (-1)] >>= replicate i
    
    phase :: [Int] -> [Int]
    phase input = (\i -> lastDigit . sum . zipWith (*) input $ patternForElement i) <$> [1 .. (length input)]
        where lastDigit i = abs i `mod` 10

    runNPhases :: Int -> String -> String
    runNPhases n = map intToDigit . take 8 . applyN n phase . map digitToInt
        where
            applyN 0 f = id
            applyN n f = (applyN (n-1) f) . f
    
    part1 :: FilePath -> IO String
    part1 path = (runNPhases 100) <$> readFile path

    part2 :: FilePath -> IO String
    part2 path = return "TODO"