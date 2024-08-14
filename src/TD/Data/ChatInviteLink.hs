module TD.Data.ChatInviteLink
  (ChatInviteLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing

data ChatInviteLink
  = ChatInviteLink -- ^ Contains a chat invite link
    { invite_link                :: Maybe T.Text                                          -- ^ Chat invite link
    , name                       :: Maybe T.Text                                          -- ^ Name of the link
    , creator_user_id            :: Maybe Int                                             -- ^ User identifier of an administrator created the link
    , date                       :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the link was created
    , edit_date                  :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
    , expiration_date            :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the link will expire; 0 if never
    , subscription_pricing       :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ Information about subscription plan that is applied to the users joining the chat by the link; may be null if the link doesn't require subscription
    , member_limit               :: Maybe Int                                             -- ^ The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
    , member_count               :: Maybe Int                                             -- ^ Number of chat members, which joined the chat using the link
    , expired_member_count       :: Maybe Int                                             -- ^ Number of chat members, which joined the chat using the link, but have already left because of expired subscription; for subscription links only
    , pending_join_request_count :: Maybe Int                                             -- ^ Number of pending join requests created using this link
    , creates_join_request       :: Maybe Bool                                            -- ^ True, if the link only creates join request. If true, total number of joining members will be unlimited
    , is_primary                 :: Maybe Bool                                            -- ^ True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
    , is_revoked                 :: Maybe Bool                                            -- ^ True, if the link was revoked
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLink where
  shortShow ChatInviteLink
    { invite_link                = invite_link_
    , name                       = name_
    , creator_user_id            = creator_user_id_
    , date                       = date_
    , edit_date                  = edit_date_
    , expiration_date            = expiration_date_
    , subscription_pricing       = subscription_pricing_
    , member_limit               = member_limit_
    , member_count               = member_count_
    , expired_member_count       = expired_member_count_
    , pending_join_request_count = pending_join_request_count_
    , creates_join_request       = creates_join_request_
    , is_primary                 = is_primary_
    , is_revoked                 = is_revoked_
    }
      = "ChatInviteLink"
        ++ I.cc
        [ "invite_link"                `I.p` invite_link_
        , "name"                       `I.p` name_
        , "creator_user_id"            `I.p` creator_user_id_
        , "date"                       `I.p` date_
        , "edit_date"                  `I.p` edit_date_
        , "expiration_date"            `I.p` expiration_date_
        , "subscription_pricing"       `I.p` subscription_pricing_
        , "member_limit"               `I.p` member_limit_
        , "member_count"               `I.p` member_count_
        , "expired_member_count"       `I.p` expired_member_count_
        , "pending_join_request_count" `I.p` pending_join_request_count_
        , "creates_join_request"       `I.p` creates_join_request_
        , "is_primary"                 `I.p` is_primary_
        , "is_revoked"                 `I.p` is_revoked_
        ]

instance AT.FromJSON ChatInviteLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLink" -> parseChatInviteLink v
      _                -> mempty
    
    where
      parseChatInviteLink :: A.Value -> AT.Parser ChatInviteLink
      parseChatInviteLink = A.withObject "ChatInviteLink" $ \o -> do
        invite_link_                <- o A..:?  "invite_link"
        name_                       <- o A..:?  "name"
        creator_user_id_            <- o A..:?  "creator_user_id"
        date_                       <- o A..:?  "date"
        edit_date_                  <- o A..:?  "edit_date"
        expiration_date_            <- o A..:?  "expiration_date"
        subscription_pricing_       <- o A..:?  "subscription_pricing"
        member_limit_               <- o A..:?  "member_limit"
        member_count_               <- o A..:?  "member_count"
        expired_member_count_       <- o A..:?  "expired_member_count"
        pending_join_request_count_ <- o A..:?  "pending_join_request_count"
        creates_join_request_       <- o A..:?  "creates_join_request"
        is_primary_                 <- o A..:?  "is_primary"
        is_revoked_                 <- o A..:?  "is_revoked"
        pure $ ChatInviteLink
          { invite_link                = invite_link_
          , name                       = name_
          , creator_user_id            = creator_user_id_
          , date                       = date_
          , edit_date                  = edit_date_
          , expiration_date            = expiration_date_
          , subscription_pricing       = subscription_pricing_
          , member_limit               = member_limit_
          , member_count               = member_count_
          , expired_member_count       = expired_member_count_
          , pending_join_request_count = pending_join_request_count_
          , creates_join_request       = creates_join_request_
          , is_primary                 = is_primary_
          , is_revoked                 = is_revoked_
          }
  parseJSON _ = mempty

