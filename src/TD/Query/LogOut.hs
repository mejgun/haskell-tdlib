module TD.Query.LogOut
  (LogOut(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent. Returns 'TD.Data.Ok.Ok'
data LogOut
  = LogOut
  deriving (Eq, Show)

instance I.ShortShow LogOut where
  shortShow
    LogOut
        = "LogOut"

instance AT.ToJSON LogOut where
  toJSON
    LogOut
        = A.object
          [ "@type" A..= AT.String "logOut"
          ]

