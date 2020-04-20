-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchChats = 
 SearchChats { limit :: Int, query :: String }  -- deriving (Show)

instance T.ToJSON SearchChats where
 toJSON (SearchChats { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchChats", "limit" A..= limit, "query" A..= query ]
-- searchChats SearchChats  { limit :: Int, query :: String } 

