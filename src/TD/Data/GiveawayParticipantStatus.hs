module TD.Data.GiveawayParticipantStatus
  (GiveawayParticipantStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about status of a user in a giveaway
data GiveawayParticipantStatus
  = GiveawayParticipantStatusEligible -- ^ The user is eligible for the giveaway
  | GiveawayParticipantStatusParticipating -- ^ The user participates in the giveaway
  | GiveawayParticipantStatusAlreadyWasMember -- ^ The user can't participate in the giveaway, because they have already been member of the chat
    { joined_chat_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the user joined the chat
    }
  | GiveawayParticipantStatusAdministrator -- ^ The user can't participate in the giveaway, because they are an administrator in one of the chats that created the giveaway
    { chat_id :: Maybe Int -- ^ Identifier of the chat administered by the user
    }
  | GiveawayParticipantStatusDisallowedCountry -- ^ The user can't participate in the giveaway, because they phone number is from a disallowed country
    { user_country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code of the user's country
    }
  deriving (Eq, Show)

instance I.ShortShow GiveawayParticipantStatus where
  shortShow GiveawayParticipantStatusEligible
      = "GiveawayParticipantStatusEligible"
  shortShow GiveawayParticipantStatusParticipating
      = "GiveawayParticipantStatusParticipating"
  shortShow GiveawayParticipantStatusAlreadyWasMember
    { joined_chat_date = joined_chat_date_
    }
      = "GiveawayParticipantStatusAlreadyWasMember"
        ++ I.cc
        [ "joined_chat_date" `I.p` joined_chat_date_
        ]
  shortShow GiveawayParticipantStatusAdministrator
    { chat_id = chat_id_
    }
      = "GiveawayParticipantStatusAdministrator"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow GiveawayParticipantStatusDisallowedCountry
    { user_country_code = user_country_code_
    }
      = "GiveawayParticipantStatusDisallowedCountry"
        ++ I.cc
        [ "user_country_code" `I.p` user_country_code_
        ]

instance AT.FromJSON GiveawayParticipantStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giveawayParticipantStatusEligible"          -> pure GiveawayParticipantStatusEligible
      "giveawayParticipantStatusParticipating"     -> pure GiveawayParticipantStatusParticipating
      "giveawayParticipantStatusAlreadyWasMember"  -> parseGiveawayParticipantStatusAlreadyWasMember v
      "giveawayParticipantStatusAdministrator"     -> parseGiveawayParticipantStatusAdministrator v
      "giveawayParticipantStatusDisallowedCountry" -> parseGiveawayParticipantStatusDisallowedCountry v
      _                                            -> mempty
    
    where
      parseGiveawayParticipantStatusAlreadyWasMember :: A.Value -> AT.Parser GiveawayParticipantStatus
      parseGiveawayParticipantStatusAlreadyWasMember = A.withObject "GiveawayParticipantStatusAlreadyWasMember" $ \o -> do
        joined_chat_date_ <- o A..:?  "joined_chat_date"
        pure $ GiveawayParticipantStatusAlreadyWasMember
          { joined_chat_date = joined_chat_date_
          }
      parseGiveawayParticipantStatusAdministrator :: A.Value -> AT.Parser GiveawayParticipantStatus
      parseGiveawayParticipantStatusAdministrator = A.withObject "GiveawayParticipantStatusAdministrator" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ GiveawayParticipantStatusAdministrator
          { chat_id = chat_id_
          }
      parseGiveawayParticipantStatusDisallowedCountry :: A.Value -> AT.Parser GiveawayParticipantStatus
      parseGiveawayParticipantStatusDisallowedCountry = A.withObject "GiveawayParticipantStatusDisallowedCountry" $ \o -> do
        user_country_code_ <- o A..:?  "user_country_code"
        pure $ GiveawayParticipantStatusDisallowedCountry
          { user_country_code = user_country_code_
          }
  parseJSON _ = mempty

