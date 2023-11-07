module TD.Data.PremiumGiveawayParticipantStatus
  (PremiumGiveawayParticipantStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about status of a user in a Telegram Premium giveaway
data PremiumGiveawayParticipantStatus
  = PremiumGiveawayParticipantStatusEligible -- ^ The user is eligible for the giveaway
  | PremiumGiveawayParticipantStatusParticipating -- ^ The user participates in the giveaway
  | PremiumGiveawayParticipantStatusAlreadyWasMember -- ^ The user can't participate in the giveaway, because they have already been member of the chat
    { joined_chat_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the user joined the chat
    }
  | PremiumGiveawayParticipantStatusAdministrator -- ^ The user can't participate in the giveaway, because they are an administrator in one of the chats that created the giveaway
    { chat_id :: Maybe Int -- ^ Identifier of the chat administered by the user
    }
  | PremiumGiveawayParticipantStatusDisallowedCountry -- ^ The user can't participate in the giveaway, because they phone number is from a disallowed country
    { user_country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code of the user's country
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiveawayParticipantStatus where
  shortShow PremiumGiveawayParticipantStatusEligible
      = "PremiumGiveawayParticipantStatusEligible"
  shortShow PremiumGiveawayParticipantStatusParticipating
      = "PremiumGiveawayParticipantStatusParticipating"
  shortShow PremiumGiveawayParticipantStatusAlreadyWasMember
    { joined_chat_date = joined_chat_date_
    }
      = "PremiumGiveawayParticipantStatusAlreadyWasMember"
        ++ I.cc
        [ "joined_chat_date" `I.p` joined_chat_date_
        ]
  shortShow PremiumGiveawayParticipantStatusAdministrator
    { chat_id = chat_id_
    }
      = "PremiumGiveawayParticipantStatusAdministrator"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow PremiumGiveawayParticipantStatusDisallowedCountry
    { user_country_code = user_country_code_
    }
      = "PremiumGiveawayParticipantStatusDisallowedCountry"
        ++ I.cc
        [ "user_country_code" `I.p` user_country_code_
        ]

instance AT.FromJSON PremiumGiveawayParticipantStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiveawayParticipantStatusEligible"          -> pure PremiumGiveawayParticipantStatusEligible
      "premiumGiveawayParticipantStatusParticipating"     -> pure PremiumGiveawayParticipantStatusParticipating
      "premiumGiveawayParticipantStatusAlreadyWasMember"  -> parsePremiumGiveawayParticipantStatusAlreadyWasMember v
      "premiumGiveawayParticipantStatusAdministrator"     -> parsePremiumGiveawayParticipantStatusAdministrator v
      "premiumGiveawayParticipantStatusDisallowedCountry" -> parsePremiumGiveawayParticipantStatusDisallowedCountry v
      _                                                   -> mempty
    
    where
      parsePremiumGiveawayParticipantStatusAlreadyWasMember :: A.Value -> AT.Parser PremiumGiveawayParticipantStatus
      parsePremiumGiveawayParticipantStatusAlreadyWasMember = A.withObject "PremiumGiveawayParticipantStatusAlreadyWasMember" $ \o -> do
        joined_chat_date_ <- o A..:?  "joined_chat_date"
        pure $ PremiumGiveawayParticipantStatusAlreadyWasMember
          { joined_chat_date = joined_chat_date_
          }
      parsePremiumGiveawayParticipantStatusAdministrator :: A.Value -> AT.Parser PremiumGiveawayParticipantStatus
      parsePremiumGiveawayParticipantStatusAdministrator = A.withObject "PremiumGiveawayParticipantStatusAdministrator" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ PremiumGiveawayParticipantStatusAdministrator
          { chat_id = chat_id_
          }
      parsePremiumGiveawayParticipantStatusDisallowedCountry :: A.Value -> AT.Parser PremiumGiveawayParticipantStatus
      parsePremiumGiveawayParticipantStatusDisallowedCountry = A.withObject "PremiumGiveawayParticipantStatusDisallowedCountry" $ \o -> do
        user_country_code_ <- o A..:?  "user_country_code"
        pure $ PremiumGiveawayParticipantStatusDisallowedCountry
          { user_country_code = user_country_code_
          }
  parseJSON _ = mempty

