-- 4.2 Conditional expressions
a_even :: Integral a => a -> Bool
a_even n = n `mod` 2 == 0

a_splitAt :: Int -> [a] -> ([a], [a])
a_splitAt n xs = (take n xs, drop n xs)

a_recip :: Fractional a => a -> a
a_recip n = 1/n

a_abs :: Int -> Int
a_abs n = if n >= 0 then n else -n

a_signum :: Int -> Int
a_signum n = if n < 0 then -1 else
            if n == 0 then 0 else 1

-- 4.3 Guarded expressions
b_abs n | n >= 0    = n
        | otherwise = n

b_signum n | n < 0     = -1
           | n == 0    = 0
           | otherwise = 1

-- 4.4 Pattern matching
c_not :: Bool -> Bool
c_not False = True
c_not True  = False

(&&) :: Bool -> Bool -> Bool
-- True  && True  = True
-- True  && False = False
-- False && True  = False
-- False && False = False

-- True && True = True
-- _    && _    = False

True  && b   = b
False && _   = False

-- Haskell does not permit the same name to be used for more than one argument
-- in a single equation. Thus this is not allowed:
-- b && b = b
-- _ && _ = False

-- Tuple patterns
fst :: (a,b) -> a
fst (x,_) = x

snd :: (a,b) -> b
snd (_,x) = x

-- List patterns
test :: [Char] -> Bool
test ['a',_,_] = True
test _         = False

-- 4.5 Lambda expressions
d_add :: Int -> (Int -> Int)
d_add = \x -> (\y -> x+y)

-- 4.6 Operator restrictions
(#) = \x -> (\y -> x # y)

e_sum :: [Int] -> Int
e_sum = foldl (+) 0

