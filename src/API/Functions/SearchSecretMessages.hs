-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchSecretMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

--main = putStrLn "ok"

data SearchSecretMessages = 
 SearchSecretMessages { _filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, from_search_id :: Int, query :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchSecretMessages where
 toJSON (SearchSecretMessages { _filter = _filter, limit = limit, from_search_id = from_search_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchSecretMessages", "filter" A..= _filter, "limit" A..= limit, "from_search_id" A..= from_search_id, "query" A..= query, "chat_id" A..= chat_id ]
-- searchSecretMessages SearchSecretMessages  { _filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, from_search_id :: Int, query :: String, chat_id :: Int } 

