{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ViewMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button). Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
data ViewMessages = ViewMessages
  { -- | Pass true to mark as read the specified messages even the chat is closed
    force_read :: Maybe Bool,
    -- | The identifiers of the messages being viewed
    message_ids :: Maybe [Int],
    -- | If not 0, a message thread identifier in which the messages are being viewed
    message_thread_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ViewMessages where
  show
    ViewMessages
      { force_read = force_read,
        message_ids = message_ids,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      "ViewMessages"
        ++ U.cc
          [ U.p "force_read" force_read,
            U.p "message_ids" message_ids,
            U.p "message_thread_id" message_thread_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ViewMessages where
  toJSON
    ViewMessages
      { force_read = force_read,
        message_ids = message_ids,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "viewMessages",
          "force_read" A..= force_read,
          "message_ids" A..= message_ids,
          "message_thread_id" A..= message_thread_id,
          "chat_id" A..= chat_id
        ]
