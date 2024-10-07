module TD.Data.ReportChatResult
  (ReportChatResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReportOption as ReportOption
import qualified Data.ByteString as BS

-- | Describes result of chat report
data ReportChatResult
  = ReportChatResultOk -- ^ The chat was reported successfully
  | ReportChatResultOptionRequired -- ^ The user must choose an option to report the chat and repeat request with the chosen option
    { title   :: Maybe T.Text                      -- ^ Title for the option choice
    , options :: Maybe [ReportOption.ReportOption] -- ^ List of available options
    }
  | ReportChatResultTextRequired -- ^ The user must add additional text details to the report
    { option_id   :: Maybe BS.ByteString -- ^ Option identifier for the next reportChat request
    , is_optional :: Maybe Bool          -- ^ True, if the user can skip text adding
    }
  | ReportChatResultMessagesRequired -- ^ The user must choose messages to report and repeat the reportChat request with the chosen messages
  deriving (Eq, Show)

instance I.ShortShow ReportChatResult where
  shortShow ReportChatResultOk
      = "ReportChatResultOk"
  shortShow ReportChatResultOptionRequired
    { title   = title_
    , options = options_
    }
      = "ReportChatResultOptionRequired"
        ++ I.cc
        [ "title"   `I.p` title_
        , "options" `I.p` options_
        ]
  shortShow ReportChatResultTextRequired
    { option_id   = option_id_
    , is_optional = is_optional_
    }
      = "ReportChatResultTextRequired"
        ++ I.cc
        [ "option_id"   `I.p` option_id_
        , "is_optional" `I.p` is_optional_
        ]
  shortShow ReportChatResultMessagesRequired
      = "ReportChatResultMessagesRequired"

instance AT.FromJSON ReportChatResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportChatResultOk"               -> pure ReportChatResultOk
      "reportChatResultOptionRequired"   -> parseReportChatResultOptionRequired v
      "reportChatResultTextRequired"     -> parseReportChatResultTextRequired v
      "reportChatResultMessagesRequired" -> pure ReportChatResultMessagesRequired
      _                                  -> mempty
    
    where
      parseReportChatResultOptionRequired :: A.Value -> AT.Parser ReportChatResult
      parseReportChatResultOptionRequired = A.withObject "ReportChatResultOptionRequired" $ \o -> do
        title_   <- o A..:?  "title"
        options_ <- o A..:?  "options"
        pure $ ReportChatResultOptionRequired
          { title   = title_
          , options = options_
          }
      parseReportChatResultTextRequired :: A.Value -> AT.Parser ReportChatResult
      parseReportChatResultTextRequired = A.withObject "ReportChatResultTextRequired" $ \o -> do
        option_id_   <- fmap I.readBytes <$> o A..:?  "option_id"
        is_optional_ <- o A..:?                       "is_optional"
        pure $ ReportChatResultTextRequired
          { option_id   = option_id_
          , is_optional = is_optional_
          }
  parseJSON _ = mempty

