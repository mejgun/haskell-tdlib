{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.StopPoll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag set
data StopPoll = StopPoll
  { -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message containing the poll
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the poll belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show StopPoll where
  show
    StopPoll
      { reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "StopPoll"
        ++ U.cc
          [ U.p "reply_markup" reply_markup_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON StopPoll where
  toJSON
    StopPoll
      { reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "stopPoll",
          "reply_markup" A..= reply_markup_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
