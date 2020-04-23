-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMember where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

data ChatMember = 
 ChatMember { bot_info :: Maybe BotInfo.BotInfo, status :: Maybe ChatMemberStatus.ChatMemberStatus, joined_chat_date :: Maybe Int, inviter_user_id :: Maybe Int, user_id :: Maybe Int }  deriving (Show)

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
    bot_info <- optional $ o A..: "bot_info"
    status <- optional $ o A..: "status"
    joined_chat_date <- optional $ o A..: "joined_chat_date"
    inviter_user_id <- optional $ o A..: "inviter_user_id"
    user_id <- optional $ o A..: "user_id"
    return $ ChatMember { bot_info = bot_info, status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, user_id = user_id }