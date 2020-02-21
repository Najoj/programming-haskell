qsort :: Ord a => [a] -> [a]
qsort []        = []
qsort (x:xs)    = qsort smaller ++ [x] ++ qsort larger
                    where
                        smaller = [a | a <- xs, a <= x]
                        larger = [a | a <- xs, a > x]

seqn :: [IO a] -> IO [a]
-- seqn :: Monad m => [m a] -> m [a]
seqn []         = return []
seqn (act:acts) = do x <- act
                     xs <- seqn acts
                     return (x:xs)

product :: Num a => [a] -> a
product []      = 1
product (x:xs)  = x * Main.product xs


rqsort :: Ord a => [a] -> [a]
rqsort []        = []
rqsort (x:xs)    = rqsort larger ++ [x] ++ rqsort smaller
                    where
                        smaller = [a | a <- xs, a <= x]
                        larger = [a | a <- xs, a > x]
