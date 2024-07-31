module TD.Data.StarPaymentOption
  (StarPaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data StarPaymentOption
  = StarPaymentOption -- ^ Describes an option for buying Telegram Stars. Use telegramPaymentPurposeStars for out-of-store payments
    { currency         :: Maybe T.Text -- ^ ISO 4217 currency code for the payment
    , amount           :: Maybe Int    -- ^ The amount to pay, in the smallest units of the currency
    , star_count       :: Maybe Int    -- ^ Number of Telegram Stars that will be purchased
    , store_product_id :: Maybe T.Text -- ^ Identifier of the store product associated with the option; may be empty if none
    , is_additional    :: Maybe Bool   -- ^ True, if the option must be shown only in the full list of payment options
    }
  deriving (Eq, Show)

instance I.ShortShow StarPaymentOption where
  shortShow StarPaymentOption
    { currency         = currency_
    , amount           = amount_
    , star_count       = star_count_
    , store_product_id = store_product_id_
    , is_additional    = is_additional_
    }
      = "StarPaymentOption"
        ++ I.cc
        [ "currency"         `I.p` currency_
        , "amount"           `I.p` amount_
        , "star_count"       `I.p` star_count_
        , "store_product_id" `I.p` store_product_id_
        , "is_additional"    `I.p` is_additional_
        ]

instance AT.FromJSON StarPaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starPaymentOption" -> parseStarPaymentOption v
      _                   -> mempty
    
    where
      parseStarPaymentOption :: A.Value -> AT.Parser StarPaymentOption
      parseStarPaymentOption = A.withObject "StarPaymentOption" $ \o -> do
        currency_         <- o A..:?  "currency"
        amount_           <- o A..:?  "amount"
        star_count_       <- o A..:?  "star_count"
        store_product_id_ <- o A..:?  "store_product_id"
        is_additional_    <- o A..:?  "is_additional"
        pure $ StarPaymentOption
          { currency         = currency_
          , amount           = amount_
          , star_count       = star_count_
          , store_product_id = store_product_id_
          , is_additional    = is_additional_
          }
  parseJSON _ = mempty

