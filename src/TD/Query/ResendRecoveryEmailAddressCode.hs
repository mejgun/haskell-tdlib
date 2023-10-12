module TD.Query.ResendRecoveryEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResendRecoveryEmailAddressCode -- ^ Resends the 2-step verification recovery email address verification code
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
