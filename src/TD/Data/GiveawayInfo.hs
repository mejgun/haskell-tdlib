module TD.Data.GiveawayInfo
  (GiveawayInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiveawayParticipantStatus as GiveawayParticipantStatus
import qualified Data.Text as T

-- | Contains information about a giveaway
data GiveawayInfo
  = GiveawayInfoOngoing -- ^ Describes an ongoing giveaway
    { creation_date :: Maybe Int                                                 -- ^ Point in time (Unix timestamp) when the giveaway was created
    , status        :: Maybe GiveawayParticipantStatus.GiveawayParticipantStatus -- ^ Status of the current user in the giveaway
    , is_ended      :: Maybe Bool                                                -- ^ True, if the giveaway has ended and results are being prepared
    }
  | GiveawayInfoCompleted -- ^ Describes a completed giveaway
    { creation_date                 :: Maybe Int    -- ^ Point in time (Unix timestamp) when the giveaway was created
    , actual_winners_selection_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
    , was_refunded                  :: Maybe Bool   -- ^ True, if the giveaway was canceled and was fully refunded
    , is_winner                     :: Maybe Bool   -- ^ True, if the current user is a winner of the giveaway
    , winner_count                  :: Maybe Int    -- ^ Number of winners in the giveaway
    , activation_count              :: Maybe Int    -- ^ Number of winners, which activated their gift codes; for Telegram Premium giveaways only
    , gift_code                     :: Maybe T.Text -- ^ Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Premium giveaway
    , won_star_count                :: Maybe Int    -- ^ The amount of Telegram Stars won by the current user; 0 if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Star giveaway
    }
  deriving (Eq, Show)

instance I.ShortShow GiveawayInfo where
  shortShow GiveawayInfoOngoing
    { creation_date = creation_date_
    , status        = status_
    , is_ended      = is_ended_
    }
      = "GiveawayInfoOngoing"
        ++ I.cc
        [ "creation_date" `I.p` creation_date_
        , "status"        `I.p` status_
        , "is_ended"      `I.p` is_ended_
        ]
  shortShow GiveawayInfoCompleted
    { creation_date                 = creation_date_
    , actual_winners_selection_date = actual_winners_selection_date_
    , was_refunded                  = was_refunded_
    , is_winner                     = is_winner_
    , winner_count                  = winner_count_
    , activation_count              = activation_count_
    , gift_code                     = gift_code_
    , won_star_count                = won_star_count_
    }
      = "GiveawayInfoCompleted"
        ++ I.cc
        [ "creation_date"                 `I.p` creation_date_
        , "actual_winners_selection_date" `I.p` actual_winners_selection_date_
        , "was_refunded"                  `I.p` was_refunded_
        , "is_winner"                     `I.p` is_winner_
        , "winner_count"                  `I.p` winner_count_
        , "activation_count"              `I.p` activation_count_
        , "gift_code"                     `I.p` gift_code_
        , "won_star_count"                `I.p` won_star_count_
        ]

instance AT.FromJSON GiveawayInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giveawayInfoOngoing"   -> parseGiveawayInfoOngoing v
      "giveawayInfoCompleted" -> parseGiveawayInfoCompleted v
      _                       -> mempty
    
    where
      parseGiveawayInfoOngoing :: A.Value -> AT.Parser GiveawayInfo
      parseGiveawayInfoOngoing = A.withObject "GiveawayInfoOngoing" $ \o -> do
        creation_date_ <- o A..:?  "creation_date"
        status_        <- o A..:?  "status"
        is_ended_      <- o A..:?  "is_ended"
        pure $ GiveawayInfoOngoing
          { creation_date = creation_date_
          , status        = status_
          , is_ended      = is_ended_
          }
      parseGiveawayInfoCompleted :: A.Value -> AT.Parser GiveawayInfo
      parseGiveawayInfoCompleted = A.withObject "GiveawayInfoCompleted" $ \o -> do
        creation_date_                 <- o A..:?  "creation_date"
        actual_winners_selection_date_ <- o A..:?  "actual_winners_selection_date"
        was_refunded_                  <- o A..:?  "was_refunded"
        is_winner_                     <- o A..:?  "is_winner"
        winner_count_                  <- o A..:?  "winner_count"
        activation_count_              <- o A..:?  "activation_count"
        gift_code_                     <- o A..:?  "gift_code"
        won_star_count_                <- o A..:?  "won_star_count"
        pure $ GiveawayInfoCompleted
          { creation_date                 = creation_date_
          , actual_winners_selection_date = actual_winners_selection_date_
          , was_refunded                  = was_refunded_
          , is_winner                     = is_winner_
          , winner_count                  = winner_count_
          , activation_count              = activation_count_
          , gift_code                     = gift_code_
          , won_star_count                = won_star_count_
          }
  parseJSON _ = mempty

