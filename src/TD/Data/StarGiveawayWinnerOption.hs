module TD.Data.StarGiveawayWinnerOption
  (StarGiveawayWinnerOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StarGiveawayWinnerOption
  = StarGiveawayWinnerOption -- ^ Describes an option for the number of winners of a Telegram Star giveaway
    { winner_count   :: Maybe Int  -- ^ The number of users that will be chosen as winners
    , won_star_count :: Maybe Int  -- ^ The number of Telegram Stars that will be won by the winners of the giveaway
    , is_default     :: Maybe Bool -- ^ True, if the option must be chosen by default
    }
  deriving (Eq, Show)

instance I.ShortShow StarGiveawayWinnerOption where
  shortShow StarGiveawayWinnerOption
    { winner_count   = winner_count_
    , won_star_count = won_star_count_
    , is_default     = is_default_
    }
      = "StarGiveawayWinnerOption"
        ++ I.cc
        [ "winner_count"   `I.p` winner_count_
        , "won_star_count" `I.p` won_star_count_
        , "is_default"     `I.p` is_default_
        ]

instance AT.FromJSON StarGiveawayWinnerOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starGiveawayWinnerOption" -> parseStarGiveawayWinnerOption v
      _                          -> mempty
    
    where
      parseStarGiveawayWinnerOption :: A.Value -> AT.Parser StarGiveawayWinnerOption
      parseStarGiveawayWinnerOption = A.withObject "StarGiveawayWinnerOption" $ \o -> do
        winner_count_   <- o A..:?  "winner_count"
        won_star_count_ <- o A..:?  "won_star_count"
        is_default_     <- o A..:?  "is_default"
        pure $ StarGiveawayWinnerOption
          { winner_count   = winner_count_
          , won_star_count = won_star_count_
          , is_default     = is_default_
          }
  parseJSON _ = mempty

