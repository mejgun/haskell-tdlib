module TD.Data.ChatInviteLinkSubscriptionInfo
  (ChatInviteLinkSubscriptionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing

data ChatInviteLinkSubscriptionInfo
  = ChatInviteLinkSubscriptionInfo -- ^ Contains information about subscription plan that must be paid by the user to use a chat invite link
    { pricing   :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ Information about subscription plan that must be paid by the user to use the link
    , can_reuse :: Maybe Bool                                            -- ^ True, if the user has already paid for the subscription and can use joinChatByInviteLink to join the subscribed chat again
    , form_id   :: Maybe Int                                             -- ^ Identifier of the payment form to use for subscription payment; 0 if the subscription can't be paid
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLinkSubscriptionInfo where
  shortShow ChatInviteLinkSubscriptionInfo
    { pricing   = pricing_
    , can_reuse = can_reuse_
    , form_id   = form_id_
    }
      = "ChatInviteLinkSubscriptionInfo"
        ++ I.cc
        [ "pricing"   `I.p` pricing_
        , "can_reuse" `I.p` can_reuse_
        , "form_id"   `I.p` form_id_
        ]

instance AT.FromJSON ChatInviteLinkSubscriptionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkSubscriptionInfo" -> parseChatInviteLinkSubscriptionInfo v
      _                                -> mempty
    
    where
      parseChatInviteLinkSubscriptionInfo :: A.Value -> AT.Parser ChatInviteLinkSubscriptionInfo
      parseChatInviteLinkSubscriptionInfo = A.withObject "ChatInviteLinkSubscriptionInfo" $ \o -> do
        pricing_   <- o A..:?                       "pricing"
        can_reuse_ <- o A..:?                       "can_reuse"
        form_id_   <- fmap I.readInt64 <$> o A..:?  "form_id"
        pure $ ChatInviteLinkSubscriptionInfo
          { pricing   = pricing_
          , can_reuse = can_reuse_
          , form_id   = form_id_
          }
  parseJSON _ = mempty

