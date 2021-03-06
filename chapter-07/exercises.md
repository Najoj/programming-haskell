1. Show how the list comprehension of `[f x | x <- xs, p x]` can be re-expressed using the higher-order functions `map` and `filter`.

  * ```haskell
    map f (filter p xs)
    -- or
    map f . filter p xs
    ```

    Example run:

    ```
    Prelude> f = (+4)
    Prelude> p = (>3)
    Prelude> xs = [1..10]
    Prelude> [f x | x <- xs, p x]
    [8,9,10,11,12,13,14]
    Prelude> map f (filter p xs)
    [8,9,10,11,12,13,14]
    ```

2. Without looking at the definitions from the standard prelude, define the following higher-order library functions on lists

    a. Decide if all elements of a list satisfy the predicate:

    ```haskell
    all :: (a -> Bool) -> [Bool] -> Bool
    all pr xs = foldr (&&) True (map pr xs)    
    ```

    b. Decide if any element of a list satisfies a predicate:
    
    ```haskell
    any :: (a -> Bool) -> [Bool] -> Bool
    any pr xs = foldr (||) False (map pr xs)
    ```

    c. Select elements from a list while they satisfy a predicate:

    ```haskell
    takeWhile :: (a -> Bool) -> [a] -> [a]
    takeWhile  _ [] = []
    takeWhile pr (x:xs) | pr x      = x : (takeWhile pr xs)
                        | otherwise = []
    ```

    d. Remove elements from a list while they satisfy a predicate:

    ```haskell
    dropWhile :: (a -> Bool) -> [a] -> [a]
    dropWhile  _ [] = []
    dropWhile pr (x:xs) | pr x      = (dropWhile pr xs)
                        | otherwise = x : xs
    ```

    Note: in the prelude the first two of these functions are generic functions rather than being specific to the type of lists.

  * *Answers in exercise.*

3. Redefine the functions `map f` and `filter p` using `foldr`.

  * ```haskell
    map f    = foldr (\x xs -> f x : xs) []
    filter p = foldr (\x xs -> if p x then x:xs else xs) []
    ```

4. Using `foldl`, define a function `dec2int :: [Int] -> Int` that converts a decimal number into an integer. For example:

    ```
    > dec2int [2,3,4,5]
    2345
    ```

  * ```haskell
    dec2int :: [Int] -> Int
    dec2int = foldl (\x y -> 10*x + y) 0
    ```

5. Without looking at the definitions from the standard prelude, define the higher-order library function `curry` that converts a function on pairs into a curried function, and, conversely, the function `uncurry` that converts a curried function with two arguments into a function on pairs.

    Hint: first write down the types of the two functions.

  * ```haskell
    curry :: ((a,b) -> c) -> (a -> b -> c)
    curry f = \a b -> f(a,b)
    uncurry :: (a -> b -> c) -> ((a,b) -> c)
    uncurry f = \(a,b) -> f a b
    ```

6. A higher-order function `unfold` that encapsulates a simple pattern of recursion for producing a list can be defined as follows:

    ```haskell
    unfold p h t x | p x       = []
                   | otherwise = h x : unfold p h t (t x) 
    ```

    That is, the function `unfold p h t` produces the empty list if the predicate `p` is true of the argument value, and otherwise produces a non-empty list by applying the function `h` to this value to give the head, and the function `t` to produce the tail of the list. For example, the function `int2bin` can be rewritten more compactly using `unfold` as follows:

    ```haskell
    int2bin = unfold (== 0) (`mod` 2) (`div` 2)
    ```

    Redefine the functions `chop8`, `map f` and `iterate f` using `unfold`.

  * ```haskell
    chop8 :: [Bit] -> [[Bit]]
    chop8 = unfold null (take 8) (drop 8)

    map :: (a -> b) -> [a] -> [b]
    map f = unfold null (f.head) tail
    
    iterate :: (a->a) -> a -> [a]
    iterate f = unfold (\_ -> False) (\x -> x) (f)
    ```

7. Modify the binary string transmission errors using the concept of parity bits. That is, each eight-bit binary number produced during encoding is extended with a parity bit, set to one if the number contains an odd number of ones, and to zero otherwise. In turn, each resulting nine-bit binary number consumed during decoding is checked to ensure that its parity bit is correct, with the parity bit being discarded if this is the case, and a parity error being reported otherwise.

    Hint: the library function `error :: String -> a` displays the given sting as an error message and terminates the program; the polymorphic result type ensures that `error` can be used in any context.

  * See [binary-transmitter.hs](./binary-transmitter.hs)

8. Test your new string transmitter program from the previous exercise using a faulty communication channel that forgets the first bit, which can be modelled using the `tail` function on lists of bits.

  * See [binary-transmitter.hs](./binary-transmitter.hs)

9. Define a function `altMap :: (a -> b) -> (a -> b) -> [a] -> [b]` that alternately applies its two argument functions to successive elements in a list, in turn about order. For example:

    ```
    > altMap (+10) (+100) [0,1,2,3,4]
    [10,101,12,103,14]
    ```
  * ```haskell
    altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
    altMap _ _ []  = []
    altMap f s (x:xs)  = f x : altMap s f xs
    ```

10. Using `altMap`, define a function `luhn :: [Int] -> Bool` that implements the *Luhn algorithm* from the exercises in chapter 4 for bank card numbers of any length. Test your new function using your own bank card.
  * ```haskell
    luhn :: [Int] -> Bool
    luhn = (==0) . (`mod` 10) . sum . altMap
           (\x -> if 2*x > 9 then 2*x-9 else 2*x) (\x -> x)
    ```

