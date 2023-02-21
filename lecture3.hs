-- Lecture 3 : Nore list programming 
Module Main where
import prelude hiding (concat)

 -- take a two list and return a combined list 
 concat :: {- for all a. -} [[a]] -> [a]
 concat [] = []
 contact (xs:rest) =  helemts ++ concat rest 

-- product function 
product :: Num a => [a] -> a 
product [] = 1 
product (x:xs) = x * product xs

-- trying to generalize the structure of the previous function 

foobar :: forall a. (a->a->a) -> a -> [a] -> a 
foobar f init [] = init 
foobar f init (helmet:helmets) = let result = foobar f init helmets in
     f helmet result 



--- Data Structures 
--- (255,12,12)
--- "red"

data Color 
    = RGB Int Int Int 
    | ColorName String -- '|' this means or 
        deriving show 
isRead :: Color -> Bool 
iSRead (RGB r g b)  = r == 255 && g+b == 0 
isRed (ColorName name) =  name == "red" || name == "Red"