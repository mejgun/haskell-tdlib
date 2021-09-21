-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatHistory where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).
-- 
-- -For optimal performance, the number of returned messages is chosen by TDLib. This is an offline request if only_local is true
-- 
-- __chat_id__ Chat identifier
-- 
-- __from_message_id__ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
-- 
-- __offset__ Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __only_local__ If true, returns only messages that are available locally without sending network requests
data GetChatHistory = 

 GetChatHistory { only_local :: Maybe Bool, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatHistory where
 toJSON (GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatHistory", "only_local" A..= only_local, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatHistory" -> parseGetChatHistory v
   _ -> mempty
  where
   parseGetChatHistory :: A.Value -> T.Parser GetChatHistory
   parseGetChatHistory = A.withObject "GetChatHistory" $ \o -> do
    only_local <- o A..:? "only_local"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }