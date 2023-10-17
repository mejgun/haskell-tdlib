module TD.Data.TMeUrls
  (TMeUrls(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TMeUrl as TMeUrl

data TMeUrls
  = TMeUrls -- ^ Contains a list of t.me URLs
    { urls :: Maybe [TMeUrl.TMeUrl] -- ^ List of URLs
    }
  deriving (Eq, Show)

instance I.ShortShow TMeUrls where
  shortShow TMeUrls
    { urls = urls_
    }
      = "TMeUrls"
        ++ I.cc
        [ "urls" `I.p` urls_
        ]

instance AT.FromJSON TMeUrls where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tMeUrls" -> parseTMeUrls v
      _         -> mempty
    
    where
      parseTMeUrls :: A.Value -> AT.Parser TMeUrls
      parseTMeUrls = A.withObject "TMeUrls" $ \o -> do
        urls_ <- o A..:?  "urls"
        pure $ TMeUrls
          { urls = urls_
          }
  parseJSON _ = mempty

