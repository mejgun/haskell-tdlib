module TD.Query.ResendAuthenticationCode
  (ResendAuthenticationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ResendCodeReason as ResendCodeReason

-- | Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode. Returns 'TD.Data.Ok.Ok'
data ResendAuthenticationCode
  = ResendAuthenticationCode
    { reason :: Maybe ResendCodeReason.ResendCodeReason -- ^ Reason of code resending; pass null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow ResendAuthenticationCode where
  shortShow
    ResendAuthenticationCode
      { reason = reason_
      }
        = "ResendAuthenticationCode"
          ++ I.cc
          [ "reason" `I.p` reason_
          ]

instance AT.ToJSON ResendAuthenticationCode where
  toJSON
    ResendAuthenticationCode
      { reason = reason_
      }
        = A.object
          [ "@type"  A..= AT.String "resendAuthenticationCode"
          , "reason" A..= reason_
          ]

