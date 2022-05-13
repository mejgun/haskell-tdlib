{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditMessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState
import qualified Utils as U

-- |
-- Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed
data EditMessageSchedulingState = EditMessageSchedulingState
  { -- | The new message scheduling state; pass null to send the message immediately
    scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageSchedulingState where
  show
    EditMessageSchedulingState
      { scheduling_state = scheduling_state_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "EditMessageSchedulingState"
        ++ U.cc
          [ U.p "scheduling_state" scheduling_state_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditMessageSchedulingState where
  toJSON
    EditMessageSchedulingState
      { scheduling_state = scheduling_state_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editMessageSchedulingState",
          "scheduling_state" A..= scheduling_state_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
