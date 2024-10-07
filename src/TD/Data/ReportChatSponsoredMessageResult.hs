module TD.Data.ReportChatSponsoredMessageResult
  (ReportChatSponsoredMessageResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReportOption as ReportOption

-- | Describes result of sponsored message report
data ReportChatSponsoredMessageResult
  = ReportChatSponsoredMessageResultOk -- ^ The message was reported successfully
  | ReportChatSponsoredMessageResultFailed -- ^ The sponsored message is too old or not found
  | ReportChatSponsoredMessageResultOptionRequired -- ^ The user must choose an option to report the message and repeat request with the chosen option
    { title   :: Maybe T.Text                      -- ^ Title for the option choice
    , options :: Maybe [ReportOption.ReportOption] -- ^ List of available options
    }
  | ReportChatSponsoredMessageResultAdsHidden -- ^ Sponsored messages were hidden for the user in all chats
  | ReportChatSponsoredMessageResultPremiumRequired -- ^ The user asked to hide sponsored messages, but Telegram Premium is required for this
  deriving (Eq, Show)

instance I.ShortShow ReportChatSponsoredMessageResult where
  shortShow ReportChatSponsoredMessageResultOk
      = "ReportChatSponsoredMessageResultOk"
  shortShow ReportChatSponsoredMessageResultFailed
      = "ReportChatSponsoredMessageResultFailed"
  shortShow ReportChatSponsoredMessageResultOptionRequired
    { title   = title_
    , options = options_
    }
      = "ReportChatSponsoredMessageResultOptionRequired"
        ++ I.cc
        [ "title"   `I.p` title_
        , "options" `I.p` options_
        ]
  shortShow ReportChatSponsoredMessageResultAdsHidden
      = "ReportChatSponsoredMessageResultAdsHidden"
  shortShow ReportChatSponsoredMessageResultPremiumRequired
      = "ReportChatSponsoredMessageResultPremiumRequired"

instance AT.FromJSON ReportChatSponsoredMessageResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportChatSponsoredMessageResultOk"              -> pure ReportChatSponsoredMessageResultOk
      "reportChatSponsoredMessageResultFailed"          -> pure ReportChatSponsoredMessageResultFailed
      "reportChatSponsoredMessageResultOptionRequired"  -> parseReportChatSponsoredMessageResultOptionRequired v
      "reportChatSponsoredMessageResultAdsHidden"       -> pure ReportChatSponsoredMessageResultAdsHidden
      "reportChatSponsoredMessageResultPremiumRequired" -> pure ReportChatSponsoredMessageResultPremiumRequired
      _                                                 -> mempty
    
    where
      parseReportChatSponsoredMessageResultOptionRequired :: A.Value -> AT.Parser ReportChatSponsoredMessageResult
      parseReportChatSponsoredMessageResultOptionRequired = A.withObject "ReportChatSponsoredMessageResultOptionRequired" $ \o -> do
        title_   <- o A..:?  "title"
        options_ <- o A..:?  "options"
        pure $ ReportChatSponsoredMessageResultOptionRequired
          { title   = title_
          , options = options_
          }
  parseJSON _ = mempty

