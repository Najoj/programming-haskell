1. How does the recursion version of the factorial function behave if applied to a negative argument, such as `(-1)`? Modify the definition to prohibit negative arguments by adding a guard to the recursive case.
  * It will cause a stack overflow, as it never reaches the case of *n=0*. A fix:
    ```haskell
    fac :: Int -> Int
    fac n | n == 0    = 1
          | n >  0    = n * fac (n-1)
          | otherwise = 0   -- I suppose this line can be omitted
    ```

2. Define a recursive function `sumdown :: Int -> Int` that returns the sum of the non-negative integers from a given value down to zero. For example `sumdown 3` should return the result `3+2+1+0 = 6`.
  * ```haskell
    sumdown :: Int -> Int
    sumdown 0 = 0
    sumdown n = n + sumdown (n-1)
    ```

3. Define the exponential operator `^` for non-negative integers using the same pattern of recursion as the multiplication operator `*`, and show how the expression `2 ^ 3` is evaluated.
  * ```haskell
    (^) :: Int -> Int -> Int
    (^) _ 0 = 1
    (^) b e = b * b*(n-1)
    ```
    ```
    Execution:
      2^3 =
    = 2 * 2^2
    = 2 * (2 * 2^1)
    = 2 * (2 * (2 * 2^0))
    = 2 * (2 * (2 * (1)))
    = 2 * (2 * (2))
    = 2 * (4)
    = 8 
    ```

4. Define a recursive function `euclid :: Int -> Int -> Int` that implements *Euclid's algorithm* for calculating the greatest common divisor of two non-negative integers: if the two number are equal, this number is the result; otherwise the smaller number is subtracted from the larger, and the same process is then repeated. For example:
    ```
    > euclid 6 27
    3
    ```
  * ```haskell
    euclid :: Int -> Int -> Int
    euclid n m | n == m = n
               | n > m  = euclid (n-m) m
               | otherwise  = euclid n (m-n)
        --- or | otherwise  = euclid m n
    ```

5. Using the recursive definitions given in this chapter, show how `length [1,2,3]`, `drop 3 [1,2,3,4,5]`, and `init [1,2,3]` are evaluated.
  * ```
      length [1,2,3]
    = 1 + length [2,3]
    = 1 + (1 + length [3])
    = 1 + (1 + (1 + length []))
    = 1 + (1 + (1 + (0)))
    = 1 + (1 + (1))
    = 1 + (2)
    = 3
      drop 3 [1,2,3,4,5]
    = drop 2 [2,3,4,5]
    = drop 1 [3,4,5]
    = drop 0 [4,5]
    = [4,5]
      init [1,2,3]
    = 1 : init [2,3]
    = 1 : 2 : init [3]
    = 1 : 2 : []
    = 1 : [2]
    = [1,2]
    ```

6. Without looking at the definitions from the standard prelude, define the following library functions on lists using recursion.

    a. Decide if all logical values in the list are `True`:

    ```haskell
    and :: [Bool] -> Bool
    and []        = True
    and (False:_) = False
    and (_:bs)    = and bs
    ```

    b. Concatenate a list of lists: 

    ```haskell
    concat :: [[a]] -> [a]
    concat [] = []
    concat (l:ls) = l ++ concat ls
    ```

    c. Produce a list with `n` identical elements:

    ```haskell
    replicate :: Int -> a -> [a]
    replicate 0 _ = []
    replicate n t = t : replicate (n-1) t
    ```

    d. Select the `n`th element of a list:

    ```haskell
    (!!) :: [a] -> Int -> a
    (!!) 0 (x:__) = x
    (!!) n (_:xs) = (!!) (n-1) xs
    ```

    e. Decide if a value is an element of a list:

    ```haskell
    elem :: Eq a => a -> [a] -> Bool
    elem _ []      = False
    elem e' (e:es) = if e' == e then True else elem e' es
    ```

   Note: most of these functions are defined in the prelude using other library functions rather than using explicit recursion, and are generic functions rather than being specified to the type of lists.
  * *Answers are in the question*
  
  7. Define a recursive function `merge :: Ord a => [a] -> [a] -> [a]` that merges two sorted lists to give a single sorted list. For example:

    ```
    > merge [2,5,6] [1,3,4]
    [1,2,3,4,5,6]
    ```
  * ```haskell
    merge :: Ord a => [a] -> [a] -> [a]
    merge [] bs = bs
    merge as [] = as
    merge (a:as) (b:bs) | a < b     = a : merge as (b:bs)
                        | otherwise = b : merge (a:as) bs
    ```

8. Using `merge`, define a function `msort :: Ord a => [a] -> [a] -> [a]` that implements *merge sort*, in which the empty list and singleton lists are already sorted by merging together the two lists that result from sorting the two halves of the list separately.

   Hint: first define a function `halve :: [a] -> ([a],[a])` that splits a list into two halves whose lengths differ by at most one.
  * ```haskell
    msort :: Ord a => [a] -> [a]
    msort []  = []
    msort [a] = [a]
    msort as  = merge (msort left) (msort right)
                where
                    (left,right) = halve as
    ```

9. Using the five-step process, construct the library functions that:

    a. calculate the `sum` of a list of numbers;

    b. `take` a given number of elements from the start of a list;

    c. select the `last` element of a non-empty list.

  * See steps and results in [ans.hs](./ans.hs)

