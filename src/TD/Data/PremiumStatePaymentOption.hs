module TD.Data.PremiumStatePaymentOption
  (PremiumStatePaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumPaymentOption as PremiumPaymentOption
import qualified Data.Text as T

data PremiumStatePaymentOption
  = PremiumStatePaymentOption -- ^ Describes an option for buying or upgrading Telegram Premium for self
    { payment_option      :: Maybe PremiumPaymentOption.PremiumPaymentOption -- ^ Information about the payment option
    , is_current          :: Maybe Bool                                      -- ^ True, if this is the currently used Telegram Premium subscription option
    , is_upgrade          :: Maybe Bool                                      -- ^ True, if the payment option can be used to upgrade the existing Telegram Premium subscription
    , last_transaction_id :: Maybe T.Text                                    -- ^ Identifier of the last in-store transaction for the currently used option
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumStatePaymentOption where
  shortShow PremiumStatePaymentOption
    { payment_option      = payment_option_
    , is_current          = is_current_
    , is_upgrade          = is_upgrade_
    , last_transaction_id = last_transaction_id_
    }
      = "PremiumStatePaymentOption"
        ++ I.cc
        [ "payment_option"      `I.p` payment_option_
        , "is_current"          `I.p` is_current_
        , "is_upgrade"          `I.p` is_upgrade_
        , "last_transaction_id" `I.p` last_transaction_id_
        ]

instance AT.FromJSON PremiumStatePaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumStatePaymentOption" -> parsePremiumStatePaymentOption v
      _                           -> mempty
    
    where
      parsePremiumStatePaymentOption :: A.Value -> AT.Parser PremiumStatePaymentOption
      parsePremiumStatePaymentOption = A.withObject "PremiumStatePaymentOption" $ \o -> do
        payment_option_      <- o A..:?  "payment_option"
        is_current_          <- o A..:?  "is_current"
        is_upgrade_          <- o A..:?  "is_upgrade"
        last_transaction_id_ <- o A..:?  "last_transaction_id"
        pure $ PremiumStatePaymentOption
          { payment_option      = payment_option_
          , is_current          = is_current_
          , is_upgrade          = is_upgrade_
          , last_transaction_id = last_transaction_id_
          }
  parseJSON _ = mempty

