module TD.Query.ReportSponsoredChat
  (ReportSponsoredChat(..)
  , defaultReportSponsoredChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Reports a sponsored chat to Telegram moderators. Returns 'TD.Data.ReportSponsoredResult.ReportSponsoredResult'
data ReportSponsoredChat
  = ReportSponsoredChat
    { sponsored_chat_unique_id :: Maybe Int           -- ^ Unique identifier of the sponsored chat
    , option_id                :: Maybe BS.ByteString -- ^ Option identifier chosen by the user; leave empty for the initial request
    }
  deriving (Eq, Show)

instance I.ShortShow ReportSponsoredChat where
  shortShow
    ReportSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      , option_id                = option_id_
      }
        = "ReportSponsoredChat"
          ++ I.cc
          [ "sponsored_chat_unique_id" `I.p` sponsored_chat_unique_id_
          , "option_id"                `I.p` option_id_
          ]

instance AT.ToJSON ReportSponsoredChat where
  toJSON
    ReportSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      , option_id                = option_id_
      }
        = A.object
          [ "@type"                    A..= AT.String "reportSponsoredChat"
          , "sponsored_chat_unique_id" A..= sponsored_chat_unique_id_
          , "option_id"                A..= fmap I.writeBytes  option_id_
          ]

defaultReportSponsoredChat :: ReportSponsoredChat
defaultReportSponsoredChat =
  ReportSponsoredChat
    { sponsored_chat_unique_id = Nothing
    , option_id                = Nothing
    }

