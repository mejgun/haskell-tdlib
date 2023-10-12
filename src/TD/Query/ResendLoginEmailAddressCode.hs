module TD.Query.ResendLoginEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResendLoginEmailAddressCode -- ^ Resends the login email address verification code
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
