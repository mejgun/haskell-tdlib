module TD.Query.CheckLoginEmailAddressCode(CheckLoginEmailAddressCode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication

data CheckLoginEmailAddressCode -- ^ Checks the login email address authentication
  = CheckLoginEmailAddressCode
    { code :: Maybe EmailAddressAuthentication.EmailAddressAuthentication -- ^ Email address authentication to check
    }
  deriving (Eq)

instance Show CheckLoginEmailAddressCode where
  show
    CheckLoginEmailAddressCode
      { code = code_
      }
        = "CheckLoginEmailAddressCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckLoginEmailAddressCode where
  toJSON
    CheckLoginEmailAddressCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkLoginEmailAddressCode"
          , "code"  A..= code_
          ]
