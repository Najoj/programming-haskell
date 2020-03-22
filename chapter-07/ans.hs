module Chapter07 where -- hax 

-- ex 03 filter p
-- filter p xs = [x | x <- xs, p x]
filter p = foldr (\x xs -> if p x then x:xs else xs) []

-- ex 4
-- 10 times the 'previous' value plus current value
dec2int = foldl (\x y = 10*x + y) 0

