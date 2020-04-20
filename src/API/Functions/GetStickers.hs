-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStickers = 
 GetStickers { limit :: Int, emoji :: String }  -- deriving (Show)

instance T.ToJSON GetStickers where
 toJSON (GetStickers { limit = limit, emoji = emoji }) =
  A.object [ "@type" A..= T.String "getStickers", "limit" A..= limit, "emoji" A..= emoji ]
-- getStickers GetStickers  { limit :: Int, emoji :: String } 

