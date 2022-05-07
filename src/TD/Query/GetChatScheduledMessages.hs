{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatScheduledMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id) @chat_id Chat identifier
data GetChatScheduledMessages = GetChatScheduledMessages
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatScheduledMessages where
  show
    GetChatScheduledMessages
      { chat_id = chat_id
      } =
      "GetChatScheduledMessages"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatScheduledMessages where
  toJSON
    GetChatScheduledMessages
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatScheduledMessages",
          "chat_id" A..= chat_id
        ]
