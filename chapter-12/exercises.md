1. Define an instance of the `Functor` class for the following type of binary trees that have data in their nodes:

    ```haskell
    data Tree a = Leaf | Node (Tree a) a (Tree a)
                  deriving Show
    ```

  * ```haskell
    instance Functor Tree where
        -- fmap :: (a -> b) -> Tree a -> Tree b
        fmap _ Leaf = Leaf
        fmap f (Node left val right) = Node (fmap f left) (f val) (fmap f right)
    ```
    

2. Complete the following instance declaration to make the partially-applied function of type `(a ->)` into the functor:

    ```haskell
    instance Functor ((->) a) where
        ...
    ```

    Hint: first write down the type of `fmap`, and then think if you already know a library function that has this type.

  * ```haskell
    -- Answer goes here
    ```

3. Define an instance of the `Applicative` class for the type `(a ->)`. If you are familiar with combinatory logic,o you might recognise `pure` and `<*>` for this type as being the well-known *K* and *S* combinators.

  * ```haskell
    -- Answer goes here
    ```

4. There may be more than one way to make the parameterised type into an applicative functor. For example, the library `Control.Applicative` provides an alternative 'zippy' instance for lists, in which the function `pure` makes an infinite list of copies of its argument, and the operator `<*>` applies each argument function to the corresponding argument value at the same position. Complete the following declarations that implement this idea:

    ```haskell
    newtype ZipList a = Z [a] deriving Show

    instance Functor ZipList where
        -- fmap :: (a -> b) -> ZipList a -> ZipList b
        fmap g (Z xs) = ...
    
    instance Applicative ZipList where
        -- pure :: a -> ZipList a
        purge x = ...

        -- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
        (Z gs) <*> (Z xs) = ...
    ```

    The `ZipList` wrapper around the list type is required because each type can only have at most one instance declaration for a given class.

  * ```haskell
    -- Answer goes here
    ```
5. Work out the types for the variables in the four applicative laws.

  * ```haskell
    -- Answer goes here
    ```

6. Define an instance of the `Monad` class for the type `(a ->)`.

  * ```haskell
    -- Answer goes here
    ```

7. Give the following type of expressions

    ```haskell
    data Expr a = Var a | Val Int | Add (Expr a) (Expr a)
                  deriving Show
    ```

    that contain variables of some type `a`, show how to make this type into instances of `Functor`, `Applicative` and `Monad` classes. With the aid of an example, explain what the `>>=` operator for this type does.

8. Rather than making a parameterised type into instances of the `Functor`, `Applicative` and `Monad` classes in this order, in practice it is sometimes simpler to define the functor and applicative instances in terms of the monad instance, relying on the fact that the order in which declarations are made is not important in Haskell. Complete the missing parts in the following declarations for the `ST` type using the `do` notation.

    ```haskell
    instance Functor ST where
        -- fmap :: (a -> b) -> ST a -> ST b
        fmap g st = do ...

    instance Applicative ST where
        -- pure :: a -> ST a
        pure x = S (\s -> (x,s))
        -- (<*>) :: ST (a -> b) -> ST a -> ST b
        stf <*> stx = do ...

    instance Monad ST where
        -- (>>=) :: ST a -> (a -> ST b) -> ST b
        st >>= f = S (\s ->
           let (x,s') = app st s in app (f x) s')
    ```

  * ```haskell
    -- Answer goes here
    ```
