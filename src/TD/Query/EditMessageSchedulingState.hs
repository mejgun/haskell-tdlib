module TD.Query.EditMessageSchedulingState
  (EditMessageSchedulingState(..)
  , defaultEditMessageSchedulingState
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState

-- | Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed. Returns 'TD.Data.Ok.Ok'
data EditMessageSchedulingState
  = EditMessageSchedulingState
    { chat_id          :: Maybe Int                                           -- ^ The chat the message belongs to
    , message_id       :: Maybe Int                                           -- ^ Identifier of the message. Use messageProperties.can_edit_scheduling_state to check whether the message is suitable
    , scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState -- ^ The new message scheduling state; pass null to send the message immediately. Must be null for messages in the state messageSchedulingStateSendWhenVideoProcessed
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageSchedulingState where
  shortShow
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

defaultEditMessageSchedulingState :: EditMessageSchedulingState
defaultEditMessageSchedulingState =
  EditMessageSchedulingState
    { chat_id          = Nothing
    , message_id       = Nothing
    , scheduling_state = Nothing
    }

