1. Complete the following instance declaration from `Data.Monoid` to make a pair type into a monoid provided by the component types are monoids:

    ```haskell
    instance (Monoid a, Monoid b) => Monoid (a,b) where
    -- mempty :: (a,b)
    mmpty = ...

    -- mappend :: (a,b) -> (a,b) -> (a,b)
    (x1,y1) 'mappend' (x2,y2) = ...
    ```

  * ```haskell
    -- Answer goes here
    ```

2. In a similar manner, show how a function of type `a -> b` can be made into a monoid provided that the result type `b` is a monoid.

  * ```haskell
    -- Answer goes here
    ```

3. Show how the `Maybe` type can be made foldable and traversable, by giving explicit definitions for `fold`, `foldMap`, `foldr`, `foldl` and `traverse`

  * ```haskell
    -- Answer goes here
    ```

4. In a similar manner, show how the following type of binary trees with data in their nodes can be made into a foldable and traversable type:
    
    ```haskell
    data Tree a = Leaf | Node | (Tree a) a (Tree a)
        deriving Show
    ```

  * ```haskell
    -- Answer goes here
    ```

5. Using `foldMap`, define a generic version of the height-order function `filter`on lists that can be used with any foldable type:
    ```haskell
    filterF :: Foldable t => (a -> Bool) -> t a -> [a]
    ```

  * ```haskell
    -- Answer goes here
    ```

