module TD.Query.ResendAuthenticationCode
  (ResendAuthenticationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode. Returns 'TD.Data.Ok.Ok'
data ResendAuthenticationCode
  = ResendAuthenticationCode
  deriving (Eq, Show)

instance I.ShortShow ResendAuthenticationCode where
  shortShow
    ResendAuthenticationCode
        = "ResendAuthenticationCode"

instance AT.ToJSON ResendAuthenticationCode where
  toJSON
    ResendAuthenticationCode
        = A.object
          [ "@type" A..= AT.String "resendAuthenticationCode"
          ]

