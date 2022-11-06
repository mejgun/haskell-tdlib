{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UnpinAllMessageThreadMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes all pinned messages from a forum topic; requires can_pin_messages rights in the supergroup @chat_id Identifier of the chat
data UnpinAllMessageThreadMessages = UnpinAllMessageThreadMessages
  { -- | Message thread identifier in which messages will be unpinned
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show UnpinAllMessageThreadMessages where
  show
    UnpinAllMessageThreadMessages
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "UnpinAllMessageThreadMessages"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON UnpinAllMessageThreadMessages where
  toJSON
    UnpinAllMessageThreadMessages
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "unpinAllMessageThreadMessages",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
