{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorePaymentPurpose where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a purpose of an in-store payment
data StorePaymentPurpose
  = -- | The user subscribed to Telegram Premium @is_restore Pass true if this is a restore of a Telegram Premium purchase; only for App Store @is_upgrade Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
    StorePaymentPurposePremiumSubscription
      { -- |
        is_upgrade :: Maybe Bool,
        -- |
        is_restore :: Maybe Bool
      }
  | -- | The user gifted Telegram Premium to another user @user_id Identifier of the user for which Premium was gifted @currency ISO 4217 currency code of the payment currency @amount Paid amount, in the smallest units of the currency
    StorePaymentPurposeGiftedPremium
      { -- |
        amount :: Maybe Int,
        -- |
        currency :: Maybe String,
        -- |
        user_id :: Maybe Int
      }
  deriving (Eq)

instance Show StorePaymentPurpose where
  show
    StorePaymentPurposePremiumSubscription
      { is_upgrade = is_upgrade_,
        is_restore = is_restore_
      } =
      "StorePaymentPurposePremiumSubscription"
        ++ U.cc
          [ U.p "is_upgrade" is_upgrade_,
            U.p "is_restore" is_restore_
          ]
  show
    StorePaymentPurposeGiftedPremium
      { amount = amount_,
        currency = currency_,
        user_id = user_id_
      } =
      "StorePaymentPurposeGiftedPremium"
        ++ U.cc
          [ U.p "amount" amount_,
            U.p "currency" currency_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON StorePaymentPurpose where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storePaymentPurposePremiumSubscription" -> parseStorePaymentPurposePremiumSubscription v
      "storePaymentPurposeGiftedPremium" -> parseStorePaymentPurposeGiftedPremium v
      _ -> mempty
    where
      parseStorePaymentPurposePremiumSubscription :: A.Value -> T.Parser StorePaymentPurpose
      parseStorePaymentPurposePremiumSubscription = A.withObject "StorePaymentPurposePremiumSubscription" $ \o -> do
        is_upgrade_ <- o A..:? "is_upgrade"
        is_restore_ <- o A..:? "is_restore"
        return $ StorePaymentPurposePremiumSubscription {is_upgrade = is_upgrade_, is_restore = is_restore_}

      parseStorePaymentPurposeGiftedPremium :: A.Value -> T.Parser StorePaymentPurpose
      parseStorePaymentPurposeGiftedPremium = A.withObject "StorePaymentPurposeGiftedPremium" $ \o -> do
        amount_ <- o A..:? "amount"
        currency_ <- o A..:? "currency"
        user_id_ <- o A..:? "user_id"
        return $ StorePaymentPurposeGiftedPremium {amount = amount_, currency = currency_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON StorePaymentPurpose where
  toJSON
    StorePaymentPurposePremiumSubscription
      { is_upgrade = is_upgrade_,
        is_restore = is_restore_
      } =
      A.object
        [ "@type" A..= T.String "storePaymentPurposePremiumSubscription",
          "is_upgrade" A..= is_upgrade_,
          "is_restore" A..= is_restore_
        ]
  toJSON
    StorePaymentPurposeGiftedPremium
      { amount = amount_,
        currency = currency_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "storePaymentPurposeGiftedPremium",
          "amount" A..= amount_,
          "currency" A..= currency_,
          "user_id" A..= user_id_
        ]
