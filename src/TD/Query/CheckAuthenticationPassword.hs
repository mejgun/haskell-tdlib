module TD.Query.CheckAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CheckAuthenticationPassword -- ^ Checks the 2-step verification password for correctness. Works only when the current authorization state is authorizationStateWaitPassword
  = CheckAuthenticationPassword
    { password :: Maybe T.Text -- ^ The 2-step verification password to check
    }
  deriving (Eq)

instance Show CheckAuthenticationPassword where
  show
    CheckAuthenticationPassword
      { password = password_
      }
        = "CheckAuthenticationPassword"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON CheckAuthenticationPassword where
  toJSON
    CheckAuthenticationPassword
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "checkAuthenticationPassword"
          , "password" A..= password_
          ]
