data Tree a = Leaf | Node (Tree a) a (Tree a)
              deriving Show

-- ex 1
instance Functor Tree where
        -- fmap :: (a -> b) -> Tree a -> Tree b
        fmap _ Leaf = Leaf
        fmap f (Node left val right) = Node (fmap f left) (f val) (fmap f right)

-- ex 2 wut?
--instance Functor ((->) a) where
        -- fmap :: (a -> b) -> (

instance Applicative (a ->) where
        -- pure  ::
        -- (<*>) ::

