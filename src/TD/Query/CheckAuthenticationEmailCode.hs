module TD.Query.CheckAuthenticationEmailCode(CheckAuthenticationEmailCode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication

data CheckAuthenticationEmailCode -- ^ Checks the authentication of a email address. Works only when the current authorization state is authorizationStateWaitEmailCode
  = CheckAuthenticationEmailCode
    { code :: Maybe EmailAddressAuthentication.EmailAddressAuthentication -- ^ Email address authentication to check
    }
  deriving (Eq)

instance Show CheckAuthenticationEmailCode where
  show
    CheckAuthenticationEmailCode
      { code = code_
      }
        = "CheckAuthenticationEmailCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckAuthenticationEmailCode where
  toJSON
    CheckAuthenticationEmailCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkAuthenticationEmailCode"
          , "code"  A..= code_
          ]
