module TD.Query.ReportChatPhoto
  (ReportChatPhoto(..)
  , defaultReportChatPhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReportReason as ReportReason
import qualified Data.Text as T

-- | Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported. Returns 'TD.Data.Ok.Ok'
data ReportChatPhoto
  = ReportChatPhoto
    { chat_id :: Maybe Int                       -- ^ Chat identifier
    , file_id :: Maybe Int                       -- ^ Identifier of the photo to report. Only full photos from chatPhoto can be reported
    , reason  :: Maybe ReportReason.ReportReason -- ^ The reason for reporting the chat photo
    , text    :: Maybe T.Text                    -- ^ Additional report details; 0-1024 characters
    }
  deriving (Eq, Show)

instance I.ShortShow ReportChatPhoto where
  shortShow
    ReportChatPhoto
      { chat_id = chat_id_
      , file_id = file_id_
      , reason  = reason_
      , text    = text_
      }
        = "ReportChatPhoto"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "file_id" `I.p` file_id_
          , "reason"  `I.p` reason_
          , "text"    `I.p` text_
          ]

instance AT.ToJSON ReportChatPhoto where
  toJSON
    ReportChatPhoto
      { chat_id = chat_id_
      , file_id = file_id_
      , reason  = reason_
      , text    = text_
      }
        = A.object
          [ "@type"   A..= AT.String "reportChatPhoto"
          , "chat_id" A..= chat_id_
          , "file_id" A..= file_id_
          , "reason"  A..= reason_
          , "text"    A..= text_
          ]

defaultReportChatPhoto :: ReportChatPhoto
defaultReportChatPhoto =
  ReportChatPhoto
    { chat_id = Nothing
    , file_id = Nothing
    , reason  = Nothing
    , text    = Nothing
    }

