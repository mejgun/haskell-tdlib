-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatRecentLocationMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user 
-- 
-- __chat_id__ Chat identifier
-- 
-- __limit__ The maximum number of messages to be returned
data SearchChatRecentLocationMessages = 

 SearchChatRecentLocationMessages { limit :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatRecentLocationMessages where
 toJSON (SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatRecentLocationMessages", "limit" A..= limit, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatRecentLocationMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatRecentLocationMessages" -> parseSearchChatRecentLocationMessages v
   _ -> mempty
  where
   parseSearchChatRecentLocationMessages :: A.Value -> T.Parser SearchChatRecentLocationMessages
   parseSearchChatRecentLocationMessages = A.withObject "SearchChatRecentLocationMessages" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }