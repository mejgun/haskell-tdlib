module TD.Query.CheckAuthenticationPassword
  (CheckAuthenticationPassword(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the 2-step verification password for correctness. Works only when the current authorization state is authorizationStateWaitPassword. Returns 'TD.Data.Ok.Ok'
data CheckAuthenticationPassword
  = CheckAuthenticationPassword
    { password :: Maybe T.Text -- ^ The 2-step verification password to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckAuthenticationPassword where
  shortShow
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

