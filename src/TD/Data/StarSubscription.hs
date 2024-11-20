module TD.Data.StarSubscription
  (StarSubscription(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing
import qualified TD.Data.StarSubscriptionType as StarSubscriptionType

data StarSubscription
  = StarSubscription -- ^ Contains information about subscription to a channel chat, a bot, or a business account that was paid in Telegram Stars
    { _id             :: Maybe T.Text                                          -- ^ Unique identifier of the subscription
    , chat_id         :: Maybe Int                                             -- ^ Identifier of the chat that is subscribed
    , expiration_date :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the subscription will expire or expired
    , is_canceled     :: Maybe Bool                                            -- ^ True, if the subscription was canceled
    , is_expiring     :: Maybe Bool                                            -- ^ True, if the subscription expires soon and there are no enough Telegram Stars on the user's balance to extend it
    , pricing         :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ The subscription plan
    , _type           :: Maybe StarSubscriptionType.StarSubscriptionType       -- ^ Type of the subscription
    }
  deriving (Eq, Show)

instance I.ShortShow StarSubscription where
  shortShow StarSubscription
    { _id             = _id_
    , chat_id         = chat_id_
    , expiration_date = expiration_date_
    , is_canceled     = is_canceled_
    , is_expiring     = is_expiring_
    , pricing         = pricing_
    , _type           = _type_
    }
      = "StarSubscription"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "chat_id"         `I.p` chat_id_
        , "expiration_date" `I.p` expiration_date_
        , "is_canceled"     `I.p` is_canceled_
        , "is_expiring"     `I.p` is_expiring_
        , "pricing"         `I.p` pricing_
        , "_type"           `I.p` _type_
        ]

instance AT.FromJSON StarSubscription where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starSubscription" -> parseStarSubscription v
      _                  -> mempty
    
    where
      parseStarSubscription :: A.Value -> AT.Parser StarSubscription
      parseStarSubscription = A.withObject "StarSubscription" $ \o -> do
        _id_             <- o A..:?  "id"
        chat_id_         <- o A..:?  "chat_id"
        expiration_date_ <- o A..:?  "expiration_date"
        is_canceled_     <- o A..:?  "is_canceled"
        is_expiring_     <- o A..:?  "is_expiring"
        pricing_         <- o A..:?  "pricing"
        _type_           <- o A..:?  "type"
        pure $ StarSubscription
          { _id             = _id_
          , chat_id         = chat_id_
          , expiration_date = expiration_date_
          , is_canceled     = is_canceled_
          , is_expiring     = is_expiring_
          , pricing         = pricing_
          , _type           = _type_
          }
  parseJSON _ = mempty

