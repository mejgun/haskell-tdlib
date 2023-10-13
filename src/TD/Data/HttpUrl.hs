module TD.Data.HttpUrl
  ( HttpUrl(..)    
  , defaultHttpUrl 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data HttpUrl
  = HttpUrl -- ^ Contains an HTTP URL
    { url :: Maybe T.Text -- ^ The URL
    }
  deriving (Eq)

instance Show HttpUrl where
  show HttpUrl
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

instance AT.ToJSON HttpUrl where
  toJSON HttpUrl
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "httpUrl"
        , "url"   A..= url_
        ]

defaultHttpUrl :: HttpUrl
defaultHttpUrl =
  HttpUrl
    { url = Nothing
    }

