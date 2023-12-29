module TD.Data.PrepaidPremiumGiveaway
  (PrepaidPremiumGiveaway(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data PrepaidPremiumGiveaway
  = PrepaidPremiumGiveaway -- ^ Describes a prepaid Telegram Premium giveaway
    { _id          :: Maybe Int -- ^ Unique identifier of the prepaid giveaway
    , winner_count :: Maybe Int -- ^ Number of users which will receive Telegram Premium subscription gift codes
    , month_count  :: Maybe Int -- ^ Number of months the Telegram Premium subscription will be active after code activation
    , payment_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the giveaway was paid
    }
  deriving (Eq, Show)

instance I.ShortShow PrepaidPremiumGiveaway where
  shortShow PrepaidPremiumGiveaway
    { _id          = _id_
    , winner_count = winner_count_
    , month_count  = month_count_
    , payment_date = payment_date_
    }
      = "PrepaidPremiumGiveaway"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "winner_count" `I.p` winner_count_
        , "month_count"  `I.p` month_count_
        , "payment_date" `I.p` payment_date_
        ]

instance AT.FromJSON PrepaidPremiumGiveaway where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "prepaidPremiumGiveaway" -> parsePrepaidPremiumGiveaway v
      _                        -> mempty
    
    where
      parsePrepaidPremiumGiveaway :: A.Value -> AT.Parser PrepaidPremiumGiveaway
      parsePrepaidPremiumGiveaway = A.withObject "PrepaidPremiumGiveaway" $ \o -> do
        _id_          <- fmap I.readInt64 <$> o A..:?  "id"
        winner_count_ <- o A..:?                       "winner_count"
        month_count_  <- o A..:?                       "month_count"
        payment_date_ <- o A..:?                       "payment_date"
        pure $ PrepaidPremiumGiveaway
          { _id          = _id_
          , winner_count = winner_count_
          , month_count  = month_count_
          , payment_date = payment_date_
          }
  parseJSON _ = mempty

