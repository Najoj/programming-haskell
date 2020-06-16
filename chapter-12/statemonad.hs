--module My where

type State = Int
-- state transformer
--type ST = State -> State
--type ST a = State -> (a, State)
newtype ST a = S (State -> (a, State))

app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Functor ST where
        fmap g st = S (\s -> let (x,s') = app st s in (g x, s'))

instance Applicative ST where
        -- pure :: a -> ST a
        pure x = S (\s -> (x,s))
        -- (<*>) :: ST (a -> b) -> ST a -> ST b
        stf <*> stx = S (\s ->
                let (f,s')  = app stf s
                    (x,s'') = app stx s' in (f x, s''))

instance Monad ST where
        st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')


