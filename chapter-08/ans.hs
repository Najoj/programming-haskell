module Chapter08 where

data Nat = Zero | Succ Nat
data Tree a = Leaf a | Node (Tree a) (Tree a)

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult m Zero     = Zero
mult m (Succ n) = Chapter08.add m (mult m n)

-- data Ordering = LT | EQ | GT

-- data Tree a = Leaf a | Node (Tree a) a (Tree a)

-- occurs :: Ord a => a -> Tree a -> Bool
-- occurs x (Leaf y)     = x == y
-- occurs x (Node l y r) = case compare x y of
--                          LT -> occurs x l
--                          GT -> occurs x r
--                          EQ -> True


balanced :: Tree a -> Bool
balanaced (Leaf _)        = True
balanced (Node treea treeb) = leaves treea == leaves treeb

leaves :: Tree a -> Int
leaves (Leaf a) = 1
leaves (Node tree1 tree2) = (leaves tree1) + (leaves tree2)

balance :: [a] -> Tree a
balance (a:[]) = Leaf a
balance xs = (Node (ta) (tb))
            where
                    (xa, xb) = halve xs
                    ta = balance xa
                    tb = balance xb
                
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
           where
               n = (length xs) `div` 2

