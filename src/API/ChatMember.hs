-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

--main = putStrLn "ok"

data ChatMember = 
 ChatMember { bot_info :: BotInfo.BotInfo, status :: ChatMemberStatus.ChatMemberStatus, joined_chat_date :: Int, inviter_user_id :: Int, user_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatMember where
 toJSON (ChatMember { bot_info = bot_info, status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatMember", "bot_info" A..= bot_info, "status" A..= status, "joined_chat_date" A..= joined_chat_date, "inviter_user_id" A..= inviter_user_id, "user_id" A..= user_id ]
-- chatMember ChatMember  { bot_info :: BotInfo.BotInfo, status :: ChatMemberStatus.ChatMemberStatus, joined_chat_date :: Int, inviter_user_id :: Int, user_id :: Int } 

