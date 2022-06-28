#!/usr/bin/env stack
-- stack --resolver lts-18.28 script

{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -W -Wall -Werror #-}

module Main where

import qualified Data.List as L
import qualified Data.List.Extra as LE
import System.Directory (renameFile)

file :: FilePath
file = "../package.yaml"

tmpfile :: FilePath
tmpfile = "temp_package.yaml"

main :: IO ()
main = do
  fs <- lines <$> readFile file
  let dat = unlines . parse $ fs
  writeFile tmpfile dat
  renameFile tmpfile file

parse :: [String] -> [String]
parse = map w
  where
    w s =
      if "version:" `L.isPrefixOf` s
        then change s
        else s

change :: String -> String
change x =
  if minor < 99
    then L.intercalate "." $ take 2 l ++ [minorstr, "0"]
    else L.intercalate "." [head l, majorstr, "0", "0"]
  where
    l = LE.split (== '.') x
    minor :: Int
    minor = read $ l !! 2
    minorstr :: String
    minorstr = show $ minor + 1
    major :: Int
    major = read $ l !! 1
    majorstr :: String
    majorstr = show $ major + 1
