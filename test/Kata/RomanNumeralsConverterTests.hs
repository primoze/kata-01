{-# LANGUAGE CPP #-}

module Kata.RomanNumeralsConverterTests (
    Name, TestResult(..),
    tests, runTests, isPassed, isFailed
) where

import Kata.RomanNumeralsConverter

-- Tests
type Name = String
type Message = String

data TestResult
    = Passed
    | Failed Message
    deriving (Eq, Ord, Show)

failExpecting :: String -> String -> TestResult
failExpecting e a = Failed $ "expecting " ++ e ++ ", was " ++ a

failMessage :: String -> TestResult
failMessage m = Failed m


isPassed Passed = True
isPassed _ = False

isFailed (Failed _)= True
isFailed _ = False

-- End Tests

type Test = (Integer, String, (Integer -> String -> TestResult))

testCase :: Integer -> String -> Test
testCase d r = (d, r, test_convertNumber)

runTests :: [Test] -> [TestResult]
runTests ts = map (\(i, e, f) -> f i e ) ts


tests :: [Test]
tests = [
        testCase 1 "I",
        testCase 2 "II",
        testCase 3 "III",
        testCase 4 "IV",
        testCase 5 "V",
        testCase 6 "VI",
        testCase 7 "VII",
        testCase 8 "VIII",
        testCase 2457 "MMCDLVII",
        testCase 645 "DCXLV",
        testCase 1234 "MCCXXXIV",
        testCase 2334 "MMCCCXXXIV"
    ]

test_convertNumber :: Integer -> String -> TestResult
test_convertNumber n e =
    case rn == e of
        True -> Passed
        _ -> failExpecting e rn
    where rn = convertNumber n




