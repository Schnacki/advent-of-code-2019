module Day2 (part1, part2) where

import Data.List(find)

readProgram::String -> IO [Int]
readProgram file = (\program -> read $ "[" ++ program ++ "]") <$> readFile file

runProgram::Int -> [Int] -> [Int]
runProgram pos input = case (drop pos input)
    of  (99:xs) -> input
        (1:x:y:z:_) -> runProgram (pos + 4) $ replaceAt z input $ (+) (input !! x) (input !! y)
        (2:x:y:z:_) -> runProgram (pos + 4) $ replaceAt z input $ (*) (input !! x) (input !! y)
        (_:xs) -> input
    where 
        replaceAt pos list newVal = let (x,_:y) = splitAt pos list in (x ++ newVal:y)

-- Part 1
part1 :: IO Int
part1 = (\prg -> head $ runProgram 0 prg) <$> readProgram  "day2_input.txt"
    
-- Part 2
part2 :: IO Int
part2 = do
    intcodeProgram <- readProgram "day2_input.txt"
    let results = [(noun, verb, head $ runProgram 0 $ 1:noun:verb:(drop 3 intcodeProgram)) | noun <- [0..99], verb <- [0..99]]
    case (find (\(_,_,res)-> res == 19690720) results) of
        Just (noun,verb,_) -> return $ 100 * noun + verb
        Nothing -> error "No result found."