module Day4 (part1, part2) where

import Data.List (group)

passwordRange :: [String]
passwordRange = show <$> [248345..746315]

digitsRepeat :: String -> Bool
digitsRepeat = any (> 1) . map length . group

oneDigitRepeatsTwice :: String -> Bool
oneDigitRepeatsTwice = any (== 2) . map length . group

digitsIncrease :: String -> Bool
digitsIncrease (x: x': xs) = x <= x' && digitsIncrease (x':xs)
digitsIncrease _ = True

-- Part 1:
part1 :: IO Int
part1 = return . length . filter (\pwd -> digitsIncrease pwd && digitsRepeat pwd) $ passwordRange

-- Part 2:
part2 :: IO Int
part2 = return . length . filter (\pwd -> digitsIncrease pwd && oneDigitRepeatsTwice pwd) $ passwordRange