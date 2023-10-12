module TD.Query.GetProxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetProxies -- ^ Returns list of proxies that are currently set up. Can be called before authorization
  = GetProxies
  deriving (Eq)

instance Show GetProxies where
  show
    GetProxies
        = "GetProxies"

instance AT.ToJSON GetProxies where
  toJSON
    GetProxies
        = A.object
          [ "@type" A..= AT.String "getProxies"
          ]
