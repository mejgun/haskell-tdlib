{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReportChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatReportReason as ChatReportReason
import qualified Utils as U

-- |
-- Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported
data ReportChat = ReportChat
  { -- |
    text :: Maybe String,
    -- |
    reason :: Maybe ChatReportReason.ChatReportReason,
    -- |
    message_ids :: Maybe [Int],
    -- | Chat identifier @message_ids Identifiers of reported messages; may be empty to report the whole chat @reason The reason for reporting the chat @text Additional report details; 0-1024 characters
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportChat where
  show
    ReportChat
      { text = text,
        reason = reason,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      "ReportChat"
        ++ U.cc
          [ U.p "text" text,
            U.p "reason" reason,
            U.p "message_ids" message_ids,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ReportChat where
  toJSON
    ReportChat
      { text = text,
        reason = reason,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "reportChat",
          "text" A..= text,
          "reason" A..= reason,
          "message_ids" A..= message_ids,
          "chat_id" A..= chat_id
        ]
