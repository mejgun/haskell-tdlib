module TD.Query.CheckPhoneNumberConfirmationCode
  (CheckPhoneNumberConfirmationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks phone number confirmation code. Returns 'TD.Data.Ok.Ok'
data CheckPhoneNumberConfirmationCode
  = CheckPhoneNumberConfirmationCode
    { code :: Maybe T.Text -- ^ Confirmation code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckPhoneNumberConfirmationCode where
  shortShow
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

