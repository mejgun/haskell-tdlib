-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMessageTtlSetting where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes the message TTL setting (sets a new self-destruct timer) in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels
-- 
-- -Message TTL setting of a chat with the current user (Saved Messages) and the chat 777000 (Telegram) can't be changed
-- 
-- __chat_id__ Chat identifier
-- 
-- __ttl__ New TTL value, in seconds; must be one of 0, 86400, 7 * 86400, or 31 * 86400 unless the chat is secret
data SetChatMessageTtlSetting = 

 SetChatMessageTtlSetting { ttl :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatMessageTtlSetting where
 show SetChatMessageTtlSetting { ttl=ttl, chat_id=chat_id } =
  "SetChatMessageTtlSetting" ++ cc [p "ttl" ttl, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatMessageTtlSetting where
 toJSON SetChatMessageTtlSetting { ttl = ttl, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatMessageTtlSetting", "ttl" A..= ttl, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatMessageTtlSetting where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMessageTtlSetting" -> parseSetChatMessageTtlSetting v
   _ -> mempty
  where
   parseSetChatMessageTtlSetting :: A.Value -> T.Parser SetChatMessageTtlSetting
   parseSetChatMessageTtlSetting = A.withObject "SetChatMessageTtlSetting" $ \o -> do
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatMessageTtlSetting { ttl = ttl, chat_id = chat_id }
 parseJSON _ = mempty
