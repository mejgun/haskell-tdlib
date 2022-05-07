{-# LANGUAGE OverloadedStrings #-}

module TD.Query.UnpinAllChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes all pinned messages from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel @chat_id Identifier of the chat
data UnpinAllChatMessages = UnpinAllChatMessages
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show UnpinAllChatMessages where
  show
    UnpinAllChatMessages
      { chat_id = chat_id
      } =
      "UnpinAllChatMessages"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON UnpinAllChatMessages where
  toJSON
    UnpinAllChatMessages
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "unpinAllChatMessages",
          "chat_id" A..= chat_id
        ]
