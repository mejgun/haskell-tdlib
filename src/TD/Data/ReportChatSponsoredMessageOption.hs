module TD.Data.ReportChatSponsoredMessageOption
  (ReportChatSponsoredMessageOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

data ReportChatSponsoredMessageOption
  = ReportChatSponsoredMessageOption -- ^ Describes an option to report a sponsored message
    { _id  :: Maybe BS.ByteString -- ^ Unique identifier of the option
    , text :: Maybe T.Text        -- ^ Text of the option
    }
  deriving (Eq, Show)

instance I.ShortShow ReportChatSponsoredMessageOption where
  shortShow ReportChatSponsoredMessageOption
    { _id  = _id_
    , text = text_
    }
      = "ReportChatSponsoredMessageOption"
        ++ I.cc
        [ "_id"  `I.p` _id_
        , "text" `I.p` text_
        ]

instance AT.FromJSON ReportChatSponsoredMessageOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportChatSponsoredMessageOption" -> parseReportChatSponsoredMessageOption v
      _                                  -> mempty
    
    where
      parseReportChatSponsoredMessageOption :: A.Value -> AT.Parser ReportChatSponsoredMessageOption
      parseReportChatSponsoredMessageOption = A.withObject "ReportChatSponsoredMessageOption" $ \o -> do
        _id_  <- fmap I.readBytes <$> o A..:?  "id"
        text_ <- o A..:?                       "text"
        pure $ ReportChatSponsoredMessageOption
          { _id  = _id_
          , text = text_
          }
  parseJSON _ = mempty

