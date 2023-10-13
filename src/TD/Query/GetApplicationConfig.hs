module TD.Query.GetApplicationConfig
  (GetApplicationConfig(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns application config, provided by the server. Can be called before authorization
data GetApplicationConfig
  = GetApplicationConfig
  deriving (Eq)

instance Show GetApplicationConfig where
  show
    GetApplicationConfig
        = "GetApplicationConfig"

instance AT.ToJSON GetApplicationConfig where
  toJSON
    GetApplicationConfig
        = A.object
          [ "@type" A..= AT.String "getApplicationConfig"
          ]

