-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatSponsoredMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns sponsored message to be shown in a chat; for channel chats only. Returns a 404 error if there is no sponsored message in the chat 
-- 
-- __chat_id__ Identifier of the chat
data GetChatSponsoredMessage = 

 GetChatSponsoredMessage { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatSponsoredMessage where
 show GetChatSponsoredMessage { chat_id=chat_id } =
  "GetChatSponsoredMessage" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON GetChatSponsoredMessage where
 toJSON GetChatSponsoredMessage { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatSponsoredMessage", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatSponsoredMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatSponsoredMessage" -> parseGetChatSponsoredMessage v
   _ -> mempty
  where
   parseGetChatSponsoredMessage :: A.Value -> T.Parser GetChatSponsoredMessage
   parseGetChatSponsoredMessage = A.withObject "GetChatSponsoredMessage" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatSponsoredMessage { chat_id = chat_id }
 parseJSON _ = mempty
