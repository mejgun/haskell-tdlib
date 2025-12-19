module TD.Query.GetLoginPasskeys
  (GetLoginPasskeys(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of passkeys allowed to be used for the login by the current user. Returns 'TD.Data.Passkeys.Passkeys'
data GetLoginPasskeys
  = GetLoginPasskeys
  deriving (Eq, Show)

instance I.ShortShow GetLoginPasskeys where
  shortShow
    GetLoginPasskeys
        = "GetLoginPasskeys"

instance AT.ToJSON GetLoginPasskeys where
  toJSON
    GetLoginPasskeys
        = A.object
          [ "@type" A..= AT.String "getLoginPasskeys"
          ]

