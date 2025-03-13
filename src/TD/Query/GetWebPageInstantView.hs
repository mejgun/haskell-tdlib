module TD.Query.GetWebPageInstantView
  (GetWebPageInstantView(..)
  , defaultGetWebPageInstantView
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an instant view version of a web page if available. This is an offline method if only_local is true. Returns a 404 error if the web page has no instant view page. Returns 'TD.Data.WebPageInstantView.WebPageInstantView'
data GetWebPageInstantView
  = GetWebPageInstantView
    { url        :: Maybe T.Text -- ^ The web page URL
    , only_local :: Maybe Bool   -- ^ Pass true to get only locally available information without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebPageInstantView where
  shortShow
    GetWebPageInstantView
      { url        = url_
      , only_local = only_local_
      }
        = "GetWebPageInstantView"
          ++ I.cc
          [ "url"        `I.p` url_
          , "only_local" `I.p` only_local_
          ]

instance AT.ToJSON GetWebPageInstantView where
  toJSON
    GetWebPageInstantView
      { url        = url_
      , only_local = only_local_
      }
        = A.object
          [ "@type"      A..= AT.String "getWebPageInstantView"
          , "url"        A..= url_
          , "only_local" A..= only_local_
          ]

defaultGetWebPageInstantView :: GetWebPageInstantView
defaultGetWebPageInstantView =
  GetWebPageInstantView
    { url        = Nothing
    , only_local = Nothing
    }

