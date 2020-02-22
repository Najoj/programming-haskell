f x = x + x
g x = x * x
h x = f (g x)

{- faulty
N = a 'div' length xs
    where
        a = 10
       xs = [1,2,3,4,5]
-}
-- correct
n = a `div` length xs
        where
                a = 10
                xs = [1,2,3,4,5]

last_a xs = head (reverse xs)
last_b xs = xs !! x
        where
                x = (length xs)-1

init_a xs = reverse (tail (reverse xs))
init_b xs = take x xs
        where
                x = (length xs)-1
