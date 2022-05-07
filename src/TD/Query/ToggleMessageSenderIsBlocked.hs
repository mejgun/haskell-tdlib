{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleMessageSenderIsBlocked where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked @sender_id Identifier of a message sender to block/unblock @is_blocked New value of is_blocked
data ToggleMessageSenderIsBlocked = ToggleMessageSenderIsBlocked
  { -- |
    is_blocked :: Maybe Bool,
    -- |
    sender_id :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show ToggleMessageSenderIsBlocked where
  show
    ToggleMessageSenderIsBlocked
      { is_blocked = is_blocked,
        sender_id = sender_id
      } =
      "ToggleMessageSenderIsBlocked"
        ++ U.cc
          [ U.p "is_blocked" is_blocked,
            U.p "sender_id" sender_id
          ]

instance T.ToJSON ToggleMessageSenderIsBlocked where
  toJSON
    ToggleMessageSenderIsBlocked
      { is_blocked = is_blocked,
        sender_id = sender_id
      } =
      A.object
        [ "@type" A..= T.String "toggleMessageSenderIsBlocked",
          "is_blocked" A..= is_blocked,
          "sender_id" A..= sender_id
        ]
