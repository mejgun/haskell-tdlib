module TD.Data.WebAppUrl
  (WebAppUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WebAppUrl
  = WebAppUrl -- ^ Contains information about a Web App URL
    { url                 :: Maybe T.Text -- ^ The Web App URL to open in a web view
    , require_same_origin :: Maybe Bool   -- ^ True, if events from the Web App must be accepted only from the same origin as the URL
    }
  deriving (Eq, Show)

instance I.ShortShow WebAppUrl where
  shortShow WebAppUrl
    { url                 = url_
    , require_same_origin = require_same_origin_
    }
      = "WebAppUrl"
        ++ I.cc
        [ "url"                 `I.p` url_
        , "require_same_origin" `I.p` require_same_origin_
        ]

instance AT.FromJSON WebAppUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webAppUrl" -> parseWebAppUrl v
      _           -> mempty
    
    where
      parseWebAppUrl :: A.Value -> AT.Parser WebAppUrl
      parseWebAppUrl = A.withObject "WebAppUrl" $ \o -> do
        url_                 <- o A..:?  "url"
        require_same_origin_ <- o A..:?  "require_same_origin"
        pure $ WebAppUrl
          { url                 = url_
          , require_same_origin = require_same_origin_
          }
  parseJSON _ = mempty

