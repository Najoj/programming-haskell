module Chapter07 where -- hax 
import Data.Char
type Bit = Int

-- ex 03 filter p
-- filter p xs = [x | x <- xs, p x]
filter p = foldr (\x xs -> if p x then x:xs else xs) []

-- ex 4
-- 10 times the 'previous' value plus current value
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10*x + y) 0

-- ex 5
curry :: ((a,b) -> c) -> (a -> b -> c)
curry f = \a b -> f (a,b)
uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncurry f = \(a,b) -> f a b

-- ex 6
unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

int2bin = unfold (== 0) (`mod` 2) (`div` 2)

chop8 :: [Bit] -> [[Bit]]
--chop8 []   = []
--chop8 bits = take 8 bits : chop8 (drop 8 bits)
chop8 = unfold null (take 8) (drop 8)

map :: (a -> b) -> [a] -> [b]
map f = unfold null (f.head) tail

iterate :: (a->a) -> a -> [a]
iterate f = unfold (\_ -> False) (\x -> x) (f)

-- ex 9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ []  = []
altMap f _ [l] = [f l]
altMap f s ls  = f x : (s y : altMap f s z)
        where
                x = ls !! 0
                y = ls !! 1
                z = (tail.tail) ls

        {-
-- ex 10
luhn :: [Int] -> Bool
luhn number = sum `mod` 10 == 0
        where
            sum = a+b
            a = sum.altMap (luhnDouble) (\x -> x) (take 2 number)
            b = sum.altMap (luhnDouble) (\x -> x) (drop 2 (take 4 number))
--luhn a b c d = sum `mod` 10 == 0
--    where
--            sum = aD + b + cD + d
--            aD = luhnDouble a
--            cD = luhnDouble c
luhnDouble :: Int -> Int
luhnDouble x = if a > 9 then a-9 else a
                where
                    a = 2*x

-}
