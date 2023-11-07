module TD.Data.PremiumGiveawayInfo
  (PremiumGiveawayInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumGiveawayParticipantStatus as PremiumGiveawayParticipantStatus
import qualified Data.Text as T

-- | Contains information about Telegram Premium giveaway
data PremiumGiveawayInfo
  = PremiumGiveawayInfoOngoing -- ^ Describes an ongoing giveaway
    { creation_date :: Maybe Int                                                               -- ^ Point in time (Unix timestamp) when the giveaway was created
    , status        :: Maybe PremiumGiveawayParticipantStatus.PremiumGiveawayParticipantStatus -- ^ Status of the current user in the giveaway
    , is_ended      :: Maybe Bool                                                              -- ^ True, if the giveaway has ended and results are being prepared
    }
  | PremiumGiveawayInfoCompleted -- ^ Describes a completed giveaway
    { creation_date                 :: Maybe Int    -- ^ Point in time (Unix timestamp) when the giveaway was created
    , actual_winners_selection_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
    , was_refunded                  :: Maybe Bool   -- ^ True, if the giveaway was canceled and was fully refunded
    , winner_count                  :: Maybe Int    -- ^ Number of winners in the giveaway
    , activation_count              :: Maybe Int    -- ^ Number of winners, which activated their gift codes
    , gift_code                     :: Maybe T.Text -- ^ Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiveawayInfo where
  shortShow PremiumGiveawayInfoOngoing
    { creation_date = creation_date_
    , status        = status_
    , is_ended      = is_ended_
    }
      = "PremiumGiveawayInfoOngoing"
        ++ I.cc
        [ "creation_date" `I.p` creation_date_
        , "status"        `I.p` status_
        , "is_ended"      `I.p` is_ended_
        ]
  shortShow PremiumGiveawayInfoCompleted
    { creation_date                 = creation_date_
    , actual_winners_selection_date = actual_winners_selection_date_
    , was_refunded                  = was_refunded_
    , winner_count                  = winner_count_
    , activation_count              = activation_count_
    , gift_code                     = gift_code_
    }
      = "PremiumGiveawayInfoCompleted"
        ++ I.cc
        [ "creation_date"                 `I.p` creation_date_
        , "actual_winners_selection_date" `I.p` actual_winners_selection_date_
        , "was_refunded"                  `I.p` was_refunded_
        , "winner_count"                  `I.p` winner_count_
        , "activation_count"              `I.p` activation_count_
        , "gift_code"                     `I.p` gift_code_
        ]

instance AT.FromJSON PremiumGiveawayInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiveawayInfoOngoing"   -> parsePremiumGiveawayInfoOngoing v
      "premiumGiveawayInfoCompleted" -> parsePremiumGiveawayInfoCompleted v
      _                              -> mempty
    
    where
      parsePremiumGiveawayInfoOngoing :: A.Value -> AT.Parser PremiumGiveawayInfo
      parsePremiumGiveawayInfoOngoing = A.withObject "PremiumGiveawayInfoOngoing" $ \o -> do
        creation_date_ <- o A..:?  "creation_date"
        status_        <- o A..:?  "status"
        is_ended_      <- o A..:?  "is_ended"
        pure $ PremiumGiveawayInfoOngoing
          { creation_date = creation_date_
          , status        = status_
          , is_ended      = is_ended_
          }
      parsePremiumGiveawayInfoCompleted :: A.Value -> AT.Parser PremiumGiveawayInfo
      parsePremiumGiveawayInfoCompleted = A.withObject "PremiumGiveawayInfoCompleted" $ \o -> do
        creation_date_                 <- o A..:?  "creation_date"
        actual_winners_selection_date_ <- o A..:?  "actual_winners_selection_date"
        was_refunded_                  <- o A..:?  "was_refunded"
        winner_count_                  <- o A..:?  "winner_count"
        activation_count_              <- o A..:?  "activation_count"
        gift_code_                     <- o A..:?  "gift_code"
        pure $ PremiumGiveawayInfoCompleted
          { creation_date                 = creation_date_
          , actual_winners_selection_date = actual_winners_selection_date_
          , was_refunded                  = was_refunded_
          , winner_count                  = winner_count_
          , activation_count              = activation_count_
          , gift_code                     = gift_code_
          }
  parseJSON _ = mempty

