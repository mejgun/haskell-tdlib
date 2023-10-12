module TD.Query.ResendAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResendAuthenticationCode -- ^ Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode
  = ResendAuthenticationCode
  deriving (Eq)

instance Show ResendAuthenticationCode where
  show
    ResendAuthenticationCode
        = "ResendAuthenticationCode"

instance AT.ToJSON ResendAuthenticationCode where
  toJSON
    ResendAuthenticationCode
        = A.object
          [ "@type" A..= AT.String "resendAuthenticationCode"
          ]
