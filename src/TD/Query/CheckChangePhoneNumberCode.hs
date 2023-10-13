module TD.Query.CheckChangePhoneNumberCode
  (CheckChangePhoneNumberCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the authentication code sent to confirm a new phone number of the user
data CheckChangePhoneNumberCode
  = CheckChangePhoneNumberCode
    { code :: Maybe T.Text -- ^ Authentication code to check
    }
  deriving (Eq)

instance Show CheckChangePhoneNumberCode where
  show
    CheckChangePhoneNumberCode
      { code = code_
      }
        = "CheckChangePhoneNumberCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckChangePhoneNumberCode where
  toJSON
    CheckChangePhoneNumberCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkChangePhoneNumberCode"
          , "code"  A..= code_
          ]

