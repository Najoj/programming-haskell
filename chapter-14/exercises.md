1. Complete the following instance declaration from `Data.Monoid` to make a pair type into a monoid provided by the component types are monoids:

    ```haskell
    instance (Monoid a, Monoid b) => Monoid (a,b) where
    -- mempty :: (a,b)
    mempty = ...

    -- mappend :: (a,b) -> (a,b) -> (a,b)
    (x1,y1) `mappend` (x2,y2) = ...
    ```

  * ```haskell
    instance (Monoid a, Monoid b) => Monoid (a,b) where
    -- mempty :: (a,b)
    mmpty = (mempty, mempty)

    -- mappend :: (a,b) -> (a,b) -> (a,b)
    (x1,y1) `mappend` (x2,y2) = (x1 `mappend` x2, y1 `mappend` y2)
    ```

2. In a similar manner, show how a function of type `a -> b` can be made into a monoid provided that the result type `b` is a monoid.

  * ```haskell
    instance (Monoid a, Monoid b) => Monoid (a -> b) where
    -- mempty :: (a -> b)
    mempty = \_ -> mempty

    -- mappend :: (a -> b) -> (a -> b) -> (a -> b)
    f `mappend` g = \x -> (f x) `mappend` (g x)
    ```

3. Show how the `Maybe` type can be made foldable and traversable, by giving explicit definitions for `fold`, `foldMap`, `foldr`, `foldl` and `traverse`

  * ```haskell
    instance Foldable Maybe where
        -- fold :: Monoid a => Maybe a -> a
        fold (Nothing)    = mempty
        fold (Just x)     = fold x
        -- foldMap :: Monoid a => a -> Maybe a
        foldMap _ (Nothing) = Nothing
        foldMap f (Just x)  = f x
        -- foldr :: (a -> b -> b) -> b -> Maybe a -> b
        foldr f v (Nothing) = v
        foldr f v (Just x)  = foldr f v x
        -- foldl :: (a -> b -> a) -> a -> Maybe b -> a
        foldl f v (Nothing) = v
        foldl f v (Just x) = foldl f (f x) v
    
    instance Traversable Maybe where
        -- traverse :: Applicative f => (a -> f b) -> Maybe a -> f (Maybe b)
        traverse g (Nothing)    = Nothing
        traverse g (Just a)     = fmap (Just (g a))
    ```

4. In a similar manner, show how the following type of binary trees with data in their nodes can be made into a foldable and traversable type:
    
    ```haskell
    data Tree a = Leaf | Node | (Tree a) a (Tree a)
        deriving Show
    ```

  * ```haskell
    instance Foldable Tree where
        -- fold :: Monoid a => Tree a -> a
        fold Leaf           = mempty
        fold (Node l x r)   = fold l `mappend` x `mappend` fold r
        -- foldMap :: Monoid a => a -> Tree a
        foldMap _ (Leaf)        = mempty
        foldMap f (Node l x r)  = (foldMap f l) `mappend` x `mappend` (foldMap f r)
        -- foldr :: (a -> b -> b) -> b -> Tree a -> b
        foldr f v (Leaf)        = v
        foldr f v (Node l x r)  = foldr f (f x (foldr f v r)) l
        -- foldl :: (a -> b -> a) -> a -> Tree b -> a
        foldl f v (Leaf)        = v
        foldl f v (Node l x r)  = foldr f (f (foldr f v l) x) r
    
    instance Traversable Tree where
        -- traverse :: Applicative f => (a -> f b) -> Tree a -> f (Maybe b)
        traverse g (Leaf)       = Leaf
        traverse g (Node l x r) = Node (fmap g l) (g x) (fmap g r)
    ```

5. Using `foldMap`, define a generic version of the height-order function `filter` on lists that can be used with any foldable type:

    ```haskell
    filterF :: Foldable t => (a -> Bool) -> t a -> [a]
    ```

  * ```haskell
    -- Answer goes here
    ```

