module Main where

import Data.Char (toLower)
import System.Random

main :: IO ()
main = do
  putStrLn "Rock, Paper or Scissors?"
  o <- getLine
  g <- newStdGen
  let d = randomRIO (1, 3) :: IO (Int)
  let l = lowerString o
  let i = toInt l
  let r = compareS i d
  print r

compareS :: Int -> IO Int -> Bool
compareS o d = o == d

toInt :: String -> Int
toInt s = case s of
  "rock" -> 1
  "paper" -> 2
  "scissors" -> 3

lowerString :: [Char] -> String
lowerString str = [ toLower loweredString | loweredString <- str]

-- getRan :: 