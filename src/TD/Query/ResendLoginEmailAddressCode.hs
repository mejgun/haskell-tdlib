module TD.Query.ResendLoginEmailAddressCode
  (ResendLoginEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the login email address verification code. Returns 'TD.Data.EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo'
data ResendLoginEmailAddressCode
  = ResendLoginEmailAddressCode
  deriving (Eq, Show)

instance I.ShortShow ResendLoginEmailAddressCode where
  shortShow
    ResendLoginEmailAddressCode
        = "ResendLoginEmailAddressCode"

instance AT.ToJSON ResendLoginEmailAddressCode where
  toJSON
    ResendLoginEmailAddressCode
        = A.object
          [ "@type" A..= AT.String "resendLoginEmailAddressCode"
          ]

