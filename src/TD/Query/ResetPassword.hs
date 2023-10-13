module TD.Query.ResetPassword
  (ResetPassword(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time
data ResetPassword
  = ResetPassword
  deriving (Eq)

instance Show ResetPassword where
  show
    ResetPassword
        = "ResetPassword"

instance AT.ToJSON ResetPassword where
  toJSON
    ResetPassword
        = A.object
          [ "@type" A..= AT.String "resetPassword"
          ]

