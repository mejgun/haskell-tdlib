module TD.Query.GetTonWalletTransactionByMsgHash
  (GetTonWalletTransactionByMsgHash(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a TON wallet transaction by its msg_hash; returns an error if the transaction isn't finalized yet. Returns 'TD.Data.TonWalletTransaction.TonWalletTransaction'
data GetTonWalletTransactionByMsgHash
  = GetTonWalletTransactionByMsgHash
    { msg_hash :: Maybe T.Text -- ^ Value of msg_hash of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletTransactionByMsgHash where
  shortShow
    GetTonWalletTransactionByMsgHash
      { msg_hash = msg_hash_
      }
        = "GetTonWalletTransactionByMsgHash"
          ++ I.cc
          [ "msg_hash" `I.p` msg_hash_
          ]

instance AT.ToJSON GetTonWalletTransactionByMsgHash where
  toJSON
    GetTonWalletTransactionByMsgHash
      { msg_hash = msg_hash_
      }
        = A.object
          [ "@type"    A..= AT.String "getTonWalletTransactionByMsgHash"
          , "msg_hash" A..= msg_hash_
          ]

