module TD.Query.EditMessageSchedulingState(EditMessageSchedulingState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState

data EditMessageSchedulingState -- ^ Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed
  = EditMessageSchedulingState
    { chat_id          :: Maybe Int                                           -- ^ The chat the message belongs to
    , message_id       :: Maybe Int                                           -- ^ Identifier of the message
    , scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState -- ^ The new message scheduling state; pass null to send the message immediately
    }
  deriving (Eq)

instance Show EditMessageSchedulingState where
  show
    EditMessageSchedulingState
      { chat_id          = chat_id_
      , message_id       = message_id_
      , scheduling_state = scheduling_state_
      }
        = "EditMessageSchedulingState"
          ++ I.cc
          [ "chat_id"          `I.p` chat_id_
          , "message_id"       `I.p` message_id_
          , "scheduling_state" `I.p` scheduling_state_
          ]

instance AT.ToJSON EditMessageSchedulingState where
  toJSON
    EditMessageSchedulingState
      { chat_id          = chat_id_
      , message_id       = message_id_
      , scheduling_state = scheduling_state_
      }
        = A.object
          [ "@type"            A..= AT.String "editMessageSchedulingState"
          , "chat_id"          A..= chat_id_
          , "message_id"       A..= message_id_
          , "scheduling_state" A..= scheduling_state_
          ]
