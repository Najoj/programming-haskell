1. What are the types of of the following values?
```
    ['a','b','c']
    ('a','b','c')
    [(False,'0'),(True,'1')]
    ([False,True],['0','1'])
    [tail,init,reverse]
```

  *
```
    [Char]
    (Char,Char,Char)
    [(Bool,Char)]
    ([Bool],[Char])
    [[a] -> [a]]
```

2. Write down definitions that have the following types; it does not matter what the definitions actually do as long as they are type correct
```
    bools :: [Bool]
    nums :: [[Int]]
    add :: Int -> Int -> Int -> Int
    copy :: a -> (a,a)
    apply :: (a -> b) -> a -> b
```
  *
```
    bools = [True,False]
    nums = [[1,2,3],[2,3]]
    add a b c = a + b + c
    copy a = (a,a)
    apply f x = f x 
```

3. What are the types of the following functions?
```
    second xs = head (tail xs)
    swap (x,y) = (y,x)
    pair x y = (x,y)
    double x = x*2
    palindrome xs = reverse xs == xs
    twice f x = f (f x)
```
Hint: take care to include the necessary class constraints in the types if the functions are defined using overloaded operators.

  *
```
    second :: [a] -> a
    swap :: (a,b) -> (b,a)
    pair :: a -> b -> (a,b)
    double :: Num a => a -> a
    palindrome :: Eq a => [a] -> Bool
    twice :: (a -> a) -> a -> a
```

4. Check your answers to the preceding three questions using GHCi.
  * Done!

5. Why is is not feasible in general for function types to be instances of the `Eq` class? When is it feasible? Hint: two functions of the same type are equal if they always return equal results for equal arguments.
  * Two classes are equal if the return the same value for equal values. This can be hard to compare for all input values, I suppose. Could be more feasible if the input values are (very) restricted somehow, for instance with `Bool`.

