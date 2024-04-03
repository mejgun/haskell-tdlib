module TD.Query.ReportChatSponsoredMessage
  (ReportChatSponsoredMessage(..)
  , defaultReportChatSponsoredMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Reports a sponsored message to Telegram moderators. Returns 'TD.Data.ReportChatSponsoredMessageResult.ReportChatSponsoredMessageResult'
data ReportChatSponsoredMessage
  = ReportChatSponsoredMessage
    { chat_id    :: Maybe Int           -- ^ Chat identifier of the sponsored message
    , message_id :: Maybe Int           -- ^ Identifier of the sponsored message
    , option_id  :: Maybe BS.ByteString -- ^ Option identifier chosen by the user; leave empty for the initial request
    }
  deriving (Eq, Show)

instance I.ShortShow ReportChatSponsoredMessage where
  shortShow
    ReportChatSponsoredMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      }
        = "ReportChatSponsoredMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "option_id"  `I.p` option_id_
          ]

instance AT.ToJSON ReportChatSponsoredMessage where
  toJSON
    ReportChatSponsoredMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      }
        = A.object
          [ "@type"      A..= AT.String "reportChatSponsoredMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "option_id"  A..= fmap I.writeBytes  option_id_
          ]

defaultReportChatSponsoredMessage :: ReportChatSponsoredMessage
defaultReportChatSponsoredMessage =
  ReportChatSponsoredMessage
    { chat_id    = Nothing
    , message_id = Nothing
    , option_id  = Nothing
    }

