module TD.Data.PremiumGiftPaymentOption
  (PremiumGiftPaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data PremiumGiftPaymentOption
  = PremiumGiftPaymentOption -- ^ Describes an option for gifting Telegram Premium to a user. Use telegramPaymentPurposePremiumGift for out-of-store payments or payments in Telegram Stars
    { currency            :: Maybe T.Text          -- ^ ISO 4217 currency code for the payment
    , amount              :: Maybe Int             -- ^ The amount to pay, in the smallest units of the currency
    , star_count          :: Maybe Int             -- ^ The alternative amount of Telegram Stars to pay; 0 if payment in Telegram Stars is not possible
    , discount_percentage :: Maybe Int             -- ^ The discount associated with this option, as a percentage
    , month_count         :: Maybe Int             -- ^ Number of months the Telegram Premium subscription will be active
    , store_product_id    :: Maybe T.Text          -- ^ Identifier of the store product associated with the option
    , sticker             :: Maybe Sticker.Sticker -- ^ A sticker to be shown along with the option; may be null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiftPaymentOption where
  shortShow PremiumGiftPaymentOption
    { currency            = currency_
    , amount              = amount_
    , star_count          = star_count_
    , discount_percentage = discount_percentage_
    , month_count         = month_count_
    , store_product_id    = store_product_id_
    , sticker             = sticker_
    }
      = "PremiumGiftPaymentOption"
        ++ I.cc
        [ "currency"            `I.p` currency_
        , "amount"              `I.p` amount_
        , "star_count"          `I.p` star_count_
        , "discount_percentage" `I.p` discount_percentage_
        , "month_count"         `I.p` month_count_
        , "store_product_id"    `I.p` store_product_id_
        , "sticker"             `I.p` sticker_
        ]

instance AT.FromJSON PremiumGiftPaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiftPaymentOption" -> parsePremiumGiftPaymentOption v
      _                          -> mempty
    
    where
      parsePremiumGiftPaymentOption :: A.Value -> AT.Parser PremiumGiftPaymentOption
      parsePremiumGiftPaymentOption = A.withObject "PremiumGiftPaymentOption" $ \o -> do
        currency_            <- o A..:?  "currency"
        amount_              <- o A..:?  "amount"
        star_count_          <- o A..:?  "star_count"
        discount_percentage_ <- o A..:?  "discount_percentage"
        month_count_         <- o A..:?  "month_count"
        store_product_id_    <- o A..:?  "store_product_id"
        sticker_             <- o A..:?  "sticker"
        pure $ PremiumGiftPaymentOption
          { currency            = currency_
          , amount              = amount_
          , star_count          = star_count_
          , discount_percentage = discount_percentage_
          , month_count         = month_count_
          , store_product_id    = store_product_id_
          , sticker             = sticker_
          }
  parseJSON _ = mempty

