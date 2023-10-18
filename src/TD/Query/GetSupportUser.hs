module TD.Query.GetSupportUser
  (GetSupportUser(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a user that can be contacted to get support. Returns 'TD.Data.User.User'
data GetSupportUser
  = GetSupportUser
  deriving (Eq, Show)

instance I.ShortShow GetSupportUser where
  shortShow
    GetSupportUser
        = "GetSupportUser"

instance AT.ToJSON GetSupportUser where
  toJSON
    GetSupportUser
        = A.object
          [ "@type" A..= AT.String "getSupportUser"
          ]

