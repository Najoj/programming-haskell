-- ex 5
data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g (Val x)   = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)

-- ex 6
eval :: Expr -> Int
eval expr = folde (+0) (+) expr

size :: Expr -> Int
size expr = folde (\_ -> 1) (+) expr

-- ex 7
instance Eq a => Eq (Maybe a) where
        Just a == Just b = a == b
        _ == _           = False
