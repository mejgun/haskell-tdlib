-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatHistory where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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