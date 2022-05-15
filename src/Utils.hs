{-# LANGUAGE OverloadedStrings #-}

module Utils where

import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import qualified Data.Text as Text
import qualified Text.Read as TR (readMaybe)

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"

rm :: Read a => Maybe String -> Maybe a
rm (Just x) = TR.readMaybe x
rm _ = Nothing

rl :: Read a => Maybe [String] -> Maybe [a]
rl Nothing = Nothing
rl (Just []) = Nothing
rl (Just xs) = mconcat $ map TR.readMaybe xs

toS :: Show a => Maybe a -> T.Value
toS (Just x) = T.String . Text.pack $ show x
toS Nothing = T.Null

toLS :: Show a => Maybe [a] -> [T.Value]
toLS (Just xs) = map (T.String . Text.pack . show) xs
toLS Nothing = []