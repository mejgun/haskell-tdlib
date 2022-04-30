-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatAvailableMessageSenders where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns list of message sender identifiers, which can be used to send messages in a chat 
-- 
-- __chat_id__ Chat identifier
data GetChatAvailableMessageSenders = 

 GetChatAvailableMessageSenders { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatAvailableMessageSenders where
 show GetChatAvailableMessageSenders { chat_id=chat_id } =
  "GetChatAvailableMessageSenders" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON GetChatAvailableMessageSenders where
 toJSON GetChatAvailableMessageSenders { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatAvailableMessageSenders", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatAvailableMessageSenders where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatAvailableMessageSenders" -> parseGetChatAvailableMessageSenders v
   _ -> mempty
  where
   parseGetChatAvailableMessageSenders :: A.Value -> T.Parser GetChatAvailableMessageSenders
   parseGetChatAvailableMessageSenders = A.withObject "GetChatAvailableMessageSenders" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatAvailableMessageSenders { chat_id = chat_id }
 parseJSON _ = mempty
