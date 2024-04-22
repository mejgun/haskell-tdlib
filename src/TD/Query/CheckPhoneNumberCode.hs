module TD.Query.CheckPhoneNumberCode
  (CheckPhoneNumberCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Check the authentication code and completes the request for which the code was sent if appropriate. Returns 'TD.Data.Ok.Ok'
data CheckPhoneNumberCode
  = CheckPhoneNumberCode
    { code :: Maybe T.Text -- ^ Authentication code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckPhoneNumberCode where
  shortShow
    CheckPhoneNumberCode
      { code = code_
      }
        = "CheckPhoneNumberCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckPhoneNumberCode where
  toJSON
    CheckPhoneNumberCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkPhoneNumberCode"
          , "code"  A..= code_
          ]

