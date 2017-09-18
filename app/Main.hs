module Main where

import Data.Char (toLower)
import System.Random

data Result = Bool | String
  deriving(Show)

main :: IO ()
main = do
  putStrLn "Rock, Paper or Scissors?"
  o <- getLine
  g <- newStdGen
  let d = randomR (1, 3) g :: (Int, StdGen)
  let l = lowerString o
  let i = toInt l
  let r = compareS i d
  let m = result r d
  print m

compareS :: Int -> (Int, StdGen) -> String
compareS o (d,x) = case d of 
  1 -> case o of
    1 -> "Draw"
    2 -> "Win"
    3 -> "Loose"
  2 -> case o of
    1 -> "Loose"
    2 -> "Draw"
    3 -> "Win"
  3 -> case o of
    1 -> "Win"
    2 -> "Loose"
    3 -> "Draw"

toInt :: String -> Int
toInt s = case s of
  "rock" -> 1
  "paper" -> 2
  "scissors" -> 3
  _ -> 0 

toStr :: Int -> String
toStr i = case i of
  1 -> "Rock"
  2 -> "Paper"
  3 -> "Scissors"

lowerString :: [Char] -> String
lowerString str = [ toLower loweredString | loweredString <- str]

result :: String -> (Int, StdGen) -> String
result r (d,x) = "You " ++ (id $ r) ++ "! Dealer was: " ++ (id $ toStr d)