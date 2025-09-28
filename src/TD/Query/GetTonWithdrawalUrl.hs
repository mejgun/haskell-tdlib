module TD.Query.GetTonWithdrawalUrl
  (GetTonWithdrawalUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a URL for Toncoin withdrawal from the current user's account. The user must have at least 10 toncoins to withdraw and can withdraw up to 100000 Toncoins in one transaction. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetTonWithdrawalUrl
  = GetTonWithdrawalUrl
    { password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWithdrawalUrl where
  shortShow
    GetTonWithdrawalUrl
      { password = password_
      }
        = "GetTonWithdrawalUrl"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON GetTonWithdrawalUrl where
  toJSON
    GetTonWithdrawalUrl
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getTonWithdrawalUrl"
          , "password" A..= password_
          ]

