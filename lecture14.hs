module Stack where 

type Stack a = [a]

push :: a -> Stack a -> ((), Stack a)
push a as = ((), a:as)

-- peek :: Stack a -> a 


pop :: Stack a -> (a,Stack a)
pop (a:as) = (a,as)

testStack :: Stack Int -> (Int, Stack Int)
testStack s0 =
  let
    (_,s1) = push 0     s0 -- f0 :: s-> (a1,s)
    (_,s2) = push 1     s1 -- f1 :: s -> (a1,s)
    (_,s3) = push 2     s2
    (_,s4) = push 3     s3
    (a,s5) = pop        s4
    (b,s6) = pop        s5
    (_,s7) = push (a+b) s6
  in
    pop s7

--stateful function

instance Applicative (StateFunc s) where 
  fmap :: (a->b) StateFunc s a -> StateFunc s b 
  fmap = undefined 

instance Applicative (StateFunc s) where 
  pure :: a-> (StateFunc s) a
  pure a = StateFunc $ \s -> (a,s)
  <*> :: StateFunc s (a -> b) -> StateFunc s a - > State s b 


instance Monad (StateFunc s) where
  (>>=) :: StateFunc s a -> (a -> StateFunc s b) -> StateFunc s b
  (>>=) sa f = undefined 

fmapDefault :: Applicative t => (a -> b) -> t a -> t b 
fmapDefault f ta = pure f <*> ta  

applyDefault :: Monad t => t ( a-> b) -> t a -> t b 
applyDefault tf ta = ta >>= (\a ->  tf >>= (\f-> pure $ f a ))

type StateFunc s a = 
    s -> (a,s)

data StateFunc s a = StateFunc (s -> (a,s))

newtype StateFunc s a = StateFunc (s -> (a,s))
newtype StateFunc s a = StateFunc {runStateFunc :: s -> (a,s)}

main :: IO () 
main = do 
    putStr "yes"