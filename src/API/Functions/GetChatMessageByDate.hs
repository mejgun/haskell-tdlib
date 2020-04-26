-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageByDate where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns the last message sent in a chat no later than the specified date 
-- 
-- __chat_id__ Chat identifier
-- 
-- __date__ Point in time (Unix timestamp) relative to which to search for messages
data GetChatMessageByDate = 
 GetChatMessageByDate { date :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatMessageByDate where
 toJSON (GetChatMessageByDate { date = date, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageByDate", "date" A..= date, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMessageByDate where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMessageByDate" -> parseGetChatMessageByDate v
   _ -> mempty
  where
   parseGetChatMessageByDate :: A.Value -> T.Parser GetChatMessageByDate
   parseGetChatMessageByDate = A.withObject "GetChatMessageByDate" $ \o -> do
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatMessageByDate { date = date, chat_id = chat_id }