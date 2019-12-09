module Day1 (part1, part2) where

-- Part 1
part1 :: FilePath -> IO Int
part1 file = calculateFuel <$> readFile file
  where calculateFuel input = sum $ (\n -> read n `div` 3 - 2) <$> lines input

-- Part 2
part2 :: FilePath -> IO Int
part2 file = calculateFuel <$> readFile file
  where 
    calculateFuel input = sum $ evalFuel . read <$> lines input
    evalFuel mass
      | mass <= 8 = 0
      | otherwise = newMass + evalFuel newMass
        where newMass = mass `div` 3 - 2