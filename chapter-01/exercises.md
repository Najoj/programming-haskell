1. Give another possible calculation for the result `double (double 2)`.
  * ```
    double (double 2)
    = double (2 + 2)
    = (2 + 2) + (2 + 2)
    = 4 + 4
    = 8
    ```

2. Show that sum `sum [x] = x` for any number `x`.
  * ```
    sum [x]
    = x + sum []
    = x + 0
    = x
    ```

3. Define a function `product` that produces the product of a list of numbers, and show using your definition that `product [2,3,4] = 24`.
  * ```haskell
    product Num a => [a] -> a
    product []      = 1
    product (x:xs)  = x * product xs
    ```
  * ```
    product [2,3,4]
    = 2 * product [3,4]
    = 2 * (3 * product [4])
    = 2 * (3 * (4 * product []))
    = 2 * (3 * (4 * (1)))
    = 2 * (3 * (4))
    = 2 * (12)
    = 24
    ```

4. How should the definition of the function `qsort` be modified so that it produces a reverse sorted version of a list?
  * You could include `reverse` from the standard library somewhere; or
  * Switch places of `smaller` and `larger` in the 'standard' `qsort`.

5. What would be the effect of replacing `<=` by `<` in the original definition of `qsort`? Hint: consider example `qsort [2,2,3,1,1]`.
  * There would only be unique values, as those who equal to the pivot will not be included in either `smaller` or `larger`.

