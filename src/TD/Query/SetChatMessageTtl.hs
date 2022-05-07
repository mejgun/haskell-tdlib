{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatMessageTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the message TTL in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels
-- Message TTL can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
data SetChatMessageTtl = SetChatMessageTtl
  { -- |
    ttl :: Maybe Int,
    -- | Chat identifier @ttl New TTL value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatMessageTtl where
  show
    SetChatMessageTtl
      { ttl = ttl,
        chat_id = chat_id
      } =
      "SetChatMessageTtl"
        ++ U.cc
          [ U.p "ttl" ttl,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatMessageTtl where
  toJSON
    SetChatMessageTtl
      { ttl = ttl,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatMessageTtl",
          "ttl" A..= ttl,
          "chat_id" A..= chat_id
        ]
