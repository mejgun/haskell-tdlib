{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReportChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatReportReason as ChatReportReason
import qualified Utils as U

-- |
-- Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported
data ReportChatPhoto = ReportChatPhoto
  { -- |
    text :: Maybe String,
    -- |
    reason :: Maybe ChatReportReason.ChatReportReason,
    -- |
    file_id :: Maybe Int,
    -- | Chat identifier @file_id Identifier of the photo to report. Only full photos from chatPhoto can be reported @reason The reason for reporting the chat photo @text Additional report details; 0-1024 characters
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportChatPhoto where
  show
    ReportChatPhoto
      { text = text,
        reason = reason,
        file_id = file_id,
        chat_id = chat_id
      } =
      "ReportChatPhoto"
        ++ U.cc
          [ U.p "text" text,
            U.p "reason" reason,
            U.p "file_id" file_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ReportChatPhoto where
  toJSON
    ReportChatPhoto
      { text = text,
        reason = reason,
        file_id = file_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "reportChatPhoto",
          "text" A..= text,
          "reason" A..= reason,
          "file_id" A..= file_id,
          "chat_id" A..= chat_id
        ]
