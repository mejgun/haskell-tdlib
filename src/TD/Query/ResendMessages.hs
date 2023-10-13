module TD.Query.ResendMessages(ResendMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ResendMessages -- ^ Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed. If a message is re-sent, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message
  = ResendMessages
    { chat_id     :: Maybe Int   -- ^ Identifier of the chat to send messages
    , message_ids :: Maybe [Int] -- ^ Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
    }
  deriving (Eq)

instance Show ResendMessages where
  show
    ResendMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      }
        = "ResendMessages"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "message_ids" `I.p` message_ids_
          ]

instance AT.ToJSON ResendMessages where
  toJSON
    ResendMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      }
        = A.object
          [ "@type"       A..= AT.String "resendMessages"
          , "chat_id"     A..= chat_id_
          , "message_ids" A..= message_ids_
          ]
