1. Redefine `putStr :: String -> IO ()` using a list comprehension and the library function `sequence_ :: [IO a] -> IO ()`.

  * ```haskell
    putStr'' :: String -> IO ()
    putStr'' ss = sequence_ [ putChar s | s <- ss ]
    ```

2. Using recursion, define a version of `putBoard :: Board -> IO ()` that displays nim boards of any size, rather than being specific to boards with just five rows of stars. Hint: first define an auxiliary function that takes the current row number as an additional argument.

  * ```haskell
    putBoard :: Board -> IO ()
    putBoard b = putBoardAux 1 b
    
    putBoardAux :: Int -> Board -> IO ()
    putBoardAux _ [] = do return()
    putBoardAux n (b:bs) = do putRow n b
                              putBoardAux (n+1) bs
    ```

3. In a similar manner to the first exercise, redefine the generalised version of `putBoard` using a list comprehension and `sequence_`.

  * ```haskell
    putBoard Board -> IO ()
    putBoard b = sequence_ [ putRow i l | (i, l) <- zip [1..] b ]
    ```

4. Define an action `adder :: IO ()` that reads a given number of integers from the keyboard, one per line, and diplays their sum. For example:

          > adder
          How many numbers? 5
          1
          3
          5
          7
          9
          The total is 25

    Hint: start by defining and auxiliary function that takes the current total and how many numbers remain to be read as arguments. You will also likely need to use the library function `read` and `show`.


  * ```haskell
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
    ```

5. Redefine `adder` using the function `sequence :: [IO a] -> IO [a]` that performs a list of actions and returns a list of the resulting values.

  * ```haskell
    -- Answer goes here
    ```

6. Using `getCh`, define an action `readlLine :: IO String` that behaves in the same way as `getLine`, except that it also permits the delete key to be used to remove charachters. Hint: the delet character is `'\DEL'`, and the control character for moving the crusor back one space is `'\b'`.

  * ```haskell
    -- Answer goes here
    ```

