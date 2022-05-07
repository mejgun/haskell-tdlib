{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetPollAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the user answer to a poll. A poll in quiz mode can be answered only once
data SetPollAnswer = SetPollAnswer
  { -- | 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only is the poll allows multiple answers
    option_ids :: Maybe [Int],
    -- | Identifier of the message containing the poll
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the poll belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetPollAnswer where
  show
    SetPollAnswer
      { option_ids = option_ids,
        message_id = message_id,
        chat_id = chat_id
      } =
      "SetPollAnswer"
        ++ U.cc
          [ U.p "option_ids" option_ids,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetPollAnswer where
  toJSON
    SetPollAnswer
      { option_ids = option_ids,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setPollAnswer",
          "option_ids" A..= option_ids,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
