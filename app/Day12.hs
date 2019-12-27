module Day12(part1, part2) where

    type Vector = (Int, Int, Int)

    applyVector :: Vector -> Vector -> Vector
    applyVector (x, y, z) (x', y', z') = let
        xRes = if x' > x then 1 else if x == x' then 0 else (-1)
        yRes = if y' > y then 1 else if y == y' then 0 else (-1)
        zRes = if z' > z then 1 else if z == z' then 0 else (-1)
        in (xRes, yRes, zRes)

    addVector :: Vector -> Vector -> Vector
    addVector (x, y, z) (x', y', z') = (x + x', y + y', z + z')
    
    applyGravity :: Vector -> [Vector] -> Vector
    applyGravity v = foldr1 addVector . map (applyVector v)

    applyGravities :: [Vector] -> [Vector] -> [Vector]
    applyGravities ps vs = zipWith addVector vs $ map (\p -> applyGravity p ps) ps

    step :: ([Vector], [Vector]) -> ([Vector], [Vector])
    step (posVec, velVec) = (pos, vel)
        where
            vel = applyGravities posVec velVec
            pos = zipWith addVector posVec vel

    calculateEnergy :: ([Vector], [Vector]) -> Int
    calculateEnergy (ps, vs) = sum $ zipWith (*) (energy <$> ps) (energy <$> vs)
        where energy (x, y, z) = abs x + abs y + abs z

    applyTimes :: Int -> (a -> a) -> a -> a
    applyTimes n f param = iterate f param !! n

    positions :: [Vector]
    positions = [(14, 15, (-2)), (17, (-3), 4), (6, 12, (-13)), ((-2), 10, (-8))]

    velocities :: [Vector]
    velocities = replicate 4 (0, 0, 0)

    part1 :: IO Int
    part1 = return $ calculateEnergy $ applyTimes 1000 step (positions, velocities)

    part2 :: IO String
    part2 = return "TODO"