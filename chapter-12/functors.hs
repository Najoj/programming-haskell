module My where

-- Without map
--inc :: [Int] -> [Int]
--inc []      = []
--inc (n:ns)  = n+1 : inc ns

--sqr :: [Int] -> [Int]
--sqr []      = []
--sqr (n:ns)  = n^2 : sqr ns

-- With map
--inc = map (+1)
--sqr = map (^2)


class Functor f where
        fmap :: (a -> b) -> f a -> f b

data Maybe a = Nothing | Just a
        deriving Show

instance My.Functor My.Maybe where
        -- fmap :: (a -> b) -> Maybe a -> Maybe b
    fmap _ My.Nothing  = My.Nothing
    fmap g (My.Just x) = My.Just (g x)

data Tree a = Leaf a | Node (Tree a) (Tree a)
        deriving Show

instance My.Functor My.Tree where
        fmap g (My.Leaf x) = My.Leaf (g x)
        fmap g (My.Node l r) = Node (My.fmap g l) (My.fmap g r)

instance My.Functor IO where
        -- fmap :: (a -> b) -> IO a -> IO b
        fmap g mx = do {x <- mx; return (g x)}

inc :: My.Functor f => f Int -> f Int
inc = My.fmap (+1)

-- Functor laws
instance My.Functor [] where 
        -- fmap :: (a -> b) -> f a -> f b
        fmap g [] = []
        fmap g (x:xs) = My.fmap g xs ++ [g x]

