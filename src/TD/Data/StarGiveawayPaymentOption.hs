module TD.Data.StarGiveawayPaymentOption
  (StarGiveawayPaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarGiveawayWinnerOption as StarGiveawayWinnerOption

data StarGiveawayPaymentOption
  = StarGiveawayPaymentOption -- ^ Describes an option for creating Telegram Star giveaway. Use telegramPaymentPurposeStarGiveaway for out-of-store payments
    { currency           :: Maybe T.Text                                              -- ^ ISO 4217 currency code for the payment
    , amount             :: Maybe Int                                                 -- ^ The amount to pay, in the smallest units of the currency
    , star_count         :: Maybe Int                                                 -- ^ Number of Telegram Stars that will be distributed among winners
    , store_product_id   :: Maybe T.Text                                              -- ^ Identifier of the store product associated with the option; may be empty if none
    , yearly_boost_count :: Maybe Int                                                 -- ^ Number of times the chat will be boosted for one year if the option is chosen
    , winner_options     :: Maybe [StarGiveawayWinnerOption.StarGiveawayWinnerOption] -- ^ Allowed options for the number of giveaway winners
    , is_default         :: Maybe Bool                                                -- ^ True, if the option must be chosen by default
    , is_additional      :: Maybe Bool                                                -- ^ True, if the option must be shown only in the full list of payment options
    }
  deriving (Eq, Show)

instance I.ShortShow StarGiveawayPaymentOption where
  shortShow StarGiveawayPaymentOption
    { currency           = currency_
    , amount             = amount_
    , star_count         = star_count_
    , store_product_id   = store_product_id_
    , yearly_boost_count = yearly_boost_count_
    , winner_options     = winner_options_
    , is_default         = is_default_
    , is_additional      = is_additional_
    }
      = "StarGiveawayPaymentOption"
        ++ I.cc
        [ "currency"           `I.p` currency_
        , "amount"             `I.p` amount_
        , "star_count"         `I.p` star_count_
        , "store_product_id"   `I.p` store_product_id_
        , "yearly_boost_count" `I.p` yearly_boost_count_
        , "winner_options"     `I.p` winner_options_
        , "is_default"         `I.p` is_default_
        , "is_additional"      `I.p` is_additional_
        ]

instance AT.FromJSON StarGiveawayPaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starGiveawayPaymentOption" -> parseStarGiveawayPaymentOption v
      _                           -> mempty
    
    where
      parseStarGiveawayPaymentOption :: A.Value -> AT.Parser StarGiveawayPaymentOption
      parseStarGiveawayPaymentOption = A.withObject "StarGiveawayPaymentOption" $ \o -> do
        currency_           <- o A..:?  "currency"
        amount_             <- o A..:?  "amount"
        star_count_         <- o A..:?  "star_count"
        store_product_id_   <- o A..:?  "store_product_id"
        yearly_boost_count_ <- o A..:?  "yearly_boost_count"
        winner_options_     <- o A..:?  "winner_options"
        is_default_         <- o A..:?  "is_default"
        is_additional_      <- o A..:?  "is_additional"
        pure $ StarGiveawayPaymentOption
          { currency           = currency_
          , amount             = amount_
          , star_count         = star_count_
          , store_product_id   = store_product_id_
          , yearly_boost_count = yearly_boost_count_
          , winner_options     = winner_options_
          , is_default         = is_default_
          , is_additional      = is_additional_
          }
  parseJSON _ = mempty

