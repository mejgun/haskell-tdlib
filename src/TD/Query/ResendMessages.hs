{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ResendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed.
-- If a message is re-sent, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message
data ResendMessages = ResendMessages
  { -- |
    message_ids :: Maybe [Int],
    -- | Identifier of the chat to send messages @message_ids Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ResendMessages where
  show
    ResendMessages
      { message_ids = message_ids,
        chat_id = chat_id
      } =
      "ResendMessages"
        ++ U.cc
          [ U.p "message_ids" message_ids,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ResendMessages where
  toJSON
    ResendMessages
      { message_ids = message_ids,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "resendMessages",
          "message_ids" A..= message_ids,
          "chat_id" A..= chat_id
        ]
