{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for transferring chat ownership; use transferChatOwnership instead. Use addChatMember or banChatMember if some additional parameters needs to be passed
data SetChatMemberStatus = SetChatMemberStatus
  { -- |
    status :: Maybe ChatMemberStatus.ChatMemberStatus,
    -- |
    member_id :: Maybe MessageSender.MessageSender,
    -- | Chat identifier @member_id Member identifier. Chats can be only banned and unbanned in supergroups and channels @status The new status of the member in the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatMemberStatus where
  show
    SetChatMemberStatus
      { status = status_,
        member_id = member_id_,
        chat_id = chat_id_
      } =
      "SetChatMemberStatus"
        ++ U.cc
          [ U.p "status" status_,
            U.p "member_id" member_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatMemberStatus where
  toJSON
    SetChatMemberStatus
      { status = status_,
        member_id = member_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatMemberStatus",
          "status" A..= status_,
          "member_id" A..= member_id_,
          "chat_id" A..= chat_id_
        ]
