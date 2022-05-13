{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatPinnedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a newest pinned message in the chat @chat_id Identifier of the chat the message belongs to
data GetChatPinnedMessage = GetChatPinnedMessage
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatPinnedMessage where
  show
    GetChatPinnedMessage
      { chat_id = chat_id_
      } =
      "GetChatPinnedMessage"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatPinnedMessage where
  toJSON
    GetChatPinnedMessage
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatPinnedMessage",
          "chat_id" A..= chat_id_
        ]
