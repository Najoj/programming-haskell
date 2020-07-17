import Data.Monoid

--instance Monoid [a] where
        ---- mempty :: [a]
    --mempty = []
    ---- mappend :: [a] -> [a] -> [a]
    --mappend = (++)
    --
instance Monoid a => Monoid (Maybe a) where
        mempty = Nothing
        Nothing `mappend` my = my
        mx `mappend` Nothing = mx
        Just x `mappend` Just y = Just (x `mappend` y)
