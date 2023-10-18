module TD.Query.CheckRecoveryEmailAddressCode
  (CheckRecoveryEmailAddressCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the 2-step verification recovery email address verification code. Returns 'TD.Data.PasswordState.PasswordState'
data CheckRecoveryEmailAddressCode
  = CheckRecoveryEmailAddressCode
    { code :: Maybe T.Text -- ^ Verification code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckRecoveryEmailAddressCode where
  shortShow
    CheckRecoveryEmailAddressCode
      { code = code_
      }
        = "CheckRecoveryEmailAddressCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckRecoveryEmailAddressCode where
  toJSON
    CheckRecoveryEmailAddressCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkRecoveryEmailAddressCode"
          , "code"  A..= code_
          ]

