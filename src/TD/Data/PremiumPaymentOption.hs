module TD.Data.PremiumPaymentOption
  (PremiumPaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InternalLinkType as InternalLinkType

data PremiumPaymentOption
  = PremiumPaymentOption -- ^ Describes an option for buying Telegram Premium to a user
    { currency            :: Maybe T.Text                            -- ^ ISO 4217 currency code for Telegram Premium subscription payment
    , amount              :: Maybe Int                               -- ^ The amount to pay, in the smallest units of the currency
    , discount_percentage :: Maybe Int                               -- ^ The discount associated with this option, as a percentage
    , month_count         :: Maybe Int                               -- ^ Number of months the Telegram Premium subscription will be active. Use getPremiumInfoSticker to get the sticker to be used as representation of the Telegram Premium subscription
    , store_product_id    :: Maybe T.Text                            -- ^ Identifier of the store product associated with the option
    , payment_link        :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link to be opened for buying Telegram Premium to the user if store payment isn't possible; may be null if direct payment isn't available
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumPaymentOption where
  shortShow PremiumPaymentOption
    { currency            = currency_
    , amount              = amount_
    , discount_percentage = discount_percentage_
    , month_count         = month_count_
    , store_product_id    = store_product_id_
    , payment_link        = payment_link_
    }
      = "PremiumPaymentOption"
        ++ I.cc
        [ "currency"            `I.p` currency_
        , "amount"              `I.p` amount_
        , "discount_percentage" `I.p` discount_percentage_
        , "month_count"         `I.p` month_count_
        , "store_product_id"    `I.p` store_product_id_
        , "payment_link"        `I.p` payment_link_
        ]

instance AT.FromJSON PremiumPaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumPaymentOption" -> parsePremiumPaymentOption v
      _                      -> mempty
    
    where
      parsePremiumPaymentOption :: A.Value -> AT.Parser PremiumPaymentOption
      parsePremiumPaymentOption = A.withObject "PremiumPaymentOption" $ \o -> do
        currency_            <- o A..:?  "currency"
        amount_              <- o A..:?  "amount"
        discount_percentage_ <- o A..:?  "discount_percentage"
        month_count_         <- o A..:?  "month_count"
        store_product_id_    <- o A..:?  "store_product_id"
        payment_link_        <- o A..:?  "payment_link"
        pure $ PremiumPaymentOption
          { currency            = currency_
          , amount              = amount_
          , discount_percentage = discount_percentage_
          , month_count         = month_count_
          , store_product_id    = store_product_id_
          , payment_link        = payment_link_
          }
  parseJSON _ = mempty

