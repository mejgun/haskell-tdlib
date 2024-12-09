module TD.Data.StarSubscriptions
  (StarSubscriptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarAmount as StarAmount
import qualified TD.Data.StarSubscription as StarSubscription
import qualified Data.Text as T

data StarSubscriptions
  = StarSubscriptions -- ^ Represents a list of Telegram Star subscriptions
    { star_amount         :: Maybe StarAmount.StarAmount               -- ^ The amount of owned Telegram Stars
    , subscriptions       :: Maybe [StarSubscription.StarSubscription] -- ^ List of subscriptions for Telegram Stars
    , required_star_count :: Maybe Int                                 -- ^ The number of Telegram Stars required to buy to extend subscriptions expiring soon
    , next_offset         :: Maybe T.Text                              -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StarSubscriptions where
  shortShow StarSubscriptions
    { star_amount         = star_amount_
    , subscriptions       = subscriptions_
    , required_star_count = required_star_count_
    , next_offset         = next_offset_
    }
      = "StarSubscriptions"
        ++ I.cc
        [ "star_amount"         `I.p` star_amount_
        , "subscriptions"       `I.p` subscriptions_
        , "required_star_count" `I.p` required_star_count_
        , "next_offset"         `I.p` next_offset_
        ]

instance AT.FromJSON StarSubscriptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starSubscriptions" -> parseStarSubscriptions v
      _                   -> mempty
    
    where
      parseStarSubscriptions :: A.Value -> AT.Parser StarSubscriptions
      parseStarSubscriptions = A.withObject "StarSubscriptions" $ \o -> do
        star_amount_         <- o A..:?  "star_amount"
        subscriptions_       <- o A..:?  "subscriptions"
        required_star_count_ <- o A..:?  "required_star_count"
        next_offset_         <- o A..:?  "next_offset"
        pure $ StarSubscriptions
          { star_amount         = star_amount_
          , subscriptions       = subscriptions_
          , required_star_count = required_star_count_
          , next_offset         = next_offset_
          }
  parseJSON _ = mempty

