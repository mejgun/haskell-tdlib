-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatPinnedMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatPinnedMessage = 
 GetChatPinnedMessage { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatPinnedMessage where
 toJSON (GetChatPinnedMessage { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatPinnedMessage", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatPinnedMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatPinnedMessage" -> parseGetChatPinnedMessage v
   _ -> mempty
  where
   parseGetChatPinnedMessage :: A.Value -> T.Parser GetChatPinnedMessage
   parseGetChatPinnedMessage = A.withObject "GetChatPinnedMessage" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatPinnedMessage { chat_id = chat_id }