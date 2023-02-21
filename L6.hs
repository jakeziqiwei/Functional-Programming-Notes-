module Main where

main :: IO ()
main = undefined

-- Using the $ and <| operator
{- 

b1 (b2 (b3 b4))
b1 $ b2 $ b3 b4

Right to left pipeline:
b1 <| b2 <| b3 b4

-}

-- compose :: (a -> b) -> (b -> c)-> (a -> c)
-- compose :: (a -> b) -> (b -> c) -> a -> c is the same thing 
compose :: forall a b c. (b -> c) -> (a -> b) -> a -> c
compose f g a = f (g a)
    -- let b = f a in
    -- let c = g b in
    -- c

(.) = compose

-- Left to right pipeline
(|>) :: a -> (a -> b) -> b
-- (|>) a f = f a 
(|>) = flip ($)

-- LIST COMPREHENSIONS
cartesianProduct :: forall a b. [a] -> [b] -> [(a,b)]
cartesianProduct as bs = 
    -- concat $ map (\a -> map (\b -> (a, b)) bs) as
    concatMap (\a -> map (\b -> (a, b)) bs) as

-- concatMap f xs = concat $ map f xs

cartesianProduct3 :: forall a b c. [a] -> [b] -> [c] -> [(a,b,c)]
cartesianProduct3 as bs cs =
    concatMap (\a ->
        concatMap (\b ->
            map (\c ->
                (a,b,c)
            ) cs
        ) bs
    ) as

-- If I really wanted to use concatMap
-- cartesianProduct3 as bs cs =
--     concatMap (\a ->
--         concatMap (\b ->
--             concatMap (\c ->
--                 [(a,b,c)]
--             ) cs
--         ) bs
--     ) as

lessThanPairs :: forall a. Ord a => [a] -> [a] -> [(a,a)]
lessThanPairs as bs = 
    concatMap (\a ->
        concatMap (\b ->
            if a < b
                then [(a,b)]
                else []
        ) bs
    ) as

-- Using flip
{-
lessThanPairs as bs = 
    flip concatMap as (\a ->
        flip concatMap bs (\b ->
            if a < b
                then [(a,b)]
                else []
        ) 
    ) 
-}

-- Using $
{-
lessThanPairs as bs = 
    flip concatMap as $ \a ->
        flip concatMap bs $ \b ->
            if a < b
                then [(a,b)]
                else []
-}

-- Using list comprehension
{-
lessThanPairs as bs =
    [(a,b) | a <- as, b <- bs, a < b]
-}

sumLessThan5 :: forall a. (Num a, Ord a) => [a] -> [a] -> [(a,a)]
sumLessThan5 as bs =
    [(a,b) | a <- as, b <- bs, (a + b) < 5]

sumFirstN :: (Ord a, Num a) => a -> a
sumFirstN n = foo 0 0
    where
        foo sum i 
            | i <= n     = foo (sum + i) (i + 1)
            | otherwise = sum
    -- sum [1..n]
