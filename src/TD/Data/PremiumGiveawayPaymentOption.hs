module TD.Data.PremiumGiveawayPaymentOption
  (PremiumGiveawayPaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PremiumGiveawayPaymentOption
  = PremiumGiveawayPaymentOption -- ^ Describes an option for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members. Use telegramPaymentPurposePremiumGiftCodes or telegramPaymentPurposePremiumGiveaway for out-of-store payments
    { currency               :: Maybe T.Text -- ^ ISO 4217 currency code for Telegram Premium gift code payment
    , amount                 :: Maybe Int    -- ^ The amount to pay, in the smallest units of the currency
    , winner_count           :: Maybe Int    -- ^ Number of users which will be able to activate the gift codes
    , month_count            :: Maybe Int    -- ^ Number of months the Telegram Premium subscription will be active
    , store_product_id       :: Maybe T.Text -- ^ Identifier of the store product associated with the option; may be empty if none
    , store_product_quantity :: Maybe Int    -- ^ Number of times the store product must be paid
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiveawayPaymentOption where
  shortShow PremiumGiveawayPaymentOption
    { currency               = currency_
    , amount                 = amount_
    , winner_count           = winner_count_
    , month_count            = month_count_
    , store_product_id       = store_product_id_
    , store_product_quantity = store_product_quantity_
    }
      = "PremiumGiveawayPaymentOption"
        ++ I.cc
        [ "currency"               `I.p` currency_
        , "amount"                 `I.p` amount_
        , "winner_count"           `I.p` winner_count_
        , "month_count"            `I.p` month_count_
        , "store_product_id"       `I.p` store_product_id_
        , "store_product_quantity" `I.p` store_product_quantity_
        ]

instance AT.FromJSON PremiumGiveawayPaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiveawayPaymentOption" -> parsePremiumGiveawayPaymentOption v
      _                              -> mempty
    
    where
      parsePremiumGiveawayPaymentOption :: A.Value -> AT.Parser PremiumGiveawayPaymentOption
      parsePremiumGiveawayPaymentOption = A.withObject "PremiumGiveawayPaymentOption" $ \o -> do
        currency_               <- o A..:?  "currency"
        amount_                 <- o A..:?  "amount"
        winner_count_           <- o A..:?  "winner_count"
        month_count_            <- o A..:?  "month_count"
        store_product_id_       <- o A..:?  "store_product_id"
        store_product_quantity_ <- o A..:?  "store_product_quantity"
        pure $ PremiumGiveawayPaymentOption
          { currency               = currency_
          , amount                 = amount_
          , winner_count           = winner_count_
          , month_count            = month_count_
          , store_product_id       = store_product_id_
          , store_product_quantity = store_product_quantity_
          }
  parseJSON _ = mempty

