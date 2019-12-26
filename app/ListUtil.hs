module ListUtil (partitionToSize) where

    partitionToSize :: Int -> [a] -> [[a]]
    partitionToSize size list = case (splitAt size list) of
        (xs,[]) -> [xs]
        (xs,ys) -> xs:(partitionToSize size ys)