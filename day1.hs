module Day1 (part1, part2) where

-- Part 1
part1 :: IO Int
part1 = calculateFuel <$> readFile "day1_input.txt"
  where calculateFuel input = sum $ (\n -> n `div` 3 - 2) . read <$> lines input

-- Part 2
part2 :: IO Int
part2 = calculateFuel <$> readFile "day1_input.txt"
  where 
    calculateFuel input = sum $ evalFuel . read <$> lines input
    evalFuel mass
      | mass <= 8 = 0
      | otherwise = newMass + evalFuel newMass
        where newMass = mass `div` 3 - 2