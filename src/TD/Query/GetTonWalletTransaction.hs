module TD.Query.GetTonWalletTransaction
  (GetTonWalletTransaction(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a TON wallet transaction by its identifier. Returns 'TD.Data.TonWalletTransaction.TonWalletTransaction'
data GetTonWalletTransaction
  = GetTonWalletTransaction
    { transaction_id :: Maybe T.Text -- ^ Identifier of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletTransaction where
  shortShow
    GetTonWalletTransaction
      { transaction_id = transaction_id_
      }
        = "GetTonWalletTransaction"
          ++ I.cc
          [ "transaction_id" `I.p` transaction_id_
          ]

instance AT.ToJSON GetTonWalletTransaction where
  toJSON
    GetTonWalletTransaction
      { transaction_id = transaction_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getTonWalletTransaction"
          , "transaction_id" A..= transaction_id_
          ]

