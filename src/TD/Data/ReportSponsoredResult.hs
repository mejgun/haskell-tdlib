module TD.Data.ReportSponsoredResult
  (ReportSponsoredResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReportOption as ReportOption

-- | Describes result of sponsored message or chat report
data ReportSponsoredResult
  = ReportSponsoredResultOk -- ^ The message was reported successfully
  | ReportSponsoredResultFailed -- ^ The sponsored message is too old or not found
  | ReportSponsoredResultOptionRequired -- ^ The user must choose an option to report the message and repeat request with the chosen option
    { title   :: Maybe T.Text                      -- ^ Title for the option choice
    , options :: Maybe [ReportOption.ReportOption] -- ^ List of available options
    }
  | ReportSponsoredResultAdsHidden -- ^ Sponsored messages were hidden for the user in all chats
  | ReportSponsoredResultPremiumRequired -- ^ The user asked to hide sponsored messages, but Telegram Premium is required for this
  deriving (Eq, Show)

instance I.ShortShow ReportSponsoredResult where
  shortShow ReportSponsoredResultOk
      = "ReportSponsoredResultOk"
  shortShow ReportSponsoredResultFailed
      = "ReportSponsoredResultFailed"
  shortShow ReportSponsoredResultOptionRequired
    { title   = title_
    , options = options_
    }
      = "ReportSponsoredResultOptionRequired"
        ++ I.cc
        [ "title"   `I.p` title_
        , "options" `I.p` options_
        ]
  shortShow ReportSponsoredResultAdsHidden
      = "ReportSponsoredResultAdsHidden"
  shortShow ReportSponsoredResultPremiumRequired
      = "ReportSponsoredResultPremiumRequired"

instance AT.FromJSON ReportSponsoredResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportSponsoredResultOk"              -> pure ReportSponsoredResultOk
      "reportSponsoredResultFailed"          -> pure ReportSponsoredResultFailed
      "reportSponsoredResultOptionRequired"  -> parseReportSponsoredResultOptionRequired v
      "reportSponsoredResultAdsHidden"       -> pure ReportSponsoredResultAdsHidden
      "reportSponsoredResultPremiumRequired" -> pure ReportSponsoredResultPremiumRequired
      _                                      -> mempty
    
    where
      parseReportSponsoredResultOptionRequired :: A.Value -> AT.Parser ReportSponsoredResult
      parseReportSponsoredResultOptionRequired = A.withObject "ReportSponsoredResultOptionRequired" $ \o -> do
        title_   <- o A..:?  "title"
        options_ <- o A..:?  "options"
        pure $ ReportSponsoredResultOptionRequired
          { title   = title_
          , options = options_
          }
  parseJSON _ = mempty

