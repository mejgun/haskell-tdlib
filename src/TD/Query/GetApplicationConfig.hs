module TD.Query.GetApplicationConfig(GetApplicationConfig(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetApplicationConfig -- ^ Returns application config, provided by the server. Can be called before authorization
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
