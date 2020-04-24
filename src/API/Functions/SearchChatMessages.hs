-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

data SearchChatMessages = 
 SearchChatMessages { _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, sender_user_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatMessages where
 toJSON (SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMessages", "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender_user_id" A..= sender_user_id, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMessages" -> parseSearchChatMessages v
   _ -> mempty
  where
   parseSearchChatMessages :: A.Value -> T.Parser SearchChatMessages
   parseSearchChatMessages = A.withObject "SearchChatMessages" $ \o -> do
    _filter <- optional $ o A..: "filter"
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    from_message_id <- optional $ o A..: "from_message_id"
    sender_user_id <- optional $ o A..: "sender_user_id"
    query <- optional $ o A..: "query"
    chat_id <- optional $ o A..: "chat_id"
    return $ SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }