-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import Text.Read (readMaybe)

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
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }