module TD.Data.ReportOption
  (ReportOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

data ReportOption
  = ReportOption -- ^ Describes an option to report an entity to Telegram
    { _id  :: Maybe BS.ByteString -- ^ Unique identifier of the option
    , text :: Maybe T.Text        -- ^ Text of the option
    }
  deriving (Eq, Show)

instance I.ShortShow ReportOption where
  shortShow ReportOption
    { _id  = _id_
    , text = text_
    }
      = "ReportOption"
        ++ I.cc
        [ "_id"  `I.p` _id_
        , "text" `I.p` text_
        ]

instance AT.FromJSON ReportOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportOption" -> parseReportOption v
      _              -> mempty
    
    where
      parseReportOption :: A.Value -> AT.Parser ReportOption
      parseReportOption = A.withObject "ReportOption" $ \o -> do
        _id_  <- fmap I.readBytes <$> o A..:?  "id"
        text_ <- o A..:?                       "text"
        pure $ ReportOption
          { _id  = _id_
          , text = text_
          }
  parseJSON _ = mempty

