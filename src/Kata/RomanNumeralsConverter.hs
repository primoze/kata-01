module Kata.RomanNumeralsConverter where


import Data.Maybe (fromJust)
import Prelude hiding (lookup)
import qualified Data.Map.Strict as Map



numeralLookup = Map.fromList [
        (1, "I"),
        (4, "IV"),
        (5, "V"),
        (9, "IX"),
        (10, "X"),
        (40, "XL"),
        (50, "L"),
        (90, "XC"),
        (100, "C"),
        (400, "CD"),
        (500, "D"),
        (900, "CM"),
        (1000, "M")
    ]

 
truncateDecimal n
    | n >= 1000 = 1000
    | n >= 900 = 900
    | n >= 500 = 500
    | n >= 400 = 400
    | n >= 100 = 100
    | n >= 90 = 90
    | n >= 50 = 50
    | n >= 40 = 40
    | n >= 10 = 10
    | n >= 9 = 9
    | n >= 5 = 5
    | n >= 4 = 4
    | n >= 1 = 1


lookup :: Integer -> (Integer, String)
lookup d =
    (t, fromJust r)
    where
        t = truncateDecimal d
        r = Map.lookup t numeralLookup

convertNumber :: Integer -> String
convertNumber n = convertNumber' n ""

convertNumber' n r
    | n < 0 = ""
    | n == 0 = r
convertNumber' n r =
    convertNumber' (n-t) r'
    where
        (t, rt) = lookup n
        r' = r ++ rt































