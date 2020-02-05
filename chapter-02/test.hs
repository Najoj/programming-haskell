double x    = x + x

quadruple x = double (double x)

factorial n = product [1..n]

n = div 1 (length xs)
    where
        a = 10
        xs = [1,2,3,4,5]

last x = drop n x
    where
        n = (length x) -1

init x = x !! 1

init2 x = take n x
    where
        n = (length x) -1
