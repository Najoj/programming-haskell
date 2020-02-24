1. What are the types of of the following values?
```
    ['a','b','c']
    ('a','b','c')
    [(False,'0'),(True,'1')]
    ([False,True],['0','1'])
    [tail,init,reverse]
```

  * Answer goes here

2. Write down definitions that have the following types; it does not matter what the definitions actually do as long as they are type correct
```
    bools :: [Bool]
    nums :: [[Int]]
    add :: Int -> Int -> Int -> Int
    copy :: a -> a,a
    apply :: (a -> b) -> a -> b
```
  * Answer goes here

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

  * Answer goes here

4. Check your answers to the preceding three questions using GHCi.
  * Answer goes here

5. Why is is not feasible in general for function types to be instances of the `Eq` class? When is it feasible? Hint: two functions of the same type are equal if they always return equal results for equal arguments.
  * Answer goes here

