-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchPublicChats = 
 SearchPublicChats { query :: String }  -- deriving (Show)

instance T.ToJSON SearchPublicChats where
 toJSON (SearchPublicChats { query = query }) =
  A.object [ "@type" A..= T.String "searchPublicChats", "query" A..= query ]
-- searchPublicChats SearchPublicChats  { query :: String } 

