module Main where

import Prelude hiding (Functor, fmap, (<$>))


mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f Nothing  = Nothing
mapMaybe f (Just x) = Just $ f x


applyActionMaybe :: (a -> Maybe b) -> Maybe a -> Maybe b
applyActionMaybe _ Nothing  = Nothing
applyActionMaybe f (Just x) = f x


andThenMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
andThenMaybe = flip applyActionMaybe


type Person = String 

parent :: Person -> Maybe Person 
parent = 
    undefined

grandparent :: Person -> Maybe Person 
grandparent p = 
    just p `andThenMaybe` parent (\pp -> parent pp)


grandparent p =
  parent p  `andThenMaybe` \pp ->
  parent pp `andThenMaybe` \ppp ->
  pureMaybe ppp


guardMaybe :: Bool -> Maybe () 
guardMaybe True = Just ()
guardMaybe False = Nothing  

    -- parent x == parent y && parent x /= Nothing (Valid way of solving)
    -- px == py 
    -- where
    --     parent x >>= \px -> 
    --         parent y >>= \py -> 
    --             Just (px == py)
sibling :: Person -> Person -> Maybe ()
sibling x y =
  (guardMaybe $ x /= y) `andThenMaybe` \() ->
  parent x              `andThenMaybe` \px ->
  parent y              `andThenMaybe` \py ->
  guardMaybe $ px == py
    


class Functor t where 
    fmap :: (a->b) -> t a -> t b 

instance Functor Maybe where
    fmap = mapMaybe 

instance Functor [] where 
    






main :: IO() 
main = do 



