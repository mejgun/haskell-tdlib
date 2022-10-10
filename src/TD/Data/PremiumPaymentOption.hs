{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumPaymentOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified Utils as U

-- |
data PremiumPaymentOption = -- | Describes an option for buying Telegram Premium to a user
  PremiumPaymentOption
  { -- | An internal link to be opened for buying Telegram Premium to the user if store payment isn't possible; may be null if direct payment isn't available
    payment_link :: Maybe InternalLinkType.InternalLinkType,
    -- | Identifier of the store product associated with the option
    store_product_id :: Maybe String,
    -- | Number of month the Telegram Premium subscription will be active
    month_count :: Maybe Int,
    -- | The discount associated with this option, as a percentage
    discount_percentage :: Maybe Int,
    -- | The amount to pay, in the smallest units of the currency
    amount :: Maybe Int,
    -- | ISO 4217 currency code for Telegram Premium subscription payment
    currency :: Maybe String
  }
  deriving (Eq)

instance Show PremiumPaymentOption where
  show
    PremiumPaymentOption
      { payment_link = payment_link_,
        store_product_id = store_product_id_,
        month_count = month_count_,
        discount_percentage = discount_percentage_,
        amount = amount_,
        currency = currency_
      } =
      "PremiumPaymentOption"
        ++ U.cc
          [ U.p "payment_link" payment_link_,
            U.p "store_product_id" store_product_id_,
            U.p "month_count" month_count_,
            U.p "discount_percentage" discount_percentage_,
            U.p "amount" amount_,
            U.p "currency" currency_
          ]

instance T.FromJSON PremiumPaymentOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumPaymentOption" -> parsePremiumPaymentOption v
      _ -> mempty
    where
      parsePremiumPaymentOption :: A.Value -> T.Parser PremiumPaymentOption
      parsePremiumPaymentOption = A.withObject "PremiumPaymentOption" $ \o -> do
        payment_link_ <- o A..:? "payment_link"
        store_product_id_ <- o A..:? "store_product_id"
        month_count_ <- o A..:? "month_count"
        discount_percentage_ <- o A..:? "discount_percentage"
        amount_ <- o A..:? "amount"
        currency_ <- o A..:? "currency"
        return $ PremiumPaymentOption {payment_link = payment_link_, store_product_id = store_product_id_, month_count = month_count_, discount_percentage = discount_percentage_, amount = amount_, currency = currency_}
  parseJSON _ = mempty

instance T.ToJSON PremiumPaymentOption where
  toJSON
    PremiumPaymentOption
      { payment_link = payment_link_,
        store_product_id = store_product_id_,
        month_count = month_count_,
        discount_percentage = discount_percentage_,
        amount = amount_,
        currency = currency_
      } =
      A.object
        [ "@type" A..= T.String "premiumPaymentOption",
          "payment_link" A..= payment_link_,
          "store_product_id" A..= store_product_id_,
          "month_count" A..= month_count_,
          "discount_percentage" A..= discount_percentage_,
          "amount" A..= amount_,
          "currency" A..= currency_
        ]
