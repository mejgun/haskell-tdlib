-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMessageTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the message TTL in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels
-- 
-- -Message TTL can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
-- 
-- __chat_id__ Chat identifier
-- 
-- __ttl__ New TTL value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400
data SetChatMessageTtl = 

 SetChatMessageTtl { ttl :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatMessageTtl where
 show SetChatMessageTtl { ttl=ttl, chat_id=chat_id } =
  "SetChatMessageTtl" ++ U.cc [U.p "ttl" ttl, U.p "chat_id" chat_id ]

instance T.ToJSON SetChatMessageTtl where
 toJSON SetChatMessageTtl { ttl = ttl, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatMessageTtl", "ttl" A..= ttl, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatMessageTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMessageTtl" -> parseSetChatMessageTtl v
   _ -> mempty
  where
   parseSetChatMessageTtl :: A.Value -> T.Parser SetChatMessageTtl
   parseSetChatMessageTtl = A.withObject "SetChatMessageTtl" $ \o -> do
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatMessageTtl { ttl = ttl, chat_id = chat_id }
 parseJSON _ = mempty
