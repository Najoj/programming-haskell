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
    occurs a (Leaf a)           = True
    occurs a (Node tree1 tree2) = (occurs a tree1) or (occurs a tree2)
    ```


3. Consider the following type of binary trees:

          data Tree a = Leaf a | Node (Tree a) (Tree a)

    Let us say that such a tree is *balanced* if the number of leaves in the left and right subtree of every node differs by at most one, with leaves themselves being trivially balanced. Define a function `balanced :: Tree a -> Bool` that decides if a binary tree is balanced or not.

    Hint: first define a function that returns the number of leaves in a tree.

  * ```haskell
    balanced :: Tree a -> Bool
    balanaced (Leaf _)        = True
    balanced (Node treea treeb) = leaves treea == leaves treeb
    
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
    -- Answer goes here
    ```

6. Using `folde`, define a function `eval :: Expr -> Int` that evaluates an expression to an integer value, and a function `size :: Expr -> Int ` that calculates the number of values in an expression.

  * ```haskell
    -- Answer goes here
    ```

7. Complete the following instance declarations:

  
          instance Eq a => Eq (Maybe a) where
            ...

          instance Eq a => Eq [a] where
            ...

  * ```haskell
    -- Answer goes here
    ```

8. Extend the tautology checker to support the use of logical disjunction (∨) and equivalence (⬄) in propositions.

  * ```haskell
    -- Answer goes here
    ```

9. Extend the abstract machine to support the use of multiplications.

  * ```haskell
    -- Answer goes here
    ```

