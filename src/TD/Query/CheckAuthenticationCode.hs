module TD.Query.CheckAuthenticationCode
  (CheckAuthenticationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode. Returns 'TD.Data.Ok.Ok'
data CheckAuthenticationCode
  = CheckAuthenticationCode
    { code :: Maybe T.Text -- ^ Authentication code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckAuthenticationCode where
  shortShow
    CheckAuthenticationCode
      { code = code_
      }
        = "CheckAuthenticationCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckAuthenticationCode where
  toJSON
    CheckAuthenticationCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkAuthenticationCode"
          , "code"  A..= code_
          ]

