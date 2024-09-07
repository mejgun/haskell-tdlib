module TD.Data.GiveawayParameters
  ( GiveawayParameters(..)    
  , defaultGiveawayParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GiveawayParameters
  = GiveawayParameters -- ^ Describes parameters of a giveaway
    { boosted_chat_id        :: Maybe Int      -- ^ Identifier of the supergroup or channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Telegram Premium subscription, or for the specified time. If the chat is a channel, then can_post_messages right is required in the channel, otherwise, the user must be an administrator in the supergroup
    , additional_chat_ids    :: Maybe [Int]    -- ^ Identifiers of other supergroup or channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats
    , winners_selection_date :: Maybe Int      -- ^ Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways
    , only_new_members       :: Maybe Bool     -- ^ True, if only new members of the chats will be eligible for the giveaway
    , has_public_winners     :: Maybe Bool     -- ^ True, if the list of winners of the giveaway will be available to everyone
    , country_codes          :: Maybe [T.Text] -- ^ The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought at https://fragment.com can participate in any giveaway and the country code "FT" must not be specified in the list
    , prize_description      :: Maybe T.Text   -- ^ Additional description of the giveaway prize; 0-128 characters
    }
  deriving (Eq, Show)

instance I.ShortShow GiveawayParameters where
  shortShow GiveawayParameters
    { boosted_chat_id        = boosted_chat_id_
    , additional_chat_ids    = additional_chat_ids_
    , winners_selection_date = winners_selection_date_
    , only_new_members       = only_new_members_
    , has_public_winners     = has_public_winners_
    , country_codes          = country_codes_
    , prize_description      = prize_description_
    }
      = "GiveawayParameters"
        ++ I.cc
        [ "boosted_chat_id"        `I.p` boosted_chat_id_
        , "additional_chat_ids"    `I.p` additional_chat_ids_
        , "winners_selection_date" `I.p` winners_selection_date_
        , "only_new_members"       `I.p` only_new_members_
        , "has_public_winners"     `I.p` has_public_winners_
        , "country_codes"          `I.p` country_codes_
        , "prize_description"      `I.p` prize_description_
        ]

instance AT.FromJSON GiveawayParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giveawayParameters" -> parseGiveawayParameters v
      _                    -> mempty
    
    where
      parseGiveawayParameters :: A.Value -> AT.Parser GiveawayParameters
      parseGiveawayParameters = A.withObject "GiveawayParameters" $ \o -> do
        boosted_chat_id_        <- o A..:?  "boosted_chat_id"
        additional_chat_ids_    <- o A..:?  "additional_chat_ids"
        winners_selection_date_ <- o A..:?  "winners_selection_date"
        only_new_members_       <- o A..:?  "only_new_members"
        has_public_winners_     <- o A..:?  "has_public_winners"
        country_codes_          <- o A..:?  "country_codes"
        prize_description_      <- o A..:?  "prize_description"
        pure $ GiveawayParameters
          { boosted_chat_id        = boosted_chat_id_
          , additional_chat_ids    = additional_chat_ids_
          , winners_selection_date = winners_selection_date_
          , only_new_members       = only_new_members_
          , has_public_winners     = has_public_winners_
          , country_codes          = country_codes_
          , prize_description      = prize_description_
          }
  parseJSON _ = mempty

instance AT.ToJSON GiveawayParameters where
  toJSON GiveawayParameters
    { boosted_chat_id        = boosted_chat_id_
    , additional_chat_ids    = additional_chat_ids_
    , winners_selection_date = winners_selection_date_
    , only_new_members       = only_new_members_
    , has_public_winners     = has_public_winners_
    , country_codes          = country_codes_
    , prize_description      = prize_description_
    }
      = A.object
        [ "@type"                  A..= AT.String "giveawayParameters"
        , "boosted_chat_id"        A..= boosted_chat_id_
        , "additional_chat_ids"    A..= additional_chat_ids_
        , "winners_selection_date" A..= winners_selection_date_
        , "only_new_members"       A..= only_new_members_
        , "has_public_winners"     A..= has_public_winners_
        , "country_codes"          A..= country_codes_
        , "prize_description"      A..= prize_description_
        ]

defaultGiveawayParameters :: GiveawayParameters
defaultGiveawayParameters =
  GiveawayParameters
    { boosted_chat_id        = Nothing
    , additional_chat_ids    = Nothing
    , winners_selection_date = Nothing
    , only_new_members       = Nothing
    , has_public_winners     = Nothing
    , country_codes          = Nothing
    , prize_description      = Nothing
    }

