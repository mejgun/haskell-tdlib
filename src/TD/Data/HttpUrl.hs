module TD.Data.HttpUrl
  (HttpUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data HttpUrl
  = HttpUrl -- ^ Contains an HTTP URL
    { url :: Maybe T.Text -- ^ The URL
    }
  deriving (Eq, Show)

instance I.ShortShow HttpUrl where
  shortShow HttpUrl
    { url = url_
    }
      = "HttpUrl"
        ++ I.cc
        [ "url" `I.p` url_
        ]

instance AT.FromJSON HttpUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "httpUrl" -> parseHttpUrl v
      _         -> mempty
    
    where
      parseHttpUrl :: A.Value -> AT.Parser HttpUrl
      parseHttpUrl = A.withObject "HttpUrl" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ HttpUrl
          { url = url_
          }
  parseJSON _ = mempty

