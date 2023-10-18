module TD.Query.GetApplicationConfig
  (GetApplicationConfig(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns application config, provided by the server. Can be called before authorization. Returns 'TD.Data.JsonValue.JsonValue'
data GetApplicationConfig
  = GetApplicationConfig
  deriving (Eq, Show)

instance I.ShortShow GetApplicationConfig where
  shortShow
    GetApplicationConfig
        = "GetApplicationConfig"

instance AT.ToJSON GetApplicationConfig where
  toJSON
    GetApplicationConfig
        = A.object
          [ "@type" A..= AT.String "getApplicationConfig"
          ]

