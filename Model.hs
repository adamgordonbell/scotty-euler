module Model where

import Data.Numbers.Primes(primes)

data EulerAnswer = EulerAnswer {
    number :: Int,
    result :: Integer
}

euler1, euler2 :: Integer
euler1 = sum $ [3, 6 .. 999]++[5, 10 .. 999]

euler2 = sum . filter even . takeWhile (< 4000000) $ fibs
    where fibs = 1 : 2 : zipWith (+) fibs (tail fibs)

euler3 = maximum $ primeFactors 600851475143

euler4 = maximum [x * y | x <- [100 .. 999], y <- [100 .. 999], palindrome ( x * y )]
    where
    palindrome n = show n == reverse (show n)

euler5 = head . filter (divider 19) $ [20, 40 .. ]
    where
     divider from x = all (isFactor x) (reverse [2..from])
     isFactor n y = n `rem` y == 0

euler5' = 232792560

euler6 = square (sum [1 .. 100]) - sum (map square [1 .. 100])
    where
     square x = x * x

euler7 = primes !! 10000

answers = zipWith EulerAnswer [1..] list
    where list = [euler1, euler2, euler3, euler4, euler5', euler6, euler7]
-----------------------------------------
-- my own prime factors implementatoin
primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n = small : (primeFactors $ n `quot` small)
	where small = smallestPrimeFactor n

smallestPrimeFactor :: Integer -> Integer	
smallestPrimeFactor n = head $ filter (\x -> n `rem` x == 0) primes

