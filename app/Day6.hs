module Day6 (part1) where

data Object = Orbit String [Object] deriving Show

findAll :: (Eq a) => a -> [(a,b)] -> [b]
findAll search = foldr (\(a,b) -> (\list -> if a == search then b:list else list)) []

parseString :: String -> (String,String)
parseString val = let (fst, snd) = span (/=')') val in (fst, tail snd)

buildOrbitTree :: [(String,String)] -> String -> Object
buildOrbitTree list val = Orbit val $ map (\p -> buildOrbitTree list p) (findAll val list)

countOrbits :: Object -> Int -> Int
countOrbits (Orbit _ objects) level = level + (sum $ map (\object -> countOrbits object (level+1)) objects)

part1 :: FilePath -> IO Int
part1 file = do
    lines <- lines <$> readFile file
    let orbits = parseString <$> lines
    let tree = buildOrbitTree orbits "COM"
    return $ countOrbits tree 0