1. Redefine `putStr :: String -> IO ()` using a list comprehension and the library function `sequence_ :: [IO a] -> IO ()`.

  * ```haskell
    -- Answer goes here
    ```

2. Using recursion, define a version of `putBoard :: Board -> IO ()` that displays nim boards of any size, rather than being specific to boards with just five rows of stars. Hint: first define an auxiliary function that takes the current row number as an additional argument.

  * ```haskell
    -- Answer goes here
    ```

3. In a similar manner to the first exercise, redefine the generalised version of `putBoard` using a list comprehension and `sequence_`.

  * ```haskell
    -- Answer goes here
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
    -- Answer goes here
    ```

5. Redefine `adder` using the function `sequence :: [IO a] -> IO [a]` that performs a list of actions and returns a list of the resulting values.

  * ```haskell
    -- Answer goes here
    ```

6. Using `getCh`, define an action `readlLine :: IO String` that behaves in the same way as `getLine`, except that it also permits the delete key to be used to remove charachters. Hint: the delet character is `'\DEL'`, and the control character for moving the crusor back one space is `'\b'`.

  * ```haskell
    -- Answer goes here
    ```

