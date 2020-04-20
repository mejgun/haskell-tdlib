-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

--main = putStrLn "ok"

data SetChatMemberStatus = 
 SetChatMemberStatus { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatMemberStatus where
 toJSON (SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatMemberStatus", "status" A..= status, "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- setChatMemberStatus SetChatMemberStatus  { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int, chat_id :: Int } 

