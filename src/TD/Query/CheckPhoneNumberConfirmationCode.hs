module TD.Query.CheckPhoneNumberConfirmationCode
  (CheckPhoneNumberConfirmationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks phone number confirmation code
data CheckPhoneNumberConfirmationCode
  = CheckPhoneNumberConfirmationCode
    { code :: Maybe T.Text -- ^ Confirmation code to check
    }
  deriving (Eq)

instance Show CheckPhoneNumberConfirmationCode where
  show
    CheckPhoneNumberConfirmationCode
      { code = code_
      }
        = "CheckPhoneNumberConfirmationCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckPhoneNumberConfirmationCode where
  toJSON
    CheckPhoneNumberConfirmationCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkPhoneNumberConfirmationCode"
          , "code"  A..= code_
          ]

