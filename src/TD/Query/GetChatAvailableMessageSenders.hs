{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatAvailableMessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of message sender identifiers, which can be used to send messages in a chat @chat_id Chat identifier
data GetChatAvailableMessageSenders = GetChatAvailableMessageSenders
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatAvailableMessageSenders where
  show
    GetChatAvailableMessageSenders
      { chat_id = chat_id
      } =
      "GetChatAvailableMessageSenders"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatAvailableMessageSenders where
  toJSON
    GetChatAvailableMessageSenders
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatAvailableMessageSenders",
          "chat_id" A..= chat_id
        ]
