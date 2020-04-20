-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchContacts = 
 SearchContacts { limit :: Int, query :: String }  -- deriving (Show)

instance T.ToJSON SearchContacts where
 toJSON (SearchContacts { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchContacts", "limit" A..= limit, "query" A..= query ]
-- searchContacts SearchContacts  { limit :: Int, query :: String } 

