module TD.Query.ReportVideoMessageAdvertisement
  (ReportVideoMessageAdvertisement(..)
  , defaultReportVideoMessageAdvertisement
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Reports a video message advertisement to Telegram moderators. Returns 'TD.Data.ReportSponsoredResult.ReportSponsoredResult'
data ReportVideoMessageAdvertisement
  = ReportVideoMessageAdvertisement
    { advertisement_unique_id :: Maybe Int           -- ^ Unique identifier of the advertisement
    , option_id               :: Maybe BS.ByteString -- ^ Option identifier chosen by the user; leave empty for the initial request
    }
  deriving (Eq, Show)

instance I.ShortShow ReportVideoMessageAdvertisement where
  shortShow
    ReportVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      , option_id               = option_id_
      }
        = "ReportVideoMessageAdvertisement"
          ++ I.cc
          [ "advertisement_unique_id" `I.p` advertisement_unique_id_
          , "option_id"               `I.p` option_id_
          ]

instance AT.ToJSON ReportVideoMessageAdvertisement where
  toJSON
    ReportVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      , option_id               = option_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "reportVideoMessageAdvertisement"
          , "advertisement_unique_id" A..= advertisement_unique_id_
          , "option_id"               A..= fmap I.writeBytes  option_id_
          ]

defaultReportVideoMessageAdvertisement :: ReportVideoMessageAdvertisement
defaultReportVideoMessageAdvertisement =
  ReportVideoMessageAdvertisement
    { advertisement_unique_id = Nothing
    , option_id               = Nothing
    }

