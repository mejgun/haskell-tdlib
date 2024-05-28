module TD.Query.GetStarTransactions
  (GetStarTransactions(..)
  , defaultGetStarTransactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarTransactionDirection as StarTransactionDirection

-- | Returns the list of Telegram star transactions for the current user. Returns 'TD.Data.StarTransactions.StarTransactions'
data GetStarTransactions
  = GetStarTransactions
    { offset    :: Maybe T.Text                                            -- ^ Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
    , direction :: Maybe StarTransactionDirection.StarTransactionDirection -- ^ Direction of the transactions to receive; pass null to get all transactions
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarTransactions where
  shortShow
    GetStarTransactions
      { offset    = offset_
      , direction = direction_
      }
        = "GetStarTransactions"
          ++ I.cc
          [ "offset"    `I.p` offset_
          , "direction" `I.p` direction_
          ]

instance AT.ToJSON GetStarTransactions where
  toJSON
    GetStarTransactions
      { offset    = offset_
      , direction = direction_
      }
        = A.object
          [ "@type"     A..= AT.String "getStarTransactions"
          , "offset"    A..= offset_
          , "direction" A..= direction_
          ]

defaultGetStarTransactions :: GetStarTransactions
defaultGetStarTransactions =
  GetStarTransactions
    { offset    = Nothing
    , direction = Nothing
    }

