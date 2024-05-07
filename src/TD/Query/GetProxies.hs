module TD.Query.GetProxies
  (GetProxies(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of proxies that are currently set up. Can be called before authorization. Returns 'TD.Data.Proxies.Proxies'
data GetProxies
  = GetProxies
  deriving (Eq, Show)

instance I.ShortShow GetProxies where
  shortShow
    GetProxies
        = "GetProxies"

instance AT.ToJSON GetProxies where
  toJSON
    GetProxies
        = A.object
          [ "@type" A..= AT.String "getProxies"
          ]

