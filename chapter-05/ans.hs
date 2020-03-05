-- ex2
grid :: Int -> Int -> [(Int,Int)]
grid a b = [(x,y) | x <- [0..a], y <- [0..b]]

-- ex3
square :: Int -> [(Int, Int)]
square x = [(a,b) | (a,b) <- grid x x, a /= b]

-- ex4
replicate :: Int -> a -> [a]
replicate n t = [t | _ <- [1..n]]

-- ex5
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | x <- [1..n],
                     y <- [1..n],
                     z <- [1..n],
                     x^2 + y^2 == z^2]

-- ex6
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n],
                  sum (init (factors x)) == x]

-- ex7
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

ex7 = Main.concat [f 3, f 4]
f n = [(x,n) | x <- [1,2]]

-- ex8
find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k' == k]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..])

-- ex9
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x*y | (x,y) <- zip xs ys]

