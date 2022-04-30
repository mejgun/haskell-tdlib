#!/usr/bin/env stack
-- stack --resolver lts-18.28 script

{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO (readFile)

data Entry = Entry
  { name :: T.Text,
    constructor :: T.Text,
    comments :: [T.Text],
    args :: [Entry]
  }

main :: IO ()
main = do
  l <- TIO.readFile "td_api.tl"
  let [dat, funcs] = T.splitOn "---functions---" l
  let a = map (T.strip . T.dropAround (== '\n') . T.strip) $ T.splitOn "\n//@description" dat
  print a

-- -- | convert "chatPhoto small:file big:file = ChatPhoto;" to
-- -- map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
-- --
-- -- map(data type name)=[(data type contructor), (string)]
-- -- toMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
-- toMap :: [T.Text] -> [Entry]
-- toMap t =
--   -- foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $
--   -- map format t
--   -- format l
--   -- where
--   -- format l = do
--   do
--     let comments = filter (T.isPrefixOf "//") t
--     let (dat : _) = filter (== T.empty) . filter (not . T.isPrefixOf "//") $t
--     let (a, name) = T.breakOn "=" dat
--     let (constr, rest) = T.breakOn " " a