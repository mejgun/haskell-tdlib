{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UnpinChatMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a pinned message from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel @chat_id Identifier of the chat @message_id Identifier of the removed pinned message
data UnpinChatMessage = UnpinChatMessage
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show UnpinChatMessage where
  show
    UnpinChatMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "UnpinChatMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON UnpinChatMessage where
  toJSON
    UnpinChatMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "unpinChatMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
