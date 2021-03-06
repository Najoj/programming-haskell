import Data.Char

-- table from www, not book
table :: [Float]
table = [8.167, 1.492, 2.782, 4.253, 12.702, 2.228, 2.015, 6.094, 6.966, 0.153,
         0.772, 4.025, 2.406, 6.749, 7.507, 1.929, 0.095, 5.987, 6.327, 9.056,
         2.758, 0.978, 2.361, 0.150, 1.974, 0.074]

-- all letters
letters :: String -> Int
letters xs = length [x | x <- xs, isAlpha x]

count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

-- length of alphabet
diff = length table

-- 
let2int :: Char -> Int
let2int c | isLower c = ord c - ord 'a' + diff
          | otherwise = ord c - ord 'A'
            

int2let :: Int -> Char
int2let n | n >= diff = chr (ord 'a' + n - diff)
          | otherwise = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c | isAlpha c = int2let ((let2int c + n) `mod` (2*diff))
          | otherwise = c


encode :: Int -> String -> String 
encode n xs = [shift n x | x <- xs]

percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z'] ++ ['A'..'Z']]
        where n = letters xs

-- Cracking the cipher
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

crack :: String -> String
crack xs = encode (-factor) (xs)
        where
            factor = head (positions (minimum chitab) chitab)
            chitab = [chisqr (rotate n table') table | n <- [0..alen]]
            alen = 2*diff
            table' = freqs xs

