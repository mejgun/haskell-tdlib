module TD.Query.GetTonWalletSecretPhrase
  (GetTonWalletSecretPhrase(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the secret phrase of the user's TON wallet as a space separated list of words. Works only if tonWalletState.can_export_phrase is true. Returns 'TD.Data.Text.Text'
data GetTonWalletSecretPhrase
  = GetTonWalletSecretPhrase
    { password :: Maybe T.Text -- ^ Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletSecretPhrase where
  shortShow
    GetTonWalletSecretPhrase
      { password = password_
      }
        = "GetTonWalletSecretPhrase"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON GetTonWalletSecretPhrase where
  toJSON
    GetTonWalletSecretPhrase
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getTonWalletSecretPhrase"
          , "password" A..= password_
          ]

