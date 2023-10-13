module TD.Query.ResendLoginEmailAddressCode
  (ResendLoginEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Resends the login email address verification code
data ResendLoginEmailAddressCode
  = ResendLoginEmailAddressCode
  deriving (Eq)

instance Show ResendLoginEmailAddressCode where
  show
    ResendLoginEmailAddressCode
        = "ResendLoginEmailAddressCode"

instance AT.ToJSON ResendLoginEmailAddressCode where
  toJSON
    ResendLoginEmailAddressCode
        = A.object
          [ "@type" A..= AT.String "resendLoginEmailAddressCode"
          ]

