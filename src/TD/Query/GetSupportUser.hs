module TD.Query.GetSupportUser
  (GetSupportUser(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns a user that can be contacted to get support
data GetSupportUser
  = GetSupportUser
  deriving (Eq)

instance Show GetSupportUser where
  show
    GetSupportUser
        = "GetSupportUser"

instance AT.ToJSON GetSupportUser where
  toJSON
    GetSupportUser
        = A.object
          [ "@type" A..= AT.String "getSupportUser"
          ]

