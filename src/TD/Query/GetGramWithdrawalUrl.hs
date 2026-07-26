module TD.Query.GetGramWithdrawalUrl
  (GetGramWithdrawalUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a URL for TON Gram withdrawal from the current user's account. The user must have at least 10 Grams to withdraw and can withdraw up to 100000 Grams in one transaction. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetGramWithdrawalUrl
  = GetGramWithdrawalUrl
    { password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetGramWithdrawalUrl where
  shortShow
    GetGramWithdrawalUrl
      { password = password_
      }
        = "GetGramWithdrawalUrl"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON GetGramWithdrawalUrl where
  toJSON
    GetGramWithdrawalUrl
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getGramWithdrawalUrl"
          , "password" A..= password_
          ]

