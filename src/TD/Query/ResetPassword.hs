module TD.Query.ResetPassword
  (ResetPassword(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time. Returns 'TD.Data.ResetPasswordResult.ResetPasswordResult'
data ResetPassword
  = ResetPassword
  deriving (Eq, Show)

instance I.ShortShow ResetPassword where
  shortShow
    ResetPassword
        = "ResetPassword"

instance AT.ToJSON ResetPassword where
  toJSON
    ResetPassword
        = A.object
          [ "@type" A..= AT.String "resetPassword"
          ]

