module TD.Query.GetTonTransactions
  (GetTonTransactions(..)
  , defaultGetTonTransactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TransactionDirection as TransactionDirection
import qualified Data.Text as T

-- | Returns the list of Toncoin transactions of the current user. Returns 'TD.Data.TonTransactions.TonTransactions'
data GetTonTransactions
  = GetTonTransactions
    { direction :: Maybe TransactionDirection.TransactionDirection -- ^ Direction of the transactions to receive; pass null to get all transactions
    , offset    :: Maybe T.Text                                    -- ^ Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
    , limit     :: Maybe Int                                       -- ^ The maximum number of transactions to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonTransactions where
  shortShow
    GetTonTransactions
      { direction = direction_
      , offset    = offset_
      , limit     = limit_
      }
        = "GetTonTransactions"
          ++ I.cc
          [ "direction" `I.p` direction_
          , "offset"    `I.p` offset_
          , "limit"     `I.p` limit_
          ]

instance AT.ToJSON GetTonTransactions where
  toJSON
    GetTonTransactions
      { direction = direction_
      , offset    = offset_
      , limit     = limit_
      }
        = A.object
          [ "@type"     A..= AT.String "getTonTransactions"
          , "direction" A..= direction_
          , "offset"    A..= offset_
          , "limit"     A..= limit_
          ]

defaultGetTonTransactions :: GetTonTransactions
defaultGetTonTransactions =
  GetTonTransactions
    { direction = Nothing
    , offset    = Nothing
    , limit     = Nothing
    }

