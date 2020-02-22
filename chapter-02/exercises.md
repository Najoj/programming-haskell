1. Work through the examples from this chapter using GHCi.
  * Done!

2. Parenthesise the following numeric expressions:

    `2^3*4`

    `2*3+4*5`

    `2+3*4^5`

  *
```haskell
(2^3)*4
(2*3)+(4*5)
2+(3*(4^5))
  ```

3. The script below contains three syntactic errors. Correct these errors and then chick that your script works properly using GHCi.
```haskell
        N = a 'div' length xs
            where
               a = 10
              xs = [1,2,3,4,5]
```
  *
  ```haskell
-- 1. Functions cannot start with capital letter
-- 2. Need to have back quotes with div
-- 3. where clause needs to be indented properly
n = a `div` length xs 
    where
       a = 10
       xs = [1,2,3,4,5]
```

4. The library function `last` selects the last element of a non-empty list; for example, `last [1,2,3,4,5] = 5`. Show how the function `last` could be defined in terms of the other library functions introduced in this chapter. Can you think of another possible definition?
  *
  ```haskell
  -- first
  last xs = head (reverse x)
  -- second
  last xs = xs !! x
            where
              x = (length xs) - 1
  ```

5. The library function `init` removes the last element from a non-empty list; for example, `init [1,2,3,4,5] = [1,2,3,4]`. Show how `init` could similarly be defined in two different ways.
  *
  ```haskell
  -- first
  init xs = reverse (tail (reverse xs))
  -- second
  init xs = take x xs
            where
              x = (length xs) - 1
  ```

