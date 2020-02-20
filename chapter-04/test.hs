halve :: [a] -> ([a], [a]) 
halve a = ((head n a), (drop n a))
            where
                n = floor ((div) (length a) 2)
