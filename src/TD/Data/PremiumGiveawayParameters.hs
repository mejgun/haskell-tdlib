module TD.Data.PremiumGiveawayParameters
  ( PremiumGiveawayParameters(..)    
  , defaultPremiumGiveawayParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PremiumGiveawayParameters
  = PremiumGiveawayParameters -- ^ Describes parameters of a Telegram Premium giveaway
    { boosted_chat_id        :: Maybe Int      -- ^ Identifier of the channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Premium subscription
    , additional_chat_ids    :: Maybe [Int]    -- ^ Identifiers of other channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats
    , winners_selection_date :: Maybe Int      -- ^ Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways
    , only_new_members       :: Maybe Bool     -- ^ True, if only new members of the chats will be eligible for the giveaway
    , country_codes          :: Maybe [T.Text] -- ^ The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought on Fragment can participate in any giveaway and the country code "FT" must not be specified in the list
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiveawayParameters where
  shortShow PremiumGiveawayParameters
    { boosted_chat_id        = boosted_chat_id_
    , additional_chat_ids    = additional_chat_ids_
    , winners_selection_date = winners_selection_date_
    , only_new_members       = only_new_members_
    , country_codes          = country_codes_
    }
      = "PremiumGiveawayParameters"
        ++ I.cc
        [ "boosted_chat_id"        `I.p` boosted_chat_id_
        , "additional_chat_ids"    `I.p` additional_chat_ids_
        , "winners_selection_date" `I.p` winners_selection_date_
        , "only_new_members"       `I.p` only_new_members_
        , "country_codes"          `I.p` country_codes_
        ]

instance AT.FromJSON PremiumGiveawayParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiveawayParameters" -> parsePremiumGiveawayParameters v
      _                           -> mempty
    
    where
      parsePremiumGiveawayParameters :: A.Value -> AT.Parser PremiumGiveawayParameters
      parsePremiumGiveawayParameters = A.withObject "PremiumGiveawayParameters" $ \o -> do
        boosted_chat_id_        <- o A..:?  "boosted_chat_id"
        additional_chat_ids_    <- o A..:?  "additional_chat_ids"
        winners_selection_date_ <- o A..:?  "winners_selection_date"
        only_new_members_       <- o A..:?  "only_new_members"
        country_codes_          <- o A..:?  "country_codes"
        pure $ PremiumGiveawayParameters
          { boosted_chat_id        = boosted_chat_id_
          , additional_chat_ids    = additional_chat_ids_
          , winners_selection_date = winners_selection_date_
          , only_new_members       = only_new_members_
          , country_codes          = country_codes_
          }
  parseJSON _ = mempty

instance AT.ToJSON PremiumGiveawayParameters where
  toJSON PremiumGiveawayParameters
    { boosted_chat_id        = boosted_chat_id_
    , additional_chat_ids    = additional_chat_ids_
    , winners_selection_date = winners_selection_date_
    , only_new_members       = only_new_members_
    , country_codes          = country_codes_
    }
      = A.object
        [ "@type"                  A..= AT.String "premiumGiveawayParameters"
        , "boosted_chat_id"        A..= boosted_chat_id_
        , "additional_chat_ids"    A..= additional_chat_ids_
        , "winners_selection_date" A..= winners_selection_date_
        , "only_new_members"       A..= only_new_members_
        , "country_codes"          A..= country_codes_
        ]

defaultPremiumGiveawayParameters :: PremiumGiveawayParameters
defaultPremiumGiveawayParameters =
  PremiumGiveawayParameters
    { boosted_chat_id        = Nothing
    , additional_chat_ids    = Nothing
    , winners_selection_date = Nothing
    , only_new_members       = Nothing
    , country_codes          = Nothing
    }

