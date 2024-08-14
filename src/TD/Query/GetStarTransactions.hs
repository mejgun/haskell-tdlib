module TD.Query.GetStarTransactions
  (GetStarTransactions(..)
  , defaultGetStarTransactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T
import qualified TD.Data.StarTransactionDirection as StarTransactionDirection

-- | Returns the list of Telegram Star transactions for the specified owner. Returns 'TD.Data.StarTransactions.StarTransactions'
data GetStarTransactions
  = GetStarTransactions
    { owner_id        :: Maybe MessageSender.MessageSender                       -- ^ Identifier of the owner of the Telegram Stars; can be the identifier of the current user, identifier of an owned bot, or identifier of a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
    , subscription_id :: Maybe T.Text                                            -- ^ If non-empty, only transactions related to the Star Subscription will be returned
    , direction       :: Maybe StarTransactionDirection.StarTransactionDirection -- ^ Direction of the transactions to receive; pass null to get all transactions
    , offset          :: Maybe T.Text                                            -- ^ Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
    , limit           :: Maybe Int                                               -- ^ The maximum number of transactions to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarTransactions where
  shortShow
    GetStarTransactions
      { owner_id        = owner_id_
      , subscription_id = subscription_id_
      , direction       = direction_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetStarTransactions"
          ++ I.cc
          [ "owner_id"        `I.p` owner_id_
          , "subscription_id" `I.p` subscription_id_
          , "direction"       `I.p` direction_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetStarTransactions where
  toJSON
    GetStarTransactions
      { owner_id        = owner_id_
      , subscription_id = subscription_id_
      , direction       = direction_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getStarTransactions"
          , "owner_id"        A..= owner_id_
          , "subscription_id" A..= subscription_id_
          , "direction"       A..= direction_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetStarTransactions :: GetStarTransactions
defaultGetStarTransactions =
  GetStarTransactions
    { owner_id        = Nothing
    , subscription_id = Nothing
    , direction       = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

