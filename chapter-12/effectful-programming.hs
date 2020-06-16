module My where
        
sequenceA :: Applicative f => [f a] -> f [a]
sequenceA []     = pure []
sequenceA (x:xs) = pure (:) <*> x <*> My.sequenceA xs

getChars :: Int -> IO String
getChars n = My.sequenceA (replicate n getChar)
