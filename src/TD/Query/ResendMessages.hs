{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed.
-- If a message is re-sent, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message
data ResendMessages = ResendMessages
  { -- | Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
    message_ids :: Maybe [Int],
    -- | Identifier of the chat to send messages
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ResendMessages where
  show
    ResendMessages
      { message_ids = message_ids_,
        chat_id = chat_id_
      } =
      "ResendMessages"
        ++ U.cc
          [ U.p "message_ids" message_ids_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ResendMessages where
  toJSON
    ResendMessages
      { message_ids = message_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "resendMessages",
          "message_ids" A..= message_ids_,
          "chat_id" A..= chat_id_
        ]
