module TD.Query.GetRecoveryEmailAddress(GetRecoveryEmailAddress(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetRecoveryEmailAddress -- ^ Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user
  = GetRecoveryEmailAddress
    { password :: Maybe T.Text -- ^ The 2-step verification password for the current user
    }
  deriving (Eq)

instance Show GetRecoveryEmailAddress where
  show
    GetRecoveryEmailAddress
      { password = password_
      }
        = "GetRecoveryEmailAddress"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON GetRecoveryEmailAddress where
  toJSON
    GetRecoveryEmailAddress
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getRecoveryEmailAddress"
          , "password" A..= password_
          ]
