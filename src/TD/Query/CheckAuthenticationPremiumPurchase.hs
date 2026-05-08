module TD.Query.CheckAuthenticationPremiumPurchase
  (CheckAuthenticationPremiumPurchase(..)
  , defaultCheckAuthenticationPremiumPurchase
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether an in-store purchase of Telegram Premium is possible before authorization. Works only when the current authorization state is authorizationStateWaitPremiumPurchase. Returns 'TD.Data.Ok.Ok'
data CheckAuthenticationPremiumPurchase
  = CheckAuthenticationPremiumPurchase
    { premium_day_count :: Maybe Int    -- ^ The number of days for which the Telegram Premium subscription will be granted
    , currency          :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount            :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    }
  deriving (Eq, Show)

instance I.ShortShow CheckAuthenticationPremiumPurchase where
  shortShow
    CheckAuthenticationPremiumPurchase
      { premium_day_count = premium_day_count_
      , currency          = currency_
      , amount            = amount_
      }
        = "CheckAuthenticationPremiumPurchase"
          ++ I.cc
          [ "premium_day_count" `I.p` premium_day_count_
          , "currency"          `I.p` currency_
          , "amount"            `I.p` amount_
          ]

instance AT.ToJSON CheckAuthenticationPremiumPurchase where
  toJSON
    CheckAuthenticationPremiumPurchase
      { premium_day_count = premium_day_count_
      , currency          = currency_
      , amount            = amount_
      }
        = A.object
          [ "@type"             A..= AT.String "checkAuthenticationPremiumPurchase"
          , "premium_day_count" A..= premium_day_count_
          , "currency"          A..= currency_
          , "amount"            A..= amount_
          ]

defaultCheckAuthenticationPremiumPurchase :: CheckAuthenticationPremiumPurchase
defaultCheckAuthenticationPremiumPurchase =
  CheckAuthenticationPremiumPurchase
    { premium_day_count = Nothing
    , currency          = Nothing
    , amount            = Nothing
    }

