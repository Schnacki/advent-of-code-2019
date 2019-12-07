module Main where

import qualified Day1
import qualified Day2
import qualified Day3
import qualified Day4

main :: IO ()
main = do
    -- Day 1
    putStrLn "Results for Day 1:"
    putStr "Part 1: "
    Day1.part1 "input/day1.txt" >>= print
    putStr "Part 2: "
    Day1.part2 "input/day1.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 2
    putStrLn "Results for Day 2:"
    putStr "Part 1: "
    Day2.part1 "input/day2.txt" >>= print
    putStr "Part 2: "
    Day2.part2 "input/day2.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 3
    putStrLn "Results for Day 3:"
    putStr "Part 1: "
    Day3.part1 "input/day3.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 4
    putStrLn "Results for Day 4:"
    putStr "Part 1: "
    Day4.part1 >>= print
    putStr "Part 2: "
    Day4.part2 >>= print
    putStrLn $ replicate 30 '#'
