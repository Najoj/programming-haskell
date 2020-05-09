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
                    putStr xs

strlen :: IO ()
strlen = do putStr "Enter a string: "
            xs <- getLine
            putStr "The string has "
            putStr (show (length xs))
            putStr " characters.\n"

