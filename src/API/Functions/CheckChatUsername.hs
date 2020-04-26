-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChatUsername where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Checks whether a username can be set for a chat 
-- 
-- __chat_id__ Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created
-- 
-- __username__ Username to be checked
data CheckChatUsername = 
 CheckChatUsername { username :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CheckChatUsername where
 toJSON (CheckChatUsername { username = username, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "checkChatUsername", "username" A..= username, "chat_id" A..= chat_id ]

instance T.FromJSON CheckChatUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChatUsername" -> parseCheckChatUsername v
   _ -> mempty
  where
   parseCheckChatUsername :: A.Value -> T.Parser CheckChatUsername
   parseCheckChatUsername = A.withObject "CheckChatUsername" $ \o -> do
    username <- o A..:? "username"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CheckChatUsername { username = username, chat_id = chat_id }