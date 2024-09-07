module TD.Data.PrepaidGiveaway
  (PrepaidGiveaway(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiveawayPrize as GiveawayPrize

data PrepaidGiveaway
  = PrepaidGiveaway -- ^ Describes a prepaid giveaway
    { _id          :: Maybe Int                         -- ^ Unique identifier of the prepaid giveaway
    , winner_count :: Maybe Int                         -- ^ Number of users which will receive giveaway prize
    , prize        :: Maybe GiveawayPrize.GiveawayPrize -- ^ Prize of the giveaway
    , boost_count  :: Maybe Int                         -- ^ The number of boosts received by the chat from the giveaway; for Telegram Star giveaways only
    , payment_date :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the giveaway was paid
    }
  deriving (Eq, Show)

instance I.ShortShow PrepaidGiveaway where
  shortShow PrepaidGiveaway
    { _id          = _id_
    , winner_count = winner_count_
    , prize        = prize_
    , boost_count  = boost_count_
    , payment_date = payment_date_
    }
      = "PrepaidGiveaway"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "winner_count" `I.p` winner_count_
        , "prize"        `I.p` prize_
        , "boost_count"  `I.p` boost_count_
        , "payment_date" `I.p` payment_date_
        ]

instance AT.FromJSON PrepaidGiveaway where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "prepaidGiveaway" -> parsePrepaidGiveaway v
      _                 -> mempty
    
    where
      parsePrepaidGiveaway :: A.Value -> AT.Parser PrepaidGiveaway
      parsePrepaidGiveaway = A.withObject "PrepaidGiveaway" $ \o -> do
        _id_          <- fmap I.readInt64 <$> o A..:?  "id"
        winner_count_ <- o A..:?                       "winner_count"
        prize_        <- o A..:?                       "prize"
        boost_count_  <- o A..:?                       "boost_count"
        payment_date_ <- o A..:?                       "payment_date"
        pure $ PrepaidGiveaway
          { _id          = _id_
          , winner_count = winner_count_
          , prize        = prize_
          , boost_count  = boost_count_
          , payment_date = payment_date_
          }
  parseJSON _ = mempty

