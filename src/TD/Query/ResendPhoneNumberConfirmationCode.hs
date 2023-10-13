module TD.Query.ResendPhoneNumberConfirmationCode
  (ResendPhoneNumberConfirmationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ResendPhoneNumberConfirmationCode -- ^ Resends phone number confirmation code
  = ResendPhoneNumberConfirmationCode
  deriving (Eq)

instance Show ResendPhoneNumberConfirmationCode where
  show
    ResendPhoneNumberConfirmationCode
        = "ResendPhoneNumberConfirmationCode"

instance AT.ToJSON ResendPhoneNumberConfirmationCode where
  toJSON
    ResendPhoneNumberConfirmationCode
        = A.object
          [ "@type" A..= AT.String "resendPhoneNumberConfirmationCode"
          ]

