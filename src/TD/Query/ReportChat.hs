{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReportChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReportReason as ReportReason
import qualified Utils as U

-- |
-- Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported
data ReportChat = ReportChat
  { -- | Additional report details; 0-1024 characters
    text :: Maybe String,
    -- | The reason for reporting the chat
    reason :: Maybe ReportReason.ReportReason,
    -- | Identifiers of reported messages; may be empty to report the whole chat
    message_ids :: Maybe [Int],
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportChat where
  show
    ReportChat
      { text = text_,
        reason = reason_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      "ReportChat"
        ++ U.cc
          [ U.p "text" text_,
            U.p "reason" reason_,
            U.p "message_ids" message_ids_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ReportChat where
  toJSON
    ReportChat
      { text = text_,
        reason = reason_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "reportChat",
          "text" A..= text_,
          "reason" A..= reason_,
          "message_ids" A..= message_ids_,
          "chat_id" A..= chat_id_
        ]
