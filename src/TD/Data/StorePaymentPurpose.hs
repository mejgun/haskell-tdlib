module TD.Data.StorePaymentPurpose
  (StorePaymentPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.GiveawayParameters as GiveawayParameters

-- | Describes a purpose of an in-store payment
data StorePaymentPurpose
  = StorePaymentPurposePremiumSubscription -- ^ The user subscribing to Telegram Premium
    { is_restore :: Maybe Bool -- ^ Pass true if this is a restore of a Telegram Premium purchase; only for App Store
    , is_upgrade :: Maybe Bool -- ^ Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
    }
  | StorePaymentPurposePremiumGiftCodes -- ^ The user creating Telegram Premium gift codes for other users
    { boosted_chat_id :: Maybe Int                         -- ^ Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user; 0 if none
    , currency        :: Maybe T.Text                      -- ^ ISO 4217 currency code of the payment currency
    , amount          :: Maybe Int                         -- ^ Paid amount, in the smallest units of the currency
    , user_ids        :: Maybe [Int]                       -- ^ Identifiers of the users which can activate the gift codes
    , text            :: Maybe FormattedText.FormattedText -- ^ Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed
    }
  | StorePaymentPurposePremiumGiveaway -- ^ The user creating a Telegram Premium giveaway
    { parameters :: Maybe GiveawayParameters.GiveawayParameters -- ^ Giveaway parameters
    , currency   :: Maybe T.Text                                -- ^ ISO 4217 currency code of the payment currency
    , amount     :: Maybe Int                                   -- ^ Paid amount, in the smallest units of the currency
    }
  | StorePaymentPurposeStarGiveaway -- ^ The user creating a Telegram Star giveaway
    { parameters   :: Maybe GiveawayParameters.GiveawayParameters -- ^ Giveaway parameters
    , currency     :: Maybe T.Text                                -- ^ ISO 4217 currency code of the payment currency
    , amount       :: Maybe Int                                   -- ^ Paid amount, in the smallest units of the currency
    , winner_count :: Maybe Int                                   -- ^ The number of users to receive Telegram Stars
    , star_count   :: Maybe Int                                   -- ^ The number of Telegram Stars to be distributed through the giveaway
    }
  | StorePaymentPurposeStars -- ^ The user buying Telegram Stars
    { currency   :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount     :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    , star_count :: Maybe Int    -- ^ Number of bought Telegram Stars
    }
  | StorePaymentPurposeGiftedStars -- ^ The user buying Telegram Stars for other users
    { user_id    :: Maybe Int    -- ^ Identifier of the user to which Telegram Stars are gifted
    , currency   :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , amount     :: Maybe Int    -- ^ Paid amount, in the smallest units of the currency
    , star_count :: Maybe Int    -- ^ Number of bought Telegram Stars
    }
  deriving (Eq, Show)

instance I.ShortShow StorePaymentPurpose where
  shortShow StorePaymentPurposePremiumSubscription
    { is_restore = is_restore_
    , is_upgrade = is_upgrade_
    }
      = "StorePaymentPurposePremiumSubscription"
        ++ I.cc
        [ "is_restore" `I.p` is_restore_
        , "is_upgrade" `I.p` is_upgrade_
        ]
  shortShow StorePaymentPurposePremiumGiftCodes
    { boosted_chat_id = boosted_chat_id_
    , currency        = currency_
    , amount          = amount_
    , user_ids        = user_ids_
    , text            = text_
    }
      = "StorePaymentPurposePremiumGiftCodes"
        ++ I.cc
        [ "boosted_chat_id" `I.p` boosted_chat_id_
        , "currency"        `I.p` currency_
        , "amount"          `I.p` amount_
        , "user_ids"        `I.p` user_ids_
        , "text"            `I.p` text_
        ]
  shortShow StorePaymentPurposePremiumGiveaway
    { parameters = parameters_
    , currency   = currency_
    , amount     = amount_
    }
      = "StorePaymentPurposePremiumGiveaway"
        ++ I.cc
        [ "parameters" `I.p` parameters_
        , "currency"   `I.p` currency_
        , "amount"     `I.p` amount_
        ]
  shortShow StorePaymentPurposeStarGiveaway
    { parameters   = parameters_
    , currency     = currency_
    , amount       = amount_
    , winner_count = winner_count_
    , star_count   = star_count_
    }
      = "StorePaymentPurposeStarGiveaway"
        ++ I.cc
        [ "parameters"   `I.p` parameters_
        , "currency"     `I.p` currency_
        , "amount"       `I.p` amount_
        , "winner_count" `I.p` winner_count_
        , "star_count"   `I.p` star_count_
        ]
  shortShow StorePaymentPurposeStars
    { currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = "StorePaymentPurposeStars"
        ++ I.cc
        [ "currency"   `I.p` currency_
        , "amount"     `I.p` amount_
        , "star_count" `I.p` star_count_
        ]
  shortShow StorePaymentPurposeGiftedStars
    { user_id    = user_id_
    , currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = "StorePaymentPurposeGiftedStars"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "currency"   `I.p` currency_
        , "amount"     `I.p` amount_
        , "star_count" `I.p` star_count_
        ]

instance AT.FromJSON StorePaymentPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storePaymentPurposePremiumSubscription" -> parseStorePaymentPurposePremiumSubscription v
      "storePaymentPurposePremiumGiftCodes"    -> parseStorePaymentPurposePremiumGiftCodes v
      "storePaymentPurposePremiumGiveaway"     -> parseStorePaymentPurposePremiumGiveaway v
      "storePaymentPurposeStarGiveaway"        -> parseStorePaymentPurposeStarGiveaway v
      "storePaymentPurposeStars"               -> parseStorePaymentPurposeStars v
      "storePaymentPurposeGiftedStars"         -> parseStorePaymentPurposeGiftedStars v
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
      parseStorePaymentPurposePremiumGiftCodes :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposePremiumGiftCodes = A.withObject "StorePaymentPurposePremiumGiftCodes" $ \o -> do
        boosted_chat_id_ <- o A..:?  "boosted_chat_id"
        currency_        <- o A..:?  "currency"
        amount_          <- o A..:?  "amount"
        user_ids_        <- o A..:?  "user_ids"
        text_            <- o A..:?  "text"
        pure $ StorePaymentPurposePremiumGiftCodes
          { boosted_chat_id = boosted_chat_id_
          , currency        = currency_
          , amount          = amount_
          , user_ids        = user_ids_
          , text            = text_
          }
      parseStorePaymentPurposePremiumGiveaway :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposePremiumGiveaway = A.withObject "StorePaymentPurposePremiumGiveaway" $ \o -> do
        parameters_ <- o A..:?  "parameters"
        currency_   <- o A..:?  "currency"
        amount_     <- o A..:?  "amount"
        pure $ StorePaymentPurposePremiumGiveaway
          { parameters = parameters_
          , currency   = currency_
          , amount     = amount_
          }
      parseStorePaymentPurposeStarGiveaway :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposeStarGiveaway = A.withObject "StorePaymentPurposeStarGiveaway" $ \o -> do
        parameters_   <- o A..:?  "parameters"
        currency_     <- o A..:?  "currency"
        amount_       <- o A..:?  "amount"
        winner_count_ <- o A..:?  "winner_count"
        star_count_   <- o A..:?  "star_count"
        pure $ StorePaymentPurposeStarGiveaway
          { parameters   = parameters_
          , currency     = currency_
          , amount       = amount_
          , winner_count = winner_count_
          , star_count   = star_count_
          }
      parseStorePaymentPurposeStars :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposeStars = A.withObject "StorePaymentPurposeStars" $ \o -> do
        currency_   <- o A..:?  "currency"
        amount_     <- o A..:?  "amount"
        star_count_ <- o A..:?  "star_count"
        pure $ StorePaymentPurposeStars
          { currency   = currency_
          , amount     = amount_
          , star_count = star_count_
          }
      parseStorePaymentPurposeGiftedStars :: A.Value -> AT.Parser StorePaymentPurpose
      parseStorePaymentPurposeGiftedStars = A.withObject "StorePaymentPurposeGiftedStars" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        currency_   <- o A..:?  "currency"
        amount_     <- o A..:?  "amount"
        star_count_ <- o A..:?  "star_count"
        pure $ StorePaymentPurposeGiftedStars
          { user_id    = user_id_
          , currency   = currency_
          , amount     = amount_
          , star_count = star_count_
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
  toJSON StorePaymentPurposePremiumGiftCodes
    { boosted_chat_id = boosted_chat_id_
    , currency        = currency_
    , amount          = amount_
    , user_ids        = user_ids_
    , text            = text_
    }
      = A.object
        [ "@type"           A..= AT.String "storePaymentPurposePremiumGiftCodes"
        , "boosted_chat_id" A..= boosted_chat_id_
        , "currency"        A..= currency_
        , "amount"          A..= amount_
        , "user_ids"        A..= user_ids_
        , "text"            A..= text_
        ]
  toJSON StorePaymentPurposePremiumGiveaway
    { parameters = parameters_
    , currency   = currency_
    , amount     = amount_
    }
      = A.object
        [ "@type"      A..= AT.String "storePaymentPurposePremiumGiveaway"
        , "parameters" A..= parameters_
        , "currency"   A..= currency_
        , "amount"     A..= amount_
        ]
  toJSON StorePaymentPurposeStarGiveaway
    { parameters   = parameters_
    , currency     = currency_
    , amount       = amount_
    , winner_count = winner_count_
    , star_count   = star_count_
    }
      = A.object
        [ "@type"        A..= AT.String "storePaymentPurposeStarGiveaway"
        , "parameters"   A..= parameters_
        , "currency"     A..= currency_
        , "amount"       A..= amount_
        , "winner_count" A..= winner_count_
        , "star_count"   A..= star_count_
        ]
  toJSON StorePaymentPurposeStars
    { currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "storePaymentPurposeStars"
        , "currency"   A..= currency_
        , "amount"     A..= amount_
        , "star_count" A..= star_count_
        ]
  toJSON StorePaymentPurposeGiftedStars
    { user_id    = user_id_
    , currency   = currency_
    , amount     = amount_
    , star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "storePaymentPurposeGiftedStars"
        , "user_id"    A..= user_id_
        , "currency"   A..= currency_
        , "amount"     A..= amount_
        , "star_count" A..= star_count_
        ]

