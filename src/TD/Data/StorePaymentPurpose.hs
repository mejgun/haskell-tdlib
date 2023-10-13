module TD.Data.StorePaymentPurpose (StorePaymentPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data StorePaymentPurpose -- ^ Describes a purpose of an in-store payment
  = StorePaymentPurposePremiumSubscription -- ^ The user subscribed to Telegram Premium
    { is_restore :: Maybe Bool -- ^ Pass true if this is a restore of a Telegram Premium purchase; only for App Store
    , is_upgrade :: Maybe Bool -- ^ Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
    }
  | StorePaymentPurposeGiftedPremium -- ^ The user gifted Telegram Premium to another user
    { user_id  :: Maybe Int    -- ^ Identifier of the user for which Premium was gifted
    , currency :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount   :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    }
  deriving (Eq)

instance Show StorePaymentPurpose where
  show StorePaymentPurposePremiumSubscription
    { is_restore = is_restore_
    , is_upgrade = is_upgrade_
    }
      = "StorePaymentPurposePremiumSubscription"
        ++ I.cc
        [ "is_restore" `I.p` is_restore_
        , "is_upgrade" `I.p` is_upgrade_
        ]
  show StorePaymentPurposeGiftedPremium
    { user_id  = user_id_
    , currency = currency_
    , amount   = amount_
    }
      = "StorePaymentPurposeGiftedPremium"
        ++ I.cc
        [ "user_id"  `I.p` user_id_
        , "currency" `I.p` currency_
        , "amount"   `I.p` amount_
        ]

instance AT.FromJSON StorePaymentPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storePaymentPurposePremiumSubscription" -> parseStorePaymentPurposePremiumSubscription v
      "storePaymentPurposeGiftedPremium"       -> parseStorePaymentPurposeGiftedPremium v
      _                                        -> mempty
    
    where
      parseStorePaymentPurposePremiumSubscription :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposePremiumSubscription = A.withObject "StorePaymentPurposePremiumSubscription" $ \o -> do
        is_restore_ <- o A..:?  "is_restore"
        is_upgrade_ <- o A..:?  "is_upgrade"
        pure $ StorePaymentPurposePremiumSubscription
          { is_restore = is_restore_
          , is_upgrade = is_upgrade_
          }
      parseStorePaymentPurposeGiftedPremium :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposeGiftedPremium = A.withObject "StorePaymentPurposeGiftedPremium" $ \o -> do
        user_id_  <- o A..:?  "user_id"
        currency_ <- o A..:?  "currency"
        amount_   <- o A..:?  "amount"
        pure $ StorePaymentPurposeGiftedPremium
          { user_id  = user_id_
          , currency = currency_
          , amount   = amount_
          }
  parseJSON _ = mempty

instance AT.ToJSON StorePaymentPurpose where
  toJSON StorePaymentPurposePremiumSubscription
    { is_restore = is_restore_
    , is_upgrade = is_upgrade_
    }
      = A.object
        [ "@type"      A..= AT.String "storePaymentPurposePremiumSubscription"
        , "is_restore" A..= is_restore_
        , "is_upgrade" A..= is_upgrade_
        ]
  toJSON StorePaymentPurposeGiftedPremium
    { user_id  = user_id_
    , currency = currency_
    , amount   = amount_
    }
      = A.object
        [ "@type"    A..= AT.String "storePaymentPurposeGiftedPremium"
        , "user_id"  A..= user_id_
        , "currency" A..= currency_
        , "amount"   A..= amount_
        ]
