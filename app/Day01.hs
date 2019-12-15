module Day01 (part1, part2) where

fuelPerMass :: Int -> Int
fuelPerMass mass = mass `div` 3 - 2

-- Part 1
part1 :: FilePath -> IO Int
part1 file = calculateFuel <$> readFile file
  where calculateFuel input = sum $ fuelPerMass . read <$> lines input

-- Part 2
part2 :: FilePath -> IO Int
part2 file = calculateFuel <$> readFile file
  where calculateFuel input = sum $ evalFuel . read <$> lines input
        evalFuel mass
          | newMass <= 0 = 0
          | otherwise = newMass + evalFuel newMass
            where newMass = fuelPerMass mass