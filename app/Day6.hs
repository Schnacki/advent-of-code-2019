module Day6 (part1) where

import Data.List(find)

data Object = Orbit String [Object] deriving (Show, Eq)

findAll :: (Eq a) => a -> [(a,b)] -> [b]
findAll search = foldr (\(a,b) -> (\list -> if a == search then b:list else list)) []

parseString :: String -> (String,String)
parseString val = let (fst, snd) = span (/=')') val in (fst, tail snd)

buildOrbitTree :: [(String,String)] -> String -> Object
buildOrbitTree list val = Orbit val $ map (\p -> buildOrbitTree list p) (findAll val list)

countOrbits :: Object -> Int -> Int
countOrbits (Orbit _ objects) level = level + (sum $ map (\object -> countOrbits object (level+1)) objects)

generateObjectTreeFromFile :: String -> FilePath -> IO Object
generateObjectTreeFromFile root file = do
    lines <- lines <$> readFile file
    return $ buildOrbitTree (parseString <$> lines) root

part1 :: FilePath -> IO Int
part1 file = do
    tree <- generateObjectTreeFromFile "COM" file
    return $ countOrbits tree 0

    
findPathToObject :: String -> Object -> [String]
findPathToObject name object@(Orbit n objects)
    | name == n = [n]
    | otherwise = case (find ((/=) []) $ map (findPathToObject name) objects) of
        Nothing -> []
        Just l -> n:l