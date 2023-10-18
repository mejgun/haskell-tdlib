module TD.Query.ResendRecoveryEmailAddressCode
  (ResendRecoveryEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the 2-step verification recovery email address verification code. Returns 'TD.Data.PasswordState.PasswordState'
data ResendRecoveryEmailAddressCode
  = ResendRecoveryEmailAddressCode
  deriving (Eq, Show)

instance I.ShortShow ResendRecoveryEmailAddressCode where
  shortShow
    ResendRecoveryEmailAddressCode
        = "ResendRecoveryEmailAddressCode"

instance AT.ToJSON ResendRecoveryEmailAddressCode where
  toJSON
    ResendRecoveryEmailAddressCode
        = A.object
          [ "@type" A..= AT.String "resendRecoveryEmailAddressCode"
          ]

