module TD.Query.CancelRecoveryEmailAddressVerification
  (CancelRecoveryEmailAddressVerification(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Cancels verification of the 2-step verification recovery email address. Returns 'TD.Data.PasswordState.PasswordState'
data CancelRecoveryEmailAddressVerification
  = CancelRecoveryEmailAddressVerification
  deriving (Eq, Show)

instance I.ShortShow CancelRecoveryEmailAddressVerification where
  shortShow
    CancelRecoveryEmailAddressVerification
        = "CancelRecoveryEmailAddressVerification"

instance AT.ToJSON CancelRecoveryEmailAddressVerification where
  toJSON
    CancelRecoveryEmailAddressVerification
        = A.object
          [ "@type" A..= AT.String "cancelRecoveryEmailAddressVerification"
          ]

