--module My where

type State = Int
-- state transformer
type ST = State -> State

type ST a = State -> (a, State)
