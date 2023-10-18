module TD.Query.ResendPhoneNumberConfirmationCode
  (ResendPhoneNumberConfirmationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends phone number confirmation code. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data ResendPhoneNumberConfirmationCode
  = ResendPhoneNumberConfirmationCode
  deriving (Eq, Show)

instance I.ShortShow ResendPhoneNumberConfirmationCode where
  shortShow
    ResendPhoneNumberConfirmationCode
        = "ResendPhoneNumberConfirmationCode"

instance AT.ToJSON ResendPhoneNumberConfirmationCode where
  toJSON
    ResendPhoneNumberConfirmationCode
        = A.object
          [ "@type" A..= AT.String "resendPhoneNumberConfirmationCode"
          ]

