module TD.Query.SetAuthenticationPremiumPurchaseTransaction
  (SetAuthenticationPremiumPurchaseTransaction(..)
  , defaultSetAuthenticationPremiumPurchaseTransaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoreTransaction as StoreTransaction
import qualified Data.Text as T

-- | Informs server about an in-store purchase of Telegram Premium before authorization. Works only when the current authorization state is authorizationStateWaitPremiumPurchase. Returns 'TD.Data.Ok.Ok'
data SetAuthenticationPremiumPurchaseTransaction
  = SetAuthenticationPremiumPurchaseTransaction
    { transaction :: Maybe StoreTransaction.StoreTransaction -- ^ Information about the transaction
    , is_restore  :: Maybe Bool                              -- ^ Pass true if this is a restore of a Telegram Premium purchase; only for App Store
    , currency    :: Maybe T.Text                            -- ^ ISO 4217 currency code of the payment currency
    , amount      :: Maybe Int                               -- ^ Paid amount, in the smallest units of the currency
    }
  deriving (Eq, Show)

instance I.ShortShow SetAuthenticationPremiumPurchaseTransaction where
  shortShow
    SetAuthenticationPremiumPurchaseTransaction
      { transaction = transaction_
      , is_restore  = is_restore_
      , currency    = currency_
      , amount      = amount_
      }
        = "SetAuthenticationPremiumPurchaseTransaction"
          ++ I.cc
          [ "transaction" `I.p` transaction_
          , "is_restore"  `I.p` is_restore_
          , "currency"    `I.p` currency_
          , "amount"      `I.p` amount_
          ]

instance AT.ToJSON SetAuthenticationPremiumPurchaseTransaction where
  toJSON
    SetAuthenticationPremiumPurchaseTransaction
      { transaction = transaction_
      , is_restore  = is_restore_
      , currency    = currency_
      , amount      = amount_
      }
        = A.object
          [ "@type"       A..= AT.String "setAuthenticationPremiumPurchaseTransaction"
          , "transaction" A..= transaction_
          , "is_restore"  A..= is_restore_
          , "currency"    A..= currency_
          , "amount"      A..= amount_
          ]

defaultSetAuthenticationPremiumPurchaseTransaction :: SetAuthenticationPremiumPurchaseTransaction
defaultSetAuthenticationPremiumPurchaseTransaction =
  SetAuthenticationPremiumPurchaseTransaction
    { transaction = Nothing
    , is_restore  = Nothing
    , currency    = Nothing
    , amount      = Nothing
    }

