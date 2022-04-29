-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BanChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
-- 
-- __chat_id__ Chat identifier
-- 
-- __member_id__ Member identifier
-- 
-- __banned_until_date__ Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
-- 
-- __revoke_messages__ Pass true to delete all messages in the chat for the user that is being removed. Always true for supergroups and channels
data BanChatMember = 

 BanChatMember { revoke_messages :: Maybe Bool, banned_until_date :: Maybe Int, member_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show BanChatMember where
 show BanChatMember { revoke_messages=revoke_messages, banned_until_date=banned_until_date, member_id=member_id, chat_id=chat_id } =
  "BanChatMember" ++ cc [p "revoke_messages" revoke_messages, p "banned_until_date" banned_until_date, p "member_id" member_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON BanChatMember where
 toJSON BanChatMember { revoke_messages = revoke_messages, banned_until_date = banned_until_date, member_id = member_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "banChatMember", "revoke_messages" A..= revoke_messages, "banned_until_date" A..= banned_until_date, "member_id" A..= member_id, "chat_id" A..= chat_id ]

instance T.FromJSON BanChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "banChatMember" -> parseBanChatMember v
   _ -> mempty
  where
   parseBanChatMember :: A.Value -> T.Parser BanChatMember
   parseBanChatMember = A.withObject "BanChatMember" $ \o -> do
    revoke_messages <- o A..:? "revoke_messages"
    banned_until_date <- mconcat [ o A..:? "banned_until_date", readMaybe <$> (o A..: "banned_until_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_id <- o A..:? "member_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BanChatMember { revoke_messages = revoke_messages, banned_until_date = banned_until_date, member_id = member_id, chat_id = chat_id }
 parseJSON _ = mempty
