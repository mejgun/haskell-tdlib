module TD.Query.ResendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
