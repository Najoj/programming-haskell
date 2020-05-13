import Data.Char

act :: IO (Char, Char)
act = do x <- getChar
         getChar    -- meant to read space
         y <- getChar
         return (x,y)

{-
a :: IO (Char)
a = do getChar
       getChar
-}

getLine' :: IO String
getLine' = do x <- getChar
              if x == '\n' then
                 return []
              else
                 do xs <- getLine'
                    return (x:xs)

putStr' :: String -> IO ()
putStr' []     = return ()
putStr' (x:xs) = do putChar x
                    putStr' xs

strlen :: IO ()
strlen = do putStr' "Enter a string: "
            xs <- getLine
            putStr' "The string has "
            putStr' (show (length xs))
            putStr' " characters.\n"

-- ex 1
putStr'' :: String -> IO ()
putStr'' ss = sequence_ [ putChar s | s <- ss ]

-- ex 4
adder :: IO ()
adder = do
        numberOfNumbers <- getDigit "Number of numbers: "
        sum <- (readNumbers numberOfNumbers)
        putStr "The total is: "
        print sum
        return()

readNumbers :: Int -> IO Int
readNumbers n = readNumbers' n []

readNumbers' :: Int -> [Int] -> IO Int
readNumbers' 0 l  = return(sum l)
readNumbers' n l  = do number <- getDigit ": "
                       readNumbers' (n-1) (number:l)


getDigit :: String -> IO Int
getDigit prompt = do putStr prompt
                     x <- getChar
                     newline
                     if isDigit x then
                        return (digitToInt x)
                     else
                        do putStrLn "ERROR: Invalid digit"
                           getDigit prompt

newline :: IO ()
newline = putChar '\n'

-- ex 5
