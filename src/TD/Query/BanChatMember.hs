{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.BanChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
data BanChatMember = BanChatMember
  { -- | Pass true to delete all messages in the chat for the user that is being removed. Always true for supergroups and channels
    revoke_messages :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
    banned_until_date :: Maybe Int,
    -- | Member identifier
    member_id :: Maybe MessageSender.MessageSender,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show BanChatMember where
  show
    BanChatMember
      { revoke_messages = revoke_messages_,
        banned_until_date = banned_until_date_,
        member_id = member_id_,
        chat_id = chat_id_
      } =
      "BanChatMember"
        ++ U.cc
          [ U.p "revoke_messages" revoke_messages_,
            U.p "banned_until_date" banned_until_date_,
            U.p "member_id" member_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON BanChatMember where
  toJSON
    BanChatMember
      { revoke_messages = revoke_messages_,
        banned_until_date = banned_until_date_,
        member_id = member_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "banChatMember",
          "revoke_messages" A..= revoke_messages_,
          "banned_until_date" A..= banned_until_date_,
          "member_id" A..= member_id_,
          "chat_id" A..= chat_id_
        ]
