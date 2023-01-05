-- Lecture 2 : More basic features
Module Main where 

-- the function has type: integer to integer 
-- or num n => n -> n 

absoluteValue :: Num n => n -> n
absoluteValue i = 
    if i < 0 then
        i * (-1) 
    else 
        i 
    -- The function above will return an error because of "<" returns Ord error
    -- to fix this change num n -> (Num n, Ord n)


absoluteValue i 
    | i < 0 = i * (-1) -- guarded euqation written to be more like math equation
    | otherwise = i
    -- otherwise has the type "bool" and evaluates to do "true"
    -- if otherwise is not included, running the function will return a run time error
    -- since not all the cases are covered 

absoluteValue i = 
    case i < 0 of 
        True -> i * (-1)
        False -> i 
    -- This way writes the function to handle the true or false cases 
    -- more generalized data 

-- THE THREE ABSOLUTE VALUE FUNCTIONS ARE THE SAME, 
-- JUST DIFFERENT WAYS TO WRITE IT 
-- https://stackoverflow.com/questions/9345589/guards-vs-if-then-else-vs-cases-in-haskell
-- on difference between the 3 ways 

main :: IO () -- this defines main to be a IO unit 
main = 
    putStrLn "what type does putStrLn has?"
    -- Type of putStrLn : String -> IO() 
    -- This is becasue haskell tracks if users interact with the IO or not 
    putStrLn "What happens when we have two putStrLn togther"
    -- This will return an error because the order of eval. Haskel wants to run both
    -- putStrLn at the same time 

-- to fix the above error 
main = 
    do 
        -- do will excute all the functions in the block and run them in order
        {
            putStrLn "what type does putStrLn has?"    
            putStrLn "What happens when we have two putStrLn togther"
            s <- getLine 
            putstrLn s
            -- getline has type "IO String"
            -- since we defined main to only return IO() units (refer to line 36)
            -- we need to assign IO string to the variable "s" which bind it to IO unit
            -- or else this will return an error
            -- (this type of error will only occur if the last line of the do block
            -- doesn't match the main type)
        }
    


--- Moving on to a new data structure 
-- Tuples and lists

-- tuple example - (1,2,3) :: (Num a, Num b, Numc) => (a,b,c) - non homogenous

-- List example - [1,2,3] ::  Num a => [a] -homogenuous 
-- (++) works for list since (++) :: [a] -> [a] -> [a]
-- More prmitive way of building list 
-- [1] : [2] = [1,2]

--example function of list deconstruction 
head :: [a] -> a
head helmets = 
    case helemts of
        [] -> undefined 
        helemet: _ -> helmet

-- another way of writing pattern 
head [] = undefined 
head (helmet:_) = helmet

length :: [a] -> Integer 
length [] = 0
length(x:xs) = 1 + length xsw

sum :: Num a => [a] -> a
sum [] = 0 
