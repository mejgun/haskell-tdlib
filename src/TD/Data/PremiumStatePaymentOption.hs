{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumStatePaymentOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumPaymentOption as PremiumPaymentOption
import qualified Utils as U

-- |
data PremiumStatePaymentOption = -- | Describes an option for buying or upgrading Telegram Premium for self
  PremiumStatePaymentOption
  { -- | Identifier of the last in-store transaction for the currently used option
    last_transaction_id :: Maybe String,
    -- | True, if the payment option can be used to upgrade the existing Telegram Premium subscription
    is_upgrade :: Maybe Bool,
    -- | True, if this is the currently used Telegram Premium subscription option
    is_current :: Maybe Bool,
    -- | Information about the payment option
    payment_option :: Maybe PremiumPaymentOption.PremiumPaymentOption
  }
  deriving (Eq)

instance Show PremiumStatePaymentOption where
  show
    PremiumStatePaymentOption
      { last_transaction_id = last_transaction_id_,
        is_upgrade = is_upgrade_,
        is_current = is_current_,
        payment_option = payment_option_
      } =
      "PremiumStatePaymentOption"
        ++ U.cc
          [ U.p "last_transaction_id" last_transaction_id_,
            U.p "is_upgrade" is_upgrade_,
            U.p "is_current" is_current_,
            U.p "payment_option" payment_option_
          ]

instance T.FromJSON PremiumStatePaymentOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumStatePaymentOption" -> parsePremiumStatePaymentOption v
      _ -> mempty
    where
      parsePremiumStatePaymentOption :: A.Value -> T.Parser PremiumStatePaymentOption
      parsePremiumStatePaymentOption = A.withObject "PremiumStatePaymentOption" $ \o -> do
        last_transaction_id_ <- o A..:? "last_transaction_id"
        is_upgrade_ <- o A..:? "is_upgrade"
        is_current_ <- o A..:? "is_current"
        payment_option_ <- o A..:? "payment_option"
        return $ PremiumStatePaymentOption {last_transaction_id = last_transaction_id_, is_upgrade = is_upgrade_, is_current = is_current_, payment_option = payment_option_}
  parseJSON _ = mempty

instance T.ToJSON PremiumStatePaymentOption where
  toJSON
    PremiumStatePaymentOption
      { last_transaction_id = last_transaction_id_,
        is_upgrade = is_upgrade_,
        is_current = is_current_,
        payment_option = payment_option_
      } =
      A.object
        [ "@type" A..= T.String "premiumStatePaymentOption",
          "last_transaction_id" A..= last_transaction_id_,
          "is_upgrade" A..= is_upgrade_,
          "is_current" A..= is_current_,
          "payment_option" A..= payment_option_
        ]
