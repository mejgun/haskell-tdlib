module TD.Query.GetTonWalletTransactions
  (GetTonWalletTransactions(..)
  , defaultGetTonWalletTransactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TransactionDirection as TransactionDirection
import qualified Data.Text as T

-- | Returns the list of TON wallet transactions of the current user; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonWalletTransactions.TonWalletTransactions'
data GetTonWalletTransactions
  = GetTonWalletTransactions
    { direction :: Maybe TransactionDirection.TransactionDirection -- ^ Direction of the transactions to receive; pass null to get all transactions
    , offset    :: Maybe T.Text                                    -- ^ Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
    , limit     :: Maybe Int                                       -- ^ The maximum number of transactions to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletTransactions where
  shortShow
    GetTonWalletTransactions
      { direction = direction_
      , offset    = offset_
      , limit     = limit_
      }
        = "GetTonWalletTransactions"
          ++ I.cc
          [ "direction" `I.p` direction_
          , "offset"    `I.p` offset_
          , "limit"     `I.p` limit_
          ]

instance AT.ToJSON GetTonWalletTransactions where
  toJSON
    GetTonWalletTransactions
      { direction = direction_
      , offset    = offset_
      , limit     = limit_
      }
        = A.object
          [ "@type"     A..= AT.String "getTonWalletTransactions"
          , "direction" A..= direction_
          , "offset"    A..= offset_
          , "limit"     A..= limit_
          ]

defaultGetTonWalletTransactions :: GetTonWalletTransactions
defaultGetTonWalletTransactions =
  GetTonWalletTransactions
    { direction = Nothing
    , offset    = Nothing
    , limit     = Nothing
    }

