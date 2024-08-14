module TD.Query.CreateChatSubscriptionInviteLink
  (CreateChatSubscriptionInviteLink(..)
  , defaultCreateChatSubscriptionInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing

-- | Creates a new subscription invite link for a channel chat. Requires can_invite_users right in the chat. Returns 'TD.Data.ChatInviteLink.ChatInviteLink'
data CreateChatSubscriptionInviteLink
  = CreateChatSubscriptionInviteLink
    { chat_id              :: Maybe Int                                             -- ^ Chat identifier
    , name                 :: Maybe T.Text                                          -- ^ Invite link name; 0-32 characters
    , subscription_pricing :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ Information about subscription plan that will be applied to the users joining the chat via the link. Subscription period must be 2592000 in production environment, and 60 or 300 if Telegram test environment is used
    }
  deriving (Eq, Show)

instance I.ShortShow CreateChatSubscriptionInviteLink where
  shortShow
    CreateChatSubscriptionInviteLink
      { chat_id              = chat_id_
      , name                 = name_
      , subscription_pricing = subscription_pricing_
      }
        = "CreateChatSubscriptionInviteLink"
          ++ I.cc
          [ "chat_id"              `I.p` chat_id_
          , "name"                 `I.p` name_
          , "subscription_pricing" `I.p` subscription_pricing_
          ]

instance AT.ToJSON CreateChatSubscriptionInviteLink where
  toJSON
    CreateChatSubscriptionInviteLink
      { chat_id              = chat_id_
      , name                 = name_
      , subscription_pricing = subscription_pricing_
      }
        = A.object
          [ "@type"                A..= AT.String "createChatSubscriptionInviteLink"
          , "chat_id"              A..= chat_id_
          , "name"                 A..= name_
          , "subscription_pricing" A..= subscription_pricing_
          ]

defaultCreateChatSubscriptionInviteLink :: CreateChatSubscriptionInviteLink
defaultCreateChatSubscriptionInviteLink =
  CreateChatSubscriptionInviteLink
    { chat_id              = Nothing
    , name                 = Nothing
    , subscription_pricing = Nothing
    }

