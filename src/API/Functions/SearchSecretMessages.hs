-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchSecretMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

data SearchSecretMessages = 
 SearchSecretMessages { _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, from_search_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchSecretMessages where
 toJSON (SearchSecretMessages { _filter = _filter, limit = limit, from_search_id = from_search_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchSecretMessages", "filter" A..= _filter, "limit" A..= limit, "from_search_id" A..= from_search_id, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchSecretMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchSecretMessages" -> parseSearchSecretMessages v
   _ -> mempty
  where
   parseSearchSecretMessages :: A.Value -> T.Parser SearchSecretMessages
   parseSearchSecretMessages = A.withObject "SearchSecretMessages" $ \o -> do
    _filter <- optional $ o A..: "filter"
    limit <- optional $ o A..: "limit"
    from_search_id <- optional $ o A..: "from_search_id"
    query <- optional $ o A..: "query"
    chat_id <- optional $ o A..: "chat_id"
    return $ SearchSecretMessages { _filter = _filter, limit = limit, from_search_id = from_search_id, query = query, chat_id = chat_id }