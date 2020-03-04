1. Using a list comprehension, give an expression that calculates the sum 1<sup>2</sup> + 2<sup>2</sup> + ... 100<sup>2</sup> of the first one hundered integer squares.
  * Answer goes here

2. Suppose that a *coordinate grid* of size *m × n* is given by the list of all pairs *(x,y)* of integers such that *0 <p>&le;</p> x ≤ m* and *0 ≤ y ≤ n*. Using a list comprehennsion, define a function `grid :: Int -> Int -> [(Int,Int)]` that returns a coordinate grid of a given size. For example:
```
    > grid 1 2
    [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
```
  * Answer goes here

3. Using list comprehension and the function `grid` above, define a function `square :: Int -> [(Int,Int)]` that returns a coordinate square of size *n*, excluding the diagonal from *(0,0)* to *(n,n)*. For example:
```
    > square 2
    [(0,1),(0,2),(1,0),(2,0),(2,1)]
```
  * Answer goes here

4. In a similar way to the function `length`, show how the library function `replicate :: Int -> a -> [a]` that produces a list of identical elements can be defined using list comprehension. For example:
```
    > replicate 3 True
    [True,True,True]
```

  * Answer goes here

5. A triple *(x,y,z)* of positive integers is *Pythogorean* if it satisfies the equation *x² + y² = z²*. Using list comprehension with three generators, define a function `pyths :: Int -> [(Int,Int,Int)]` that returns the list of all such lest whose components are at most a given limit. For example:
```
    > pyths 10
    [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
```

  * Answer goes here

6. A positive number is *perfect* if it equals the sum of all of its factors, excluding the number itself. Using a list comprehension and the function `factors`, define a function `perfects :: Int -> [Int]` that returns the list of all perfect numbers up to a given limit. For example:
```
    > perfects 500
    [6,28,496]
```

  * Answer goes here



7. Show how the list of comprehensions `[(x,y) | x <- [1,2], y <- [3,4]]` with two generators can be re-ecpressed using two comprehensions with single generators. Hint: nest one comprehension within the other and make use of the library function `cancat :: [[a]] -> [a]`

  * Answer goes here

8. Redefine thu function `positions` using the function `find`.

  * Answer goes here

9. The `scalar product` of two lists of integers *xs* and *ys* of length *n* is given by the sum of the products of correspending integers:
   ![equation](http://www.sciweavers.org/tex2img.php?eq=%20%5Csum_%7Bi%3D0%7D%5E%7Bn-1%7D%20%7B%28xs_i%20%20%5Cast%20ys_i%20%29%7D&bc=White&fc=Black&im=png&fs=12&ff=modern&edit=0)

   In a similar manner to `chisqr`, show how a list comprehension can be used to define a function `scalarproduct :: [Int] -> [Int] -> Int` that returns the scalar of two lists. For example:
   ```
   > scalarproduct [1,2,3] [4,5,6]
   32
   ```

  * Answer goes here

10. Modify the Caesar cipher program to also handle upper-case letters.
  * Answer goes here
