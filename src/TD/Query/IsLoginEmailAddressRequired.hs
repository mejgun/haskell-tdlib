module TD.Query.IsLoginEmailAddressRequired
  (IsLoginEmailAddressRequired(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the current user is required to set login email address. Returns 'TD.Data.Ok.Ok'
data IsLoginEmailAddressRequired
  = IsLoginEmailAddressRequired
  deriving (Eq, Show)

instance I.ShortShow IsLoginEmailAddressRequired where
  shortShow
    IsLoginEmailAddressRequired
        = "IsLoginEmailAddressRequired"

instance AT.ToJSON IsLoginEmailAddressRequired where
  toJSON
    IsLoginEmailAddressRequired
        = A.object
          [ "@type" A..= AT.String "isLoginEmailAddressRequired"
          ]

