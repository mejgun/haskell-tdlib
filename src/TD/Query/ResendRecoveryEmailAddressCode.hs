module TD.Query.ResendRecoveryEmailAddressCode
  (ResendRecoveryEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Resends the 2-step verification recovery email address verification code
data ResendRecoveryEmailAddressCode
  = ResendRecoveryEmailAddressCode
  deriving (Eq)

instance Show ResendRecoveryEmailAddressCode where
  show
    ResendRecoveryEmailAddressCode
        = "ResendRecoveryEmailAddressCode"

instance AT.ToJSON ResendRecoveryEmailAddressCode where
  toJSON
    ResendRecoveryEmailAddressCode
        = A.object
          [ "@type" A..= AT.String "resendRecoveryEmailAddressCode"
          ]

