import Data.Char
type Bit = Int

bin2int :: [Bit] -> Int
-- bin2int bits = sum [w*b | (w,b) <- zip weights bits]
--         where weights = iterate (*2) 1
bin2int = foldr (\x y -> x+2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
-- encode = concat . map (make8 . int2bin . ord)
encode = concat . map (paritybits . make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
-- decode = map (chr . bin2int) . chop8
decode = map (chr . bin2int) . chop9

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

-- Added definitions
paritybits :: [Bit] -> [Bit]
paritybits x = x ++ [paritybit x]

paritybit :: [Bit] -> Bit
paritybit x = even 
        where
            even = bool2int (((sum x) `mod` 2) == 0)

bool2int :: Bool -> Int
bool2int b | b          = 0
           | otherwise  = 1

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = verify (take 9 bits) : chop9 (drop 9 bits)

verify :: [Bit] -> [Bit]
verify bits | good      = take 8 bits
            | otherwise = error "Faulty parity"
                where
                    good = lbit == paritybit (take 8 bits)
                    lbit = last bits

faulty_transmit :: String -> String
faulty_transmit = decode . faulty_channel . encode

-- faulty_channel :: [Bit] -> [Bit]
-- faulty_channel = map ((`mod` 2).(+1))

faulty_channel :: [Bit] -> [Bit]
faulty_channel = tail

