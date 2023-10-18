module TD.Query.GetWebPageInstantView
  (GetWebPageInstantView(..)
  , defaultGetWebPageInstantView
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page. Returns 'TD.Data.WebPageInstantView.WebPageInstantView'
data GetWebPageInstantView
  = GetWebPageInstantView
    { url        :: Maybe T.Text -- ^ The web page URL
    , force_full :: Maybe Bool   -- ^ Pass true to get full instant view for the web page
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebPageInstantView where
  shortShow
    GetWebPageInstantView
      { url        = url_
      , force_full = force_full_
      }
        = "GetWebPageInstantView"
          ++ I.cc
          [ "url"        `I.p` url_
          , "force_full" `I.p` force_full_
          ]

instance AT.ToJSON GetWebPageInstantView where
  toJSON
    GetWebPageInstantView
      { url        = url_
      , force_full = force_full_
      }
        = A.object
          [ "@type"      A..= AT.String "getWebPageInstantView"
          , "url"        A..= url_
          , "force_full" A..= force_full_
          ]

defaultGetWebPageInstantView :: GetWebPageInstantView
defaultGetWebPageInstantView =
  GetWebPageInstantView
    { url        = Nothing
    , force_full = Nothing
    }

