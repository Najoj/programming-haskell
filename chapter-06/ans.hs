module Chapter06 where -- hax 
        -- ex1
fac :: Int -> Int
fac n | n == 0 = 1
      | n > 0  = n * fac (n-1)
      | otherwise = 0

-- ex2
-- does not manage negative integers
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n-1)

-- ex3
-- does not manage negative integers
(^) :: Int -> Int -> Int
(^) _ 0 = 1
(^) b n = b * (Chapter06.^) b (n-1)

-- ex4
euclid :: Int -> Int -> Int
euclid n m | n == m    = n
           | n > m     = euclid (n-m) m
           | otherwise = euclid m n
-- ex6a
and :: [Bool] -> Bool
and []       = True
and (False:_) = False
and (_:bs)   = Chapter06.and bs
-- ex06b
concat :: [[a]] -> [a]
concat [] = []
concat (l:ls) = l ++ Chapter06.concat ls
-- ex06c
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n t = t : Chapter06.replicate (n-1) t
-- ex06d
(!!) :: Int -> [a] -> a
(!!) 0 (x:__) = x
(!!) n (_:xs) = (Chapter06.!!) (n-1) xs
-- ex06e
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem e' (e:es) = if e == e' then True else Chapter06.elem e' es

-- ex07
merge :: Ord a => [a] -> [a] -> [a]
merge as [] = as
merge [] bs = bs
merge (a:as) (b:bs) | a < b     = a : merge as (b:bs)
                    | otherwise = b : merge (a:as) bs
-- ex08
msort :: Ord a => [a] -> [a]
msort []  = []
msort [a] = [a]
msort as  = merge (msort left) (msort right)
            where (left, right) = halve as
halve :: [a] -> ([a], [a])
halve xs = (Prelude.take n xs, drop n xs)
          where
                n = (length xs) `div` 2

-- ex09a
-- calculate the sum of a list of numbers
sum :: Num a => [a] -> a            -- step 1
-- sum (x:xs) =                     -- step 2
-- sum (x:xs) | null == 0           -- step 3
--            | otherwise
-- sum (x:xs) | null xs   = x       -- step 4
--            | otherwise = x + sum xs
sum []     = 0                      -- step 5
sum (x:xs) = x + Chapter06.sum xs
-- ex09b
-- take a given number of elements from the start of a list
take :: Int -> [a] -> [a]           -- step 1
-- take n (x:xs) =                  -- step 2
-- take n (x:xs) | x == 0           -- step 3
--               | null xs
--               | otherwise
-- take n (x:xs) | x == 0    = xs   -- step 4
--               | null xs   = xs
--               | otherwise = take (n-1) xs
take 0 xs     = xs                  -- step 5
take _ []     = []
take n (_:xs) = Chapter06.take (n-1) xs
-- ex09c
-- select the last element of a non-empty list
last :: [a] -> a                    -- step 1
-- last (x:xs) =                    -- step 2 
-- last (x:xs) | null xs   = x      -- step 3
--             | otherwise = last xs
-- last (x:xs) | null xs   = x      -- step 4
--             | otherwise = last xs
last (x:[]) = x
last (_:xs) = Chapter06.last xs
