module TD.Data.StarSubscriptionType
  (StarSubscriptionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

-- | Describes type of subscription paid in Telegram Stars
data StarSubscriptionType
  = StarSubscriptionTypeChannel -- ^ Describes a subscription to a channel chat
    { can_reuse   :: Maybe Bool   -- ^ True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again
    , invite_link :: Maybe T.Text -- ^ The invite link that can be used to renew the subscription if it has been expired; may be empty, if the link isn't available anymore
    }
  | StarSubscriptionTypeBot -- ^ Describes a subscription in a bot or a business account
    { is_canceled_by_bot :: Maybe Bool        -- ^ True, if the subscription was canceled by the bot and can't be extended
    , title              :: Maybe T.Text      -- ^ Subscription invoice title
    , photo              :: Maybe Photo.Photo -- ^ Subscription invoice photo
    , invoice_link       :: Maybe T.Text      -- ^ The link to the subscription invoice
    }
  deriving (Eq, Show)

instance I.ShortShow StarSubscriptionType where
  shortShow StarSubscriptionTypeChannel
    { can_reuse   = can_reuse_
    , invite_link = invite_link_
    }
      = "StarSubscriptionTypeChannel"
        ++ I.cc
        [ "can_reuse"   `I.p` can_reuse_
        , "invite_link" `I.p` invite_link_
        ]
  shortShow StarSubscriptionTypeBot
    { is_canceled_by_bot = is_canceled_by_bot_
    , title              = title_
    , photo              = photo_
    , invoice_link       = invoice_link_
    }
      = "StarSubscriptionTypeBot"
        ++ I.cc
        [ "is_canceled_by_bot" `I.p` is_canceled_by_bot_
        , "title"              `I.p` title_
        , "photo"              `I.p` photo_
        , "invoice_link"       `I.p` invoice_link_
        ]

instance AT.FromJSON StarSubscriptionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starSubscriptionTypeChannel" -> parseStarSubscriptionTypeChannel v
      "starSubscriptionTypeBot"     -> parseStarSubscriptionTypeBot v
      _                             -> mempty
    
    where
      parseStarSubscriptionTypeChannel :: A.Value -> AT.Parser StarSubscriptionType
      parseStarSubscriptionTypeChannel = A.withObject "StarSubscriptionTypeChannel" $ \o -> do
        can_reuse_   <- o A..:?  "can_reuse"
        invite_link_ <- o A..:?  "invite_link"
        pure $ StarSubscriptionTypeChannel
          { can_reuse   = can_reuse_
          , invite_link = invite_link_
          }
      parseStarSubscriptionTypeBot :: A.Value -> AT.Parser StarSubscriptionType
      parseStarSubscriptionTypeBot = A.withObject "StarSubscriptionTypeBot" $ \o -> do
        is_canceled_by_bot_ <- o A..:?  "is_canceled_by_bot"
        title_              <- o A..:?  "title"
        photo_              <- o A..:?  "photo"
        invoice_link_       <- o A..:?  "invoice_link"
        pure $ StarSubscriptionTypeBot
          { is_canceled_by_bot = is_canceled_by_bot_
          , title              = title_
          , photo              = photo_
          , invoice_link       = invoice_link_
          }
  parseJSON _ = mempty

