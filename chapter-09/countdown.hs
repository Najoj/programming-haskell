type Result = (Expr, Integer)

data Op = Add | Sub | Mul | Div | Exp
data Expr = Val Integer | App Op Expr Expr

instance Show Op where
        show Add = "+"
        show Sub = "-"
        show Mul = "*"
        show Div = "/"
        show Exp = "^"

instance Show Expr where
        show (Val n)     = show n
        show (App o l r) = brak l ++ show o ++ brak r
                where
                        brak (Val n) = show n
                        brak e       = "(" ++ show e ++ ")"


valid :: Op -> Integer -> Integer -> Bool
valid Add x y = x <= y
valid Sub x y = x > y
valid Mul x y = x /= 1 && y /= 1 && x <= y
valid Div x y = y /= 1 && x `mod ` y == 0
valid Exp x y = True

valid' :: Op -> Integer -> Integer -> Bool
valid' Add _ _ = True
valid' Sub x y = x > y
valid' Mul _ _ = True
valid' Div x y = x `mod` y == 0
valid' Exp _ _ = True

apply :: Op -> Integer -> Integer -> Integer 
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y
apply Exp x y = x ^ y

values :: Expr -> [Integer]
values (Val n)     = [n]
values (App _ l r) = values l ++ values r


eval' :: Expr -> [Integer]
eval' (Val n)       = [n | n > 0]
eval' (App o l r) = [apply o x y | x <- eval' l,
                                   y <- eval' r,
                                   valid' o x y]
eval :: Expr -> [Integer]
eval (Val n)       = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l,
                                  y <- eval r,
                                  valid o x y]

subs :: [a] -> [[a]]
subs []     = [[]]
subs (x:xs) = yss ++ map (x:) yss
        where yss = subs xs

interleave :: a -> [a] -> [[a]]
interleave x []     = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

{- Manual evaluation:
 - perms [1] = 
 -      = concat (map (interleave 1) (perms []))
 -      = concat (map (interleave 1) ([[]]))
 -      = concat ([interleave 1 [])
 -      = concat [[[1]]]
 -      = [[1]]
 - perms [2,1] = 
 -      = concat (map (interleave 1) (perms [2]))
 -      = concat (map (interleave 1) (
 -          concat (map (interleave 2) (perms [])
 -        ))
 -      = concat (map (interleave 1) ([[2]]))
 -      = concat ([interleave 1 [2]])
 -      = concat [[[1,2],[2,1]]]
 -      = [[1,2],[2,1]]
 -}

choices :: [a] -> [[a]]
choices = concat . map perms . subs

-- ex 1
choices' :: [a] -> [[a]]
choices' l = [x | s <- subs l,
                  x <- perms s]

solution :: Expr -> [Integer] -> Integer -> Bool
solution e ns n = elem (values e) (choices ns) && eval e == [n]

split :: [a] -> [([a],[a])]
split []     = []
split [_]    = []
split (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- split xs]

exprs :: [Integer] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns  = [e | (ls, rs) <- split ns,
                 l        <- exprs ls,
                 r        <- exprs rs,
                 e        <- combine l r]

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [Add,Sub,Mul,Div,Exp]

solutions :: [Integer] -> Integer -> [Expr]
solutions ns n = [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]

results :: [Integer] -> [Result]
results [] = []
results [n] = [(Val n,n) | n > 0]
results ns = [res | (ls,rs) <- split ns,
                    lx      <- results ls,
                    ry      <- results rs,
                    res     <- combine' lx ry]

combine' :: Result -> Result -> [Result]
combine' (l,x) (r,y) = [(App o l r, apply o x y) | o <- ops,
                                                   valid o x y]

solutions' :: [Integer] -> Integer -> [Expr]
solutions' ns n = [e | ns' <- choices ns, (e,m) <- results ns', m == n]

solutions''  ns n   = near ns n n

near ns n m = if null solution
                 then near ns n (m+1)
                 else solution
                    where
                        solution = near_solutions ns n m

near_solutions ns n x = [e | ns' <- choices ns, (e,m) <- results ns', x == (m-n)]

main :: IO ()
--main = print (solutions [1,3,7,10,25,50] 765)
main = print (solutions'' [1,3,7] 22)
--main = print (solutions [1,3,7,10,25,50] 97656243896484031)
