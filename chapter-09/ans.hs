module Chapter09 where

remove :: Eq a => a -> [a] -> [a]
remove x []                 = []
remove x (y:ys) | x == y    = ys
                | otherwise = y : remove x ys

isChoice :: Eq a => [a] -> [a] -> Bool
isChoice [] _       = True
isChoice (_x:[]) [] = False
isChoice (x:la) lb  = elem x lb && isChoice la (remove x lb) 
