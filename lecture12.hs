module Main where

import Prelude hiding (Monad, Applicative)
import Control.Monad (guard)


class Applicative t => Moand_ (t :: * -> *) where 
    -- pure :: a -> t a 
    -- fmap :: (a -> b) -> t a -> t b 
    -- (<*>) :: t (a->b) -> t a -> t b 
    andthen :: forall a b. t a -> (a -> t b) -> t b 
    andThen ta f =
        (join @_ @_ pure $ f ta) 
    join :: forall a. t (t a) -> t a 
    join tta = andthen @t @(t,a) @_ tta id 



instance MonadPlus_ Maybe where 
    guard :: Bool -> Maybe ()
    guard False = Nothing 
    guard True = Just () 

instance monadPLus_ [] where 
    guard :: Bool -> [] ()
    guard False = []
    guard True = [()]


sibling :: Person -> Person -> Maybe()  
sibling px py = do
    --through it enough guard 
    guard $ px /= py >>= (\_ -> 
        parent px >>= (\ppx ->
            parent py >>= \ppy -> 
            guard $ parent ))


main :: IO() 
main = do 
    print "notes"