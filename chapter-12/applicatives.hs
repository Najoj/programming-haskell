module My where

class Functor f => Applicative f where
        pure  :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b

instance My.Applicative Maybe where
        -- pure :: a -> Maybe a
        pure = Just
        -- (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
        Nothing  <*> _  = Nothing
        (Just g) <*> mx = fmap g mx

instance My.Applicative [] where
        -- pure :: a -> [a]
        pure x = [x]

        -- (<*>) :: [a -> b] -> [a] -> [b]
        gx <*> xs = [g x | g <- gx, x <- xs]

prods :: [Int] -> [Int] -> [Int]
--prods xs ys = [x*y | x <- xs, y <- ys]
prods xs ys = My.pure (*) My.<*> xs My.<*> ys

instance My.Applicative IO where
        -- pure :: a -> IO a
        pure = return
        -- (<*>) :: IO (a -> b) -> IO a -> IO b
        mg <*> mx = do { g <- mg; x <- mx; return (g x)}

getChars :: Int -> IO String
getChars 0 = return []
getchars n = My.pure (:) My.<*> getChar My.<*> getChars (n-1)

