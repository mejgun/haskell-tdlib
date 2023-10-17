module TD.Data.DeepLinkInfo
  (DeepLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data DeepLinkInfo
  = DeepLinkInfo -- ^ Contains information about a tg: deep link
    { text                    :: Maybe FormattedText.FormattedText -- ^ Text to be shown to the user
    , need_update_application :: Maybe Bool                        -- ^ True, if the user must be asked to update the application
    }
  deriving (Eq, Show)

instance I.ShortShow DeepLinkInfo where
  shortShow DeepLinkInfo
    { text                    = text_
    , need_update_application = need_update_application_
    }
      = "DeepLinkInfo"
        ++ I.cc
        [ "text"                    `I.p` text_
        , "need_update_application" `I.p` need_update_application_
        ]

instance AT.FromJSON DeepLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "deepLinkInfo" -> parseDeepLinkInfo v
      _              -> mempty
    
    where
      parseDeepLinkInfo :: A.Value -> AT.Parser DeepLinkInfo
      parseDeepLinkInfo = A.withObject "DeepLinkInfo" $ \o -> do
        text_                    <- o A..:?  "text"
        need_update_application_ <- o A..:?  "need_update_application"
        pure $ DeepLinkInfo
          { text                    = text_
          , need_update_application = need_update_application_
          }
  parseJSON _ = mempty

