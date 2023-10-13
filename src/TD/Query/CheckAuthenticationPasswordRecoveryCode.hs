module TD.Query.CheckAuthenticationPasswordRecoveryCode(CheckAuthenticationPasswordRecoveryCode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CheckAuthenticationPasswordRecoveryCode -- ^ Checks whether a 2-step verification password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword
  = CheckAuthenticationPasswordRecoveryCode
    { recovery_code :: Maybe T.Text -- ^ Recovery code to check
    }
  deriving (Eq)

instance Show CheckAuthenticationPasswordRecoveryCode where
  show
    CheckAuthenticationPasswordRecoveryCode
      { recovery_code = recovery_code_
      }
        = "CheckAuthenticationPasswordRecoveryCode"
          ++ I.cc
          [ "recovery_code" `I.p` recovery_code_
          ]

instance AT.ToJSON CheckAuthenticationPasswordRecoveryCode where
  toJSON
    CheckAuthenticationPasswordRecoveryCode
      { recovery_code = recovery_code_
      }
        = A.object
          [ "@type"         A..= AT.String "checkAuthenticationPasswordRecoveryCode"
          , "recovery_code" A..= recovery_code_
          ]
