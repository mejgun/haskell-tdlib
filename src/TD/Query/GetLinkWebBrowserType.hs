module TD.Query.GetLinkWebBrowserType
  (GetLinkWebBrowserType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a type of the web browser which must be used to open the link. Returns 'TD.Data.WebBrowserType.WebBrowserType'
data GetLinkWebBrowserType
  = GetLinkWebBrowserType
    { link :: Maybe T.Text -- ^ The HTTP link
    }
  deriving (Eq, Show)

instance I.ShortShow GetLinkWebBrowserType where
  shortShow
    GetLinkWebBrowserType
      { link = link_
      }
        = "GetLinkWebBrowserType"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON GetLinkWebBrowserType where
  toJSON
    GetLinkWebBrowserType
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "getLinkWebBrowserType"
          , "link"  A..= link_
          ]

