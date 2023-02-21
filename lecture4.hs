
module Main where 



main :: IO()
main = do
    putStrLn "notes"




data Color 
    = RGBA Int Int Int (Maybe Float)
    -- RBGA { r :: Int, g:: Int, b :: Int, a :: Maybe FLoat}
    | ColorName String -- '|' this means or
    | Pink -- subsection, which means nothing
        deriving (Show , Eq)
        --automtically try to derrive an instance 

-- to create a color RBGA 4 2 (Just 2.0)

-- given T convert it to a string 
class Show t where 
    show :: t -> String 
    -- show :: Num -> String -- built in 

-- Defined in the library 

-- adding COlor to the sub class of show 
instance Show Color where 
    show :: Color -> String 
    show Pink = "Pink"
    show (ColorName a) = a
    show (RGBA r g b a ) = "rgba" ++ show r ++ show b ++ show b 
    -- short hand below 
    --foldr (++) "" ["rgba", show r, show b]
    -- concat ["rgba", show r, show b]

class Eq t where
    (==) :: t -> t -> Bool
    (/=) :: t -> t -> Bool

    (==) x y = not (x /= y)
    (/=) x y = not (x == y)


instance Eq Color where
    (==) :: Color -> Color -> Bool  



isRed :: Color -> Bool 
isRed color = 
    case color of 
        RGBA r g b _-> r == 255 && g+b == 0 
        ColorName name -> name == "red" || name == "Red"
    
getRedComponent :: Color -> Int 
getRedComponent (RGBA r _ _ _) = r 

data List a
    = Empty 
    | NonEmpty a (List a)
