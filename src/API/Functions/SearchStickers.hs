-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchStickers = 
 SearchStickers { limit :: Int, emoji :: String }  -- deriving (Show)

instance T.ToJSON SearchStickers where
 toJSON (SearchStickers { limit = limit, emoji = emoji }) =
  A.object [ "@type" A..= T.String "searchStickers", "limit" A..= limit, "emoji" A..= emoji ]
-- searchStickers SearchStickers  { limit :: Int, emoji :: String } 

