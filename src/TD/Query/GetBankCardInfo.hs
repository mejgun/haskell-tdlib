module TD.Query.GetBankCardInfo
  (GetBankCardInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a bank card. Returns 'TD.Data.BankCardInfo.BankCardInfo'
data GetBankCardInfo
  = GetBankCardInfo
    { bank_card_number :: Maybe T.Text -- ^ The bank card number
    }
  deriving (Eq, Show)

instance I.ShortShow GetBankCardInfo where
  shortShow
    GetBankCardInfo
      { bank_card_number = bank_card_number_
      }
        = "GetBankCardInfo"
          ++ I.cc
          [ "bank_card_number" `I.p` bank_card_number_
          ]

instance AT.ToJSON GetBankCardInfo where
  toJSON
    GetBankCardInfo
      { bank_card_number = bank_card_number_
      }
        = A.object
          [ "@type"            A..= AT.String "getBankCardInfo"
          , "bank_card_number" A..= bank_card_number_
          ]

