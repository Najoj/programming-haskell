1. In a similar manner to the function `add`, define a recursive multiplication function `mult :: Nat -> Nat -> Nat` for the recursive type of natural numbers:

    Hint: make use of `add` in your definition.

  * ```haskell
    mult :: Nat -> Nat -> Nat
    mult m Zero     = Zero
    mult m (Succ n) = add m (mult m n)
    ```

2. Although not included in appendix B, the standard prelude defines

          data Ordering = LT | EQ | GT

    together with a function 

          compare :: Ord a => a -> a -> a -> Ordering

    that decides if one value in an ordered type is less than (`LT`), equal to (`EQ`), or greater than (`GT`) another value. Using this function, redefine the function `occurs :: Ord a => a -> Tree a -> Bool` for search trees. Why is this new definition more efficient than the original version? 

  * I suppose it's because trees are better.

    ```haskell
    occurs :: Ord a => a -> Tree a -> Bool
    occurs x (Leaf y)     = x == y
    occurs x (Node l y r) = case compare x y of
                     LT -> occurs x l
                     GT -> occurs x r
                     EQ -> True
    ```


3. Consider the following type of binary trees:

          data Tree a = Leaf a | Node (Tree a) (Tree a)

    Let us say that such a tree is *balanced* if the number of leaves in the left and right subtree of every node differs by at most one, with leaves themselves being trivially balanced. Define a function `balanced :: Tree a -> Bool` that decides if a binary tree is balanced or not.

    Hint: first define a function that returns the number of leaves in a tree.

  * ```haskell
    balanced :: Tree a -> Bool
    balanaced (Leaf _)          = True
    balanced (Node treea treeb) = abs(leaves treea - leaves treeb) <= 1
    
    leaves :: Tree a -> Int
    leaves (Leaf a) = 1
    leaves (Node tree1 tree2) = (leaves tree1) + (leaves tree2)
    ```

4. Define a function `balance :: [a] -> Tree a` that converts a non-empty list into a balanced tree. Hint: first define a function that splits a list into two halves whose length differs by at most one.

  * ```haskell
    balance :: [a] -> Tree a
    balance (a:[]) = Leaf a
    balance xs = Node (ta) (tb)
                   where
                     (xa, xb) = halve xs
                     ta = balance xa
                     tb = balance xb
    ```

5. Given the type declaration

          data Expr = Val Int | Add Expr Expr

    define a higher-order function

          folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a

    such that `folde f g` replaces each `Val` constructor in an expression by the function `f`, and each `Add`constructor by the function `g`.

  * ```haskell
    folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
    folde f g (Val x)   = f x
    folde f g (Add x y) = g (folde f g x) (folde f g y)

    ```

6. Using `folde`, define a function `eval :: Expr -> Int` that evaluates an expression to an integer value, and a function `size :: Expr -> Int ` that calculates the number of values in an expression.

  * ```haskell
    eval :: Expr -> Int
    eval expr = folde (id) (+) expr

    size :: Expr -> Int
    size expr = folde (const 1) (+) expr
    ```

7. Complete the following instance declarations:

  
          instance Eq a => Eq (Maybe a) where
            ...

          instance Eq a => Eq [a] where
            ...

  * ```haskell
    instance Eq a => Eq (Maybe a) where
        Nothing == Nothing = a == b
        Just a  == Just b  = a == b
        _ == _             = False 
        a /= b             = not (a == b)

    instance Eq a => Eq [a] where
        [] == []          = True
        (a:as) == (b:bs)  = a == b and as == bs
        as /= bs          = not (as == bs)
        
    ```

8. Extend the tautology checker to support the use of logical disjunction (∨) and equivalence (⬄) in propositions.

  * See [tautologychecker.hs](./tautologychecker.hs)

9. Extend the abstract machine to support the use of multiplications.

  * See [abstractmachine.hs](./abstractmachine.hs)

