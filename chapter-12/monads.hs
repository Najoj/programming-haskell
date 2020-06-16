module My where

data Expr = Val Int | Div Expr Expr

--eval :: Expr -> Int
--eval (Val n)    = n
--eval (Div x y)  = eval x `div` eval y

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv n m = Just (n `div` m)

--eval :: Expr -> Maybe Int
--eval (Val n)    = Just n
--eval (Div x y)  = case eval x of 
                    --Nothing -> Nothing
                    --Just n  -> case eval y of
                                 --Nothing -> Nothing
                                 --Just m -> safediv n m
-- Does not work
--eval :: Expr -> Maybe Int
--eval (Val n)    = pure n
--eval (Div x y)  = pure safediv <*> eval x <*> eval y

--(>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
--mx >>= f = case mx of
             --Nothing -> Nothing
             --Just x  -> f x

--eval :: Expr -> Maybe Int
--eval (Val n)   = Just n
--eval (Div x y) = eval x My.>>= \n ->
                 --eval y My.>>= \m ->
                 --safediv n m

eval :: Expr -> Maybe Int
eval (Val n)    = Just n
eval (Div x y)  = do n <- eval x
                     m <- eval y
                     safediv n m

class Applicative m => Monad m where
        return :: a -> m a
        (>>=)  :: m a -> (a -> m b) -> m b
        return = pure


