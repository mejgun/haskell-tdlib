-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatScheduledMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatScheduledMessages = 
 GetChatScheduledMessages { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatScheduledMessages where
 toJSON (GetChatScheduledMessages { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatScheduledMessages", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatScheduledMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatScheduledMessages" -> parseGetChatScheduledMessages v
   _ -> mempty
  where
   parseGetChatScheduledMessages :: A.Value -> T.Parser GetChatScheduledMessages
   parseGetChatScheduledMessages = A.withObject "GetChatScheduledMessages" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatScheduledMessages { chat_id = chat_id }