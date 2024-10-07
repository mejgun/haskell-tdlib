module TD.Data.ReportStoryResult
  (ReportStoryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReportOption as ReportOption
import qualified Data.ByteString as BS

-- | Describes result of story report
data ReportStoryResult
  = ReportStoryResultOk -- ^ The story was reported successfully
  | ReportStoryResultOptionRequired -- ^ The user must choose an option to report the story and repeat request with the chosen option
    { title   :: Maybe T.Text                      -- ^ Title for the option choice
    , options :: Maybe [ReportOption.ReportOption] -- ^ List of available options
    }
  | ReportStoryResultTextRequired -- ^ The user must add additional text details to the report
    { option_id   :: Maybe BS.ByteString -- ^ Option identifier for the next reportStory request
    , is_optional :: Maybe Bool          -- ^ True, if the user can skip text adding
    }
  deriving (Eq, Show)

instance I.ShortShow ReportStoryResult where
  shortShow ReportStoryResultOk
      = "ReportStoryResultOk"
  shortShow ReportStoryResultOptionRequired
    { title   = title_
    , options = options_
    }
      = "ReportStoryResultOptionRequired"
        ++ I.cc
        [ "title"   `I.p` title_
        , "options" `I.p` options_
        ]
  shortShow ReportStoryResultTextRequired
    { option_id   = option_id_
    , is_optional = is_optional_
    }
      = "ReportStoryResultTextRequired"
        ++ I.cc
        [ "option_id"   `I.p` option_id_
        , "is_optional" `I.p` is_optional_
        ]

instance AT.FromJSON ReportStoryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportStoryResultOk"             -> pure ReportStoryResultOk
      "reportStoryResultOptionRequired" -> parseReportStoryResultOptionRequired v
      "reportStoryResultTextRequired"   -> parseReportStoryResultTextRequired v
      _                                 -> mempty
    
    where
      parseReportStoryResultOptionRequired :: A.Value -> AT.Parser ReportStoryResult
      parseReportStoryResultOptionRequired = A.withObject "ReportStoryResultOptionRequired" $ \o -> do
        title_   <- o A..:?  "title"
        options_ <- o A..:?  "options"
        pure $ ReportStoryResultOptionRequired
          { title   = title_
          , options = options_
          }
      parseReportStoryResultTextRequired :: A.Value -> AT.Parser ReportStoryResult
      parseReportStoryResultTextRequired = A.withObject "ReportStoryResultTextRequired" $ \o -> do
        option_id_   <- fmap I.readBytes <$> o A..:?  "option_id"
        is_optional_ <- o A..:?                       "is_optional"
        pure $ ReportStoryResultTextRequired
          { option_id   = option_id_
          , is_optional = is_optional_
          }
  parseJSON _ = mempty

