module TD.Query.ReportChat
  (ReportChat(..)
  , defaultReportChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReportReason as ReportReason
import qualified Data.Text as T

-- | Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported
data ReportChat
  = ReportChat
    { chat_id     :: Maybe Int                       -- ^ Chat identifier
    , message_ids :: Maybe [Int]                     -- ^ Identifiers of reported messages; may be empty to report the whole chat
    , reason      :: Maybe ReportReason.ReportReason -- ^ The reason for reporting the chat
    , text        :: Maybe T.Text                    -- ^ Additional report details; 0-1024 characters
    }
  deriving (Eq, Show)

instance I.ShortShow ReportChat where
  shortShow
    ReportChat
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , reason      = reason_
      , text        = text_
      }
        = "ReportChat"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "message_ids" `I.p` message_ids_
          , "reason"      `I.p` reason_
          , "text"        `I.p` text_
          ]

instance AT.ToJSON ReportChat where
  toJSON
    ReportChat
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , reason      = reason_
      , text        = text_
      }
        = A.object
          [ "@type"       A..= AT.String "reportChat"
          , "chat_id"     A..= chat_id_
          , "message_ids" A..= message_ids_
          , "reason"      A..= reason_
          , "text"        A..= text_
          ]

defaultReportChat :: ReportChat
defaultReportChat =
  ReportChat
    { chat_id     = Nothing
    , message_ids = Nothing
    , reason      = Nothing
    , text        = Nothing
    }

