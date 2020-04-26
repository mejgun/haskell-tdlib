-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

-- |
-- 
-- A user with information about joining/leaving a chat 
-- 
-- __user_id__ User identifier of the chat member
-- 
-- __inviter_user_id__ Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
-- 
-- __joined_chat_date__ Point in time (Unix timestamp) when the user joined a chat
-- 
-- __status__ Status of the member in the chat
-- 
-- __bot_info__ If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not a chat member
data ChatMember = 
 ChatMember { bot_info :: Maybe BotInfo.BotInfo, status :: Maybe ChatMemberStatus.ChatMemberStatus, joined_chat_date :: Maybe Int, inviter_user_id :: Maybe Int, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatMember where
 toJSON (ChatMember { bot_info = bot_info, status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatMember", "bot_info" A..= bot_info, "status" A..= status, "joined_chat_date" A..= joined_chat_date, "inviter_user_id" A..= inviter_user_id, "user_id" A..= user_id ]

instance T.FromJSON ChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMember" -> parseChatMember v
   _ -> mempty
  where
   parseChatMember :: A.Value -> T.Parser ChatMember
   parseChatMember = A.withObject "ChatMember" $ \o -> do
    bot_info <- o A..:? "bot_info"
    status <- o A..:? "status"
    joined_chat_date <- mconcat [ o A..:? "joined_chat_date", readMaybe <$> (o A..: "joined_chat_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    inviter_user_id <- mconcat [ o A..:? "inviter_user_id", readMaybe <$> (o A..: "inviter_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatMember { bot_info = bot_info, status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, user_id = user_id }