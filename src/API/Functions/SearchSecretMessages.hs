-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchSecretMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

-- |
-- 
-- Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance, the number of returned messages is chosen by TDLib
-- 
-- __chat_id__ Identifier of the chat in which to search. Specify 0 to search in all secret chats
-- 
-- __query__ Query to search for. If empty, searchChatMessages must be used instead
-- 
-- __offset__ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
-- 
-- __limit__ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __filter__ Additional filter for messages to search; pass null to search for all messages
data SearchSecretMessages = 

 SearchSecretMessages { _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset :: Maybe String, query :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show SearchSecretMessages where
 show SearchSecretMessages { _filter=_filter, limit=limit, offset=offset, query=query, chat_id=chat_id } =
  "SearchSecretMessages" ++ U.cc [U.p "_filter" _filter, U.p "limit" limit, U.p "offset" offset, U.p "query" query, U.p "chat_id" chat_id ]

instance T.ToJSON SearchSecretMessages where
 toJSON SearchSecretMessages { _filter = _filter, limit = limit, offset = offset, query = query, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "searchSecretMessages", "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchSecretMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchSecretMessages" -> parseSearchSecretMessages v
   _ -> mempty
  where
   parseSearchSecretMessages :: A.Value -> T.Parser SearchSecretMessages
   parseSearchSecretMessages = A.withObject "SearchSecretMessages" $ \o -> do
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- o A..:? "offset"
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchSecretMessages { _filter = _filter, limit = limit, offset = offset, query = query, chat_id = chat_id }
 parseJSON _ = mempty
