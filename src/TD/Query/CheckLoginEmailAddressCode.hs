module TD.Query.CheckLoginEmailAddressCode
  (CheckLoginEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication

-- | Checks the login email address authentication. Returns 'TD.Data.Ok.Ok'
data CheckLoginEmailAddressCode
  = CheckLoginEmailAddressCode
    { code :: Maybe EmailAddressAuthentication.EmailAddressAuthentication -- ^ Email address authentication to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckLoginEmailAddressCode where
  shortShow
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

