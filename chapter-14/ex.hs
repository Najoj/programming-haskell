import Data.Monoid

newtype MySum a = MySum a
    deriving (Eq, Ord, Show, Read)

getum :: MySum a -> a
getum (MySum x) = x

instance Num a => Monoid (MySum a) where
    -- mempty :: MySum a
    mempty = MySum 0
    -- mappend :: MySum a -> MySum a -> MySum a
    MySum x `mappend` MySum y = MySum (x+y)

-- Apparently required now
instance Semigroup a => Semigroup (MySum a) where
        (MySum x) <> mempty = (MySum x)
        mempty <> (MySum x) = (MySum x)
        

