module TD.Query.ReportChat
  (ReportChat(..)
  , defaultReportChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported. Returns 'TD.Data.ReportChatResult.ReportChatResult'
data ReportChat
  = ReportChat
    { chat_id     :: Maybe Int           -- ^ Chat identifier
    , option_id   :: Maybe BS.ByteString -- ^ Option identifier chosen by the user; leave empty for the initial request
    , message_ids :: Maybe [Int]         -- ^ Identifiers of reported messages. Use messageProperties.can_report_chat to check whether the message can be reported
    , text        :: Maybe T.Text        -- ^ Additional report details if asked by the server; 0-1024 characters; leave empty for the initial request
    }
  deriving (Eq, Show)

instance I.ShortShow ReportChat where
  shortShow
    ReportChat
      { chat_id     = chat_id_
      , option_id   = option_id_
      , message_ids = message_ids_
      , text        = text_
      }
        = "ReportChat"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "option_id"   `I.p` option_id_
          , "message_ids" `I.p` message_ids_
          , "text"        `I.p` text_
          ]

instance AT.ToJSON ReportChat where
  toJSON
    ReportChat
      { chat_id     = chat_id_
      , option_id   = option_id_
      , message_ids = message_ids_
      , text        = text_
      }
        = A.object
          [ "@type"       A..= AT.String "reportChat"
          , "chat_id"     A..= chat_id_
          , "option_id"   A..= fmap I.writeBytes  option_id_
          , "message_ids" A..= message_ids_
          , "text"        A..= text_
          ]

defaultReportChat :: ReportChat
defaultReportChat =
  ReportChat
    { chat_id     = Nothing
    , option_id   = Nothing
    , message_ids = Nothing
    , text        = Nothing
    }

