module Main where

import qualified Day01
import qualified Day02
import qualified Day03
import qualified Day04
import qualified Day06
import qualified Day08
import qualified Day10
import qualified Day12
import qualified Day16
import qualified Day22
import qualified Day24

printResultsForDay:: (Show a, Show b) => Int -> a -> b -> IO ()
printResultsForDay day part1 part2 = do
    putStrLn $ "Results for Day " ++ (show day) ++ ":"
    putStr "Part 1: "
    print part1
    putStr "Part 2: "
    print part2
    putStrLn $ replicate 30 '#'

main :: IO ()
main = do
    -- Day 1
    res01_1 <- Day01.part1 "input/Day01.txt"
    res01_2 <- Day01.part2 "input/Day01.txt"
    printResultsForDay 1 res01_1 res01_2
   
    -- Day 2
    res02_1 <- Day02.part1 "input/Day02.txt"
    res02_2 <- Day02.part2 "input/Day02.txt"
    printResultsForDay 2 res02_1 res02_2
   
    -- Day 3
    res03_1 <- Day03.part1 "input/Day03.txt"
    res03_2 <- Day03.part2 "input/Day03.txt"
    printResultsForDay 3 res03_1 res03_2

    -- Day 4
    res04_1 <- Day04.part1
    res04_2 <- Day04.part2
    printResultsForDay 4 res04_1 res04_2

    -- Day 6
    res06_1 <- Day06.part1 "input/Day06.txt"
    res06_2 <- Day06.part2 "input/Day06.txt"
    printResultsForDay 6 res06_1 res06_2

    -- Day 8
    res08_1 <- Day08.part1 "input/Day08.txt"
    res08_2 <- Day08.part2 "input/Day08.txt"
    printResultsForDay 8 res08_1 res08_2

    -- Day 10
    res10_1 <- Day10.part1 "input/Day10.txt"
    res10_2 <- Day10.part2 "input/Day10.txt"
    printResultsForDay 10 res10_1 res10_2

    -- Day 12
    res12_1 <- Day12.part1
    res12_2 <- Day12.part2
    printResultsForDay 12 res12_1 res12_2

    -- Day 16
    res16_1 <- Day16.part1 "input/Day16.txt"
    res16_2 <- Day16.part2 "input/Day16.txt"
    printResultsForDay 16 res16_1 res16_2

    -- Day 22
    res22_1 <- Day22.part1 "input/Day22.txt"
    res22_2 <- Day22.part2 "input/Day22.txt"
    printResultsForDay 22 res22_1 res22_2

    -- Day 24
    res24_1 <- Day24.part1 "input/Day24.txt"
    res24_2 <- Day24.part2 "input/Day24.txt"
    printResultsForDay 24 res24_1 res24_2