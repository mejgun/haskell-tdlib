module TD.Data.StarSubscription
  (StarSubscription(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing

data StarSubscription
  = StarSubscription -- ^ Contains information about subscription to a channel chat paid in Telegram Stars
    { _id             :: Maybe T.Text                                          -- ^ Unique identifier of the subscription
    , chat_id         :: Maybe Int                                             -- ^ Identifier of the channel chat that is subscribed
    , expiration_date :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the subscription will expire or expired
    , can_reuse       :: Maybe Bool                                            -- ^ True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again
    , is_canceled     :: Maybe Bool                                            -- ^ True, if the subscription was canceled
    , is_expiring     :: Maybe Bool                                            -- ^ True, if the subscription expires soon and there are no enough Telegram Stars on the user's balance to extend it
    , invite_link     :: Maybe T.Text                                          -- ^ The invite link that can be used to renew the subscription if it has been expired; may be empty, if the link isn't available anymore
    , pricing         :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ The subscription plan
    }
  deriving (Eq, Show)

instance I.ShortShow StarSubscription where
  shortShow StarSubscription
    { _id             = _id_
    , chat_id         = chat_id_
    , expiration_date = expiration_date_
    , can_reuse       = can_reuse_
    , is_canceled     = is_canceled_
    , is_expiring     = is_expiring_
    , invite_link     = invite_link_
    , pricing         = pricing_
    }
      = "StarSubscription"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "chat_id"         `I.p` chat_id_
        , "expiration_date" `I.p` expiration_date_
        , "can_reuse"       `I.p` can_reuse_
        , "is_canceled"     `I.p` is_canceled_
        , "is_expiring"     `I.p` is_expiring_
        , "invite_link"     `I.p` invite_link_
        , "pricing"         `I.p` pricing_
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
        can_reuse_       <- o A..:?  "can_reuse"
        is_canceled_     <- o A..:?  "is_canceled"
        is_expiring_     <- o A..:?  "is_expiring"
        invite_link_     <- o A..:?  "invite_link"
        pricing_         <- o A..:?  "pricing"
        pure $ StarSubscription
          { _id             = _id_
          , chat_id         = chat_id_
          , expiration_date = expiration_date_
          , can_reuse       = can_reuse_
          , is_canceled     = is_canceled_
          , is_expiring     = is_expiring_
          , invite_link     = invite_link_
          , pricing         = pricing_
          }
  parseJSON _ = mempty

