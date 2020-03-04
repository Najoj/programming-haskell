1. Using library functions, define a function `halve :: [a] -> ([a],[a])` that splits an even-lengthed list into two halves. For example:

```
  > halve [1,2,3,4,5,6]
  ([1,2,3], [4,5,6])
```

  * ```haskell
    halve :: [a] -> ([a], [a])
    halve xs = (take n xs, drop n xs)
        where
            n = (length xs) `div` 2
    ```

2. Define a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using:
  a. `head` and `tail`;
  a. list indexing `!!`;
  a. pattern matching.

  * ```haskell
    -- with head and tail
    third :: [a] -> a
    third xs = head (tail (tail xs))
    -- list indexing
    third :: [a] -> a
    third xs = xs !! 2
    -- pattern matching a
    third :: [a] -> a
    third (_:(_:(x:_))) = x
    -- pattern matching b
    third :: [a] -> a
    third (_:_:x:_) = x
    ```

3. Consider a function `safetail :: [a] -> [a]` that behaves in the same way  as `tail` except that it maps the empty list to itself rather than producing an error. Using `tail` and the function `null :: [a] -> Bool` that decides if a list is empty or not, define `safetail` using:
  a. a conditional expression;
  a. guarded equations;
  a. pattern matching.

  * ```haskell
    -- conditional expression
    safetail :: [a] -> [a]
    safetail xs = if null xs then [] else tail xs
    -- guarded equations
    safetail :: [a] -> [a]
    safetail xs | null xs   = []
                | otherwise = tail xs
    -- pattern matching
    safetail :: [a] -> [a]
    safetail [] = []
    safetail xs = tail xs
    ```


4. In a similar way to `&&` in section 4.4, show how the disjunction operator `||` can be defined in four different ways using pattern matching.
  * ```haskell
    -- first
    (||) :: Bool -> Bool -> Bool
    True  || True  = True
    True  || False = True
    False || True  = True
    False || False = False
    -- second
    (||) :: Bool -> Bool -> Bool
    False || False = False
    _     || _     = True
    -- third
    (||) :: Bool -> Bool -> Bool
    False || b     = b
    True  || _     = False
    -- fourth
    b || c | b == c    = b
           | otherwise = True
    ```

5. Without using any other library functions or operators, show how the meaning of the following pattern matching definition for logical conjunction `&&` can be formalised using conditional expressions:
```
  True && True = True
  _    && _    = False
```
Hint: use two nested conditional expressions.

  * ```haskell
    (&&) :: Bool -> Bool -> Bool
    x && y | if x then if y then True else False else False
    ```

6. Do the same for the following alternative definition, and note the difference in the number of conditional expressions that are required:
```
  True  && b = b
  False && _ = False
```
  * ```haskell
    (&&) :: Bool -> Bool -> Bool
    x && b | if x then b else False
    ```

7. Show how the meaning of the following curried function definition can be formalised in terms of lambda expressions:
```
  mult :: Int -> Int -> Int -> Int
  mult x y z = x*y*z
```
  * ```haskell
    mult :: Int -> Int -> Int -> Int
    mult = \x -> (\y -> (\z -> x * y * z))
    ```

8. The _Luhn algorithm_ is used to check bank card numbers for simple errors such as mistyping a digit, and proceeds as follows:
  * consider each digit  as a separate number;
  * moving left, double every other number from the second last;
  * subtract 9 from each number that is now greater than 9;
  * add all the resulting numbers together;
  * if the total is divisible by 10, the card number is valid.

Define a function `luhnDouble :: Int -> Int` that doubles a digit and subtracts `9` if the result is greater than `9`.
```
  > luhnDouble 3
  6
  > luhnDouble 6
  3
```
Using `luhnDouble` and the integer remainder function `mod`, define a function `luhn :: Int -> Int -> Int -> Int -> Bool` that decides if a four-digit bank card number is valid. For example:
```
  > luhn 1 7 8 4
  True
  > luhn 4 7 8 3
  False
```
In the exercises for chapter 7 we will consider a more general version of this function that accepts card numbers of any length.

  * ```haskell
    luhnDouble :: Int -> Int
    luhnDouble = if a > 9 then a-9 else a
                 where
                    a = 2*x

    luhn :: Int -> Int -> Int -> Int
    luhn = iSum `mod` 10 == 0
           where
             iSum = aDouble + b + cDouble + d
             aDouble = luhnDouble a
             cDouble = luhnDouble c
    ```

