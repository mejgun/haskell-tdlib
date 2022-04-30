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
  deriving (Show)

main :: IO ()
main = do
  l <- TIO.readFile "td_api.tl"
  let [dat, funcs] = T.splitOn "---functions---" l
  let a = splitToItems funcs
  print $ itemToEntry $ a !! 3

splitToItems :: T.Text -> [T.Text]
splitToItems =
  filter (/= "")
    . map (T.strip . T.dropAround (== '\n') . T.strip)
    . T.splitOn "\n//@description"

itemToEntry :: T.Text -> Entry
itemToEntry x = do
  let splited = filter (/= "") . map T.strip $ T.splitOn "\n" x
  let comments = head splited : map (T.dropWhile (== '/')) (filter (T.isPrefixOf "//") splited)
  let [dat] = filter (not . T.isPrefixOf "//") $tail splited
  let (a, name) = T.breakOn "=" dat
  let (constr, rest) = T.breakOn " " a
  Entry
    { comments = takeWhile (not . T.isPrefixOf "@") comments,
      name = myStrip name,
      constructor = myStrip constr,
      args = []
    }

myStrip :: T.Text -> T.Text
myStrip = T.strip . T.dropAround (== '=') . T.dropAround (== ';') . T.strip

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
