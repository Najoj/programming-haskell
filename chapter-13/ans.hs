import Data.Char

newtype Parser a = P (String -> [(a, String)])

class Applicative f => Alternative f where
        empty :: f a
        (<|>) :: f a -> f a -> f a
        many :: f a -> f [a]
        some :: f a -> f [a]
        
        many x = some x <|> pure []
        some x = pure (:) <*> x <*> many x

space :: Parser ()
space = do many (sat isSpace)
           return ()

token :: Parser a -> Parser a
token p = do space
             v <- p
             space
             return v

item :: Parser Char
item = P (\inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x,xs)])

sat :: (Char -> Bool) -> Parser Char
sat p = do x <- item
           if p x then return x else empty

char :: Char -> Parser Char
char x = sat (== x)

string :: String -> Parser String
string [] = return []
string (x:xs) = do char x
                   string xs
                   return (x:xs)

symbol :: String -> Parser String
symbol xs = token (string xs)


-- ex 1
comment :: Parser ()
comment = do char '-'
             char '-'
             many (do sat char)
             char '\n'
             return ()

