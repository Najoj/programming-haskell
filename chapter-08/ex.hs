module M where

type Pos = (Int, Int)
type Assoc k v = [(k,v)]

--find :: Eq k => k -> Assoc k v -> v
--find k t = head [v| (k',v) <- t, k == k']

data Move = North | South | East | West

move :: Move -> Pos -> Pos
move North (x,y) = (x,y+1)
move South (x,y) = (x,y-1)
move East  (x,y) = (x+1,y)
move West  (x,y) = (x-1,y)

moves :: [Move] -> Pos -> Pos
moves []     p = p
moves (m:ms) p = moves ms (move m p)

-- data Maybe a = Nothing | Just a

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv m n = Just (m `div` n)

--newtype Nat = N Int

data Nat = Zero | Succ Nat

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

class MEq a where
        (M.==), (M./=) :: a -> a -> Bool
        x M./= y = not (x M.== y)

