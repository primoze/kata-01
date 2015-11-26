module Main where

import qualified Kata.RomanNumeralsConverterTests as RNCTests

main :: IO ()
main = do
    let
        results = RNCTests.runTests RNCTests.tests
        failed = filter RNCTests.isFailed results
    putStrLn $ show results
    case failed of
        [] -> putStrLn "All test passed!"
        _ -> mapM (putStrLn . show) failed >> return ()
