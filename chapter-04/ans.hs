-- ex 1
halve :: [a] -> ([a], [a])
halve (xs) = (take n xs, drop n xs)
            where n = (length xs) `div` 2
-- ex 2
third :: [a] -> a
-- third xs = head (tail (tail xs))
-- third xs = xs !! 3
third (_:(_:(x:_))) = x

-- ex 3
safetail :: [a] -> [a]
-- safetail xs = if null xs then [] else tail xs
-- safetail xs | null xs = []
--             | otherwise = tail xs
safetail [] = []
safetail xs = tail xs

-- ex 4
(||) :: Bool -> Bool -> Bool
-- True  || True  = True
-- True  || False = True
-- False || True  = True
-- False || False = False
--
-- False || False = False
-- _     || _     = True
--
False || b = b
_     || _ = True
--
-- b || c | b == c    = b
--        | otherwise = True

-- ex 5
(&&) :: Bool -> Bool -> Bool
x && y = if x then if y then True else False else False

-- ex 7
mult :: Int -> Int -> Int -> Int
mult = \x -> (\y -> (\z -> x * y * z))

-- ex 8
luhnDouble :: Int -> Int
luhnDouble x = if a > 9 then a-9 else a
                where a = 2*x

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = sum `mod` 10 == 0
        where
                sum = aD + b + cD + d
                aD = luhnDouble a
                cD = luhnDouble c
