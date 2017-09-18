module Main where

import Data.Char (toLower)
import System.Random

main :: IO ()
main = do
  putStrLn "Rock, Paper or Scissors?"
  o <- getLine
  g <- newStdGen
  let d = randomR (1, 3) g :: (Int, StdGen)
  let l = lowerString o
  let i = toInt l
  let r = compareS i d
  let m = result r i d
  print m

compareS :: Int -> (Int, StdGen) -> Bool
compareS o (d,x) = o == d

toInt :: String -> Int
toInt s = case s of
  "rock" -> 1
  "paper" -> 2
  "scissors" -> 3

toStr :: Int -> String
toStr i = case i of
  1 -> "Rock"
  2 -> "Paper"
  3 -> "Scissors"

lowerString :: [Char] -> String
lowerString str = [ toLower loweredString | loweredString <- str]

result :: Bool -> Int -> (Int, StdGen) -> String
result r i (d,x) = case r of
  True -> "You win! Dealer was: " ++ (show $ toStr d)
  False -> "You loose! Dealer was: " ++ (show $ toStr d)