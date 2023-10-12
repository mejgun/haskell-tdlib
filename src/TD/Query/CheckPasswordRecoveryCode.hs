module TD.Query.CheckPasswordRecoveryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CheckPasswordRecoveryCode -- ^ Checks whether a 2-step verification password recovery code sent to an email address is valid
  = CheckPasswordRecoveryCode
    { recovery_code :: Maybe T.Text -- ^ Recovery code to check
    }
  deriving (Eq)

instance Show CheckPasswordRecoveryCode where
  show
    CheckPasswordRecoveryCode
      { recovery_code = recovery_code_
      }
        = "CheckPasswordRecoveryCode"
          ++ I.cc
          [ "recovery_code" `I.p` recovery_code_
          ]

instance AT.ToJSON CheckPasswordRecoveryCode where
  toJSON
    CheckPasswordRecoveryCode
      { recovery_code = recovery_code_
      }
        = A.object
          [ "@type"         A..= AT.String "checkPasswordRecoveryCode"
          , "recovery_code" A..= recovery_code_
          ]
