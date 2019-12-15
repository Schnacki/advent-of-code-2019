module Main where

import qualified Day01
import qualified Day02
import qualified Day03
import qualified Day04
import qualified Day06
import qualified Day08
import qualified Day10

main :: IO ()
main = do
    -- Day 1
    putStrLn "Results for Day 1:"
    putStr "Part 1: "
    Day01.part1 "input/Day01.txt" >>= print
    putStr "Part 2: "
    Day01.part2 "input/Day01.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 2
    putStrLn "Results for Day 2:"
    putStr "Part 1: "
    Day02.part1 "input/Day02.txt" >>= print
    putStr "Part 2: "
    Day02.part2 "input/Day02.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 3
    putStrLn "Results for Day 3:"
    putStr "Part 1: "
    Day03.part1 "input/Day03.txt" >>= print
    putStr "Part 2: "
    Day03.part2 "input/Day03.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 4
    putStrLn "Results for Day 4:"
    putStr "Part 1: "
    Day04.part1 >>= print
    putStr "Part 2: "
    Day04.part2 >>= print
    putStrLn $ replicate 30 '#'

    -- Day 6
    putStrLn "Results for Day 6:"
    putStr "Part 1: "
    Day06.part1 "input/Day06.txt"  >>= print
    putStr "Part 2: "
    Day06.part2 "input/Day06.txt"  >>= print
    putStrLn $ replicate 30 '#'

    -- Day 8
    putStrLn "Results for Day 8:"
    putStr "Part 1: "
    Day08.part1 "input/Day08.txt" >>= print
    putStr "Part 2: "
    Day08.part2 "input/Day08.txt" >>= print
    putStrLn $ replicate 30 '#'

    -- Day 10
    putStrLn "Results for Day 10:"
    putStr "Part 1: "
    Day10.part1 "input/Day10.txt" >>= print
    putStrLn $ replicate 30 '#'
