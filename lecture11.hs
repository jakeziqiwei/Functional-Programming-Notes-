module Main where

data ZipList a = ZipList [a]


-- instance Applicative_ [] where
--     apply :: [a->b] -> [a] -> [b]
    -- appyly fs as 
-- t(a->b) -> t a -> t b 
--(<*>) = apply


applyFunctionPairwise :: [a->b] -> [a] -> [b]
applyFunctionPairwise fs as = map (\(f,a) -> f a) $ zip fs as 


main :: IO() 
main = do 
    putStrLn "notes"
