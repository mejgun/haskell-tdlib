-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

--main = putStrLn "ok"

data SearchChatMessages = 
 SearchChatMessages { _filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, offset :: Int, from_message_id :: Int, sender_user_id :: Int, query :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchChatMessages where
 toJSON (SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMessages", "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender_user_id" A..= sender_user_id, "query" A..= query, "chat_id" A..= chat_id ]
-- searchChatMessages SearchChatMessages  { _filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, offset :: Int, from_message_id :: Int, sender_user_id :: Int, query :: String, chat_id :: Int } 



instance T.FromJSON SearchChatMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMessages" -> parseSearchChatMessages v
  where
   parseSearchChatMessages :: A.Value -> T.Parser SearchChatMessages
   parseSearchChatMessages = A.withObject "SearchChatMessages" $ \o -> do
    _filter <- o A..: "filter"
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    from_message_id <- o A..: "from_message_id"
    sender_user_id <- o A..: "sender_user_id"
    query <- o A..: "query"
    chat_id <- o A..: "chat_id"
    return $ SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }