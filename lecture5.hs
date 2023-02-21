module Main where 



main :: IO()
main = do
    putStrLn "notes"


squareList :: forall a. Num a => [a] -> [a]
-- squareList [] = []
-- squareList (n:ns) = n^2 : squareList ns
squareList ns = map square ns where 
    square x = x*x

{-

type: T1 -> s
\ x -> e 

type: T1 -> T2 -> S 
\ x -> \y -> e 


type: (T1 -> (T^2 -> (T3-> S )))
exp: (\x ->(\y->(\z->e)))

map: 
exp: (\f -> (\xs-> case xs of {...}))

-}