1. Redefine the combinatorial function `choices` using a list comprehension rather than using composition, `concat` and `map`.

  * ```haskell
    choices :: [a] -> [[a]]
    choices l = [x | s <- subs l,
                     x <- perms s]
    ```

2. Define a recursive function `isChoice :: Eq a => [a] -> [a] -> Bool` that decides if one list is chosen from another, without using the combinatorial functions `perms` and `subs`. Hint: start by defining a function that removes the first occurrence of a value from a list.

  * ```haskell
    remove :: Eq a => a -> [a] -> [a]
    remove x []                 = []
    remove x (y:ys) | x == y    = ys
                    | otherwise = y : remove x ys

    isChoice :: Eq a => [a] -> [a] -> Bool
    isChoice [] _       = True
    isChoice (_x:[]) [] = False
    isChoice (x:la) lb  = elem x lb && isChoice la (remove x lb) 
    ```

3. What effect would generalising the function `split` to also return pairs containing  the empty list have on the behaviour of `solutions`?

  * `exprs` uses `split` to make tuple. If the any of the elemnts in this tuple were empty, then `exprs` on this empty list would generate an empty list which then would be fed into `combine` (or `combine'`). `combine` does not accept lists as its input and would hence cause error. 

4. Using the functions `choices`, `exprs`, and `eval`, verify that there are 33,665,406 possible expressions over the numbers 1, 3, 7, 10, 25, 50, and that only 4,672,540 of these expressions evaluate successfully.

  * ```haskell
    > let input = [1,3,7,10,25,50]
    > length [e | ns' <- choices input, e <- exprs ns']
    33665406
    > length [i | ns' <- choices input, e <- exprs ns', i <- eval e]
    245644
    > -- not expectied ... -_-
    > -- ok with the less good valid
    > length [i | ns' <- choices input, e <- exprs ns', i <- eval e]
    4672540
    ```

5. Similarly, verify that the number of expressions that evaluate successfully increases to 10,839,369 if the numeric domain is generalised to arbitrary integers. Hint: modify the definition of `valid`.

  * ```haskell
    -- Answer goes here
    ```

6. Modify the final program to:

   a. allow the use of exponentiation in expressions;

   b. produce the nearest solutions if no exact solution is possible;

   c. order the solutions using a suitable measure of simplicity.

  * ```haskell
    -- Answer goes here
    ```
