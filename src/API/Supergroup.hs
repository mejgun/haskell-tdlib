-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Supergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

--main = putStrLn "ok"

data Supergroup = 
 Supergroup { is_scam :: Bool, restriction_reason :: String, is_verified :: Bool, is_channel :: Bool, is_slow_mode_enabled :: Bool, sign_messages :: Bool, has_location :: Bool, has_linked_chat :: Bool, member_count :: Int, status :: ChatMemberStatus.ChatMemberStatus, date :: Int, username :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON Supergroup where
 toJSON (Supergroup { is_scam = is_scam, restriction_reason = restriction_reason, is_verified = is_verified, is_channel = is_channel, is_slow_mode_enabled = is_slow_mode_enabled, sign_messages = sign_messages, has_location = has_location, has_linked_chat = has_linked_chat, member_count = member_count, status = status, date = date, username = username, _id = _id }) =
  A.object [ "@type" A..= T.String "supergroup", "is_scam" A..= is_scam, "restriction_reason" A..= restriction_reason, "is_verified" A..= is_verified, "is_channel" A..= is_channel, "is_slow_mode_enabled" A..= is_slow_mode_enabled, "sign_messages" A..= sign_messages, "has_location" A..= has_location, "has_linked_chat" A..= has_linked_chat, "member_count" A..= member_count, "status" A..= status, "date" A..= date, "username" A..= username, "id" A..= _id ]
-- supergroup Supergroup  { is_scam :: Bool, restriction_reason :: String, is_verified :: Bool, is_channel :: Bool, is_slow_mode_enabled :: Bool, sign_messages :: Bool, has_location :: Bool, has_linked_chat :: Bool, member_count :: Int, status :: ChatMemberStatus.ChatMemberStatus, date :: Int, username :: String, _id :: Int } 

