module TD.Query.CheckPasswordRecoveryCode
  (CheckPasswordRecoveryCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

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

