module TD.Data.TelegramPaymentPurpose
  (TelegramPaymentPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PremiumGiveawayParameters as PremiumGiveawayParameters

-- | Describes a purpose of a payment toward Telegram
data TelegramPaymentPurpose
  = TelegramPaymentPurposePremiumGiftCodes -- ^ The user creating Telegram Premium gift codes for other users
    { boosted_chat_id :: Maybe Int    -- ^ Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user; 0 if none
    , currency        :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount          :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    , user_ids        :: Maybe [Int]  -- ^ Identifiers of the users which can activate the gift codes
    , month_count     :: Maybe Int    -- ^ Number of months the Telegram Premium subscription will be active for the users
    }
  | TelegramPaymentPurposePremiumGiveaway -- ^ The user creating a Telegram Premium giveaway
    { parameters   :: Maybe PremiumGiveawayParameters.PremiumGiveawayParameters -- ^ Giveaway parameters
    , currency     :: Maybe T.Text                                              -- ^ ISO 4217 currency code of the payment currency
    , amount       :: Maybe Int                                                 -- ^ Paid amount, in the smallest units of the currency
    , winner_count :: Maybe Int                                                 -- ^ Number of users which will be able to activate the gift codes
    , month_count  :: Maybe Int                                                 -- ^ Number of months the Telegram Premium subscription will be active for the users
    }
  | TelegramPaymentPurposeStars -- ^ The user buying Telegram Stars
    { currency   :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount     :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    , star_count :: Maybe Int    -- ^ Number of bought Telegram Stars
    }
  | TelegramPaymentPurposeGiftedStars -- ^ The user buying Telegram Stars for other users
    { user_id    :: Maybe Int    -- ^ Identifier of the user to which Telegram Stars are gifted
    , currency   :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount     :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    , star_count :: Maybe Int    -- ^ Number of bought Telegram Stars
    }
  deriving (Eq, Show)

instance I.ShortShow TelegramPaymentPurpose where
  shortShow TelegramPaymentPurposePremiumGiftCodes
    { boosted_chat_id = boosted_chat_id_
    , currency        = currency_
    , amount          = amount_
    , user_ids        = user_ids_
    , month_count     = month_count_
    }
      = "TelegramPaymentPurposePremiumGiftCodes"
        ++ I.cc
        [ "boosted_chat_id" `I.p` boosted_chat_id_
        , "currency"        `I.p` currency_
        , "amount"          `I.p` amount_
        , "user_ids"        `I.p` user_ids_
        , "month_count"     `I.p` month_count_
        ]
  shortShow TelegramPaymentPurposePremiumGiveaway
    { parameters   = parameters_
    , currency     = currency_
    , amount       = amount_
    , winner_count = winner_count_
    , month_count  = month_count_
    }
      = "TelegramPaymentPurposePremiumGiveaway"
        ++ I.cc
        [ "parameters"   `I.p` parameters_
        , "currency"     `I.p` currency_
        , "amount"       `I.p` amount_
        , "winner_count" `I.p` winner_count_
        , "month_count"  `I.p` month_count_
        ]
  shortShow TelegramPaymentPurposeStars
    { currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = "TelegramPaymentPurposeStars"
        ++ I.cc
        [ "currency"   `I.p` currency_
        , "amount"     `I.p` amount_
        , "star_count" `I.p` star_count_
        ]
  shortShow TelegramPaymentPurposeGiftedStars
    { user_id    = user_id_
    , currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = "TelegramPaymentPurposeGiftedStars"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "currency"   `I.p` currency_
        , "amount"     `I.p` amount_
        , "star_count" `I.p` star_count_
        ]

instance AT.FromJSON TelegramPaymentPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "telegramPaymentPurposePremiumGiftCodes" -> parseTelegramPaymentPurposePremiumGiftCodes v
      "telegramPaymentPurposePremiumGiveaway"  -> parseTelegramPaymentPurposePremiumGiveaway v
      "telegramPaymentPurposeStars"            -> parseTelegramPaymentPurposeStars v
      "telegramPaymentPurposeGiftedStars"      -> parseTelegramPaymentPurposeGiftedStars v
      _                                        -> mempty
    
    where
      parseTelegramPaymentPurposePremiumGiftCodes :: A.Value -> AT.Parser TelegramPaymentPurpose
      parseTelegramPaymentPurposePremiumGiftCodes = A.withObject "TelegramPaymentPurposePremiumGiftCodes" $ \o -> do
        boosted_chat_id_ <- o A..:?  "boosted_chat_id"
        currency_        <- o A..:?  "currency"
        amount_          <- o A..:?  "amount"
        user_ids_        <- o A..:?  "user_ids"
        month_count_     <- o A..:?  "month_count"
        pure $ TelegramPaymentPurposePremiumGiftCodes
          { boosted_chat_id = boosted_chat_id_
          , currency        = currency_
          , amount          = amount_
          , user_ids        = user_ids_
          , month_count     = month_count_
          }
      parseTelegramPaymentPurposePremiumGiveaway :: A.Value -> AT.Parser TelegramPaymentPurpose
      parseTelegramPaymentPurposePremiumGiveaway = A.withObject "TelegramPaymentPurposePremiumGiveaway" $ \o -> do
        parameters_   <- o A..:?  "parameters"
        currency_     <- o A..:?  "currency"
        amount_       <- o A..:?  "amount"
        winner_count_ <- o A..:?  "winner_count"
        month_count_  <- o A..:?  "month_count"
        pure $ TelegramPaymentPurposePremiumGiveaway
          { parameters   = parameters_
          , currency     = currency_
          , amount       = amount_
          , winner_count = winner_count_
          , month_count  = month_count_
          }
      parseTelegramPaymentPurposeStars :: A.Value -> AT.Parser TelegramPaymentPurpose
      parseTelegramPaymentPurposeStars = A.withObject "TelegramPaymentPurposeStars" $ \o -> do
        currency_   <- o A..:?  "currency"
        amount_     <- o A..:?  "amount"
        star_count_ <- o A..:?  "star_count"
        pure $ TelegramPaymentPurposeStars
          { currency   = currency_
          , amount     = amount_
          , star_count = star_count_
          }
      parseTelegramPaymentPurposeGiftedStars :: A.Value -> AT.Parser TelegramPaymentPurpose
      parseTelegramPaymentPurposeGiftedStars = A.withObject "TelegramPaymentPurposeGiftedStars" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        currency_   <- o A..:?  "currency"
        amount_     <- o A..:?  "amount"
        star_count_ <- o A..:?  "star_count"
        pure $ TelegramPaymentPurposeGiftedStars
          { user_id    = user_id_
          , currency   = currency_
          , amount     = amount_
          , star_count = star_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON TelegramPaymentPurpose where
  toJSON TelegramPaymentPurposePremiumGiftCodes
    { boosted_chat_id = boosted_chat_id_
    , currency        = currency_
    , amount          = amount_
    , user_ids        = user_ids_
    , month_count     = month_count_
    }
      = A.object
        [ "@type"           A..= AT.String "telegramPaymentPurposePremiumGiftCodes"
        , "boosted_chat_id" A..= boosted_chat_id_
        , "currency"        A..= currency_
        , "amount"          A..= amount_
        , "user_ids"        A..= user_ids_
        , "month_count"     A..= month_count_
        ]
  toJSON TelegramPaymentPurposePremiumGiveaway
    { parameters   = parameters_
    , currency     = currency_
    , amount       = amount_
    , winner_count = winner_count_
    , month_count  = month_count_
    }
      = A.object
        [ "@type"        A..= AT.String "telegramPaymentPurposePremiumGiveaway"
        , "parameters"   A..= parameters_
        , "currency"     A..= currency_
        , "amount"       A..= amount_
        , "winner_count" A..= winner_count_
        , "month_count"  A..= month_count_
        ]
  toJSON TelegramPaymentPurposeStars
    { currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "telegramPaymentPurposeStars"
        , "currency"   A..= currency_
        , "amount"     A..= amount_
        , "star_count" A..= star_count_
        ]
  toJSON TelegramPaymentPurposeGiftedStars
    { user_id    = user_id_
    , currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "telegramPaymentPurposeGiftedStars"
        , "user_id"    A..= user_id_
        , "currency"   A..= currency_
        , "amount"     A..= amount_
        , "star_count" A..= star_count_
        ]

