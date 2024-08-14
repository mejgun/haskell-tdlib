module TD.Query.GetChatInviteLinkMembers
  (GetChatInviteLinkMembers(..)
  , defaultGetChatInviteLinkMembers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember

-- | Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links. Returns 'TD.Data.ChatInviteLinkMembers.ChatInviteLinkMembers'
data GetChatInviteLinkMembers
  = GetChatInviteLinkMembers
    { chat_id                        :: Maybe Int                                       -- ^ Chat identifier
    , invite_link                    :: Maybe T.Text                                    -- ^ Invite link for which to return chat members
    , only_with_expired_subscription :: Maybe Bool                                      -- ^ Pass true if the link is a subscription link and only members with expired subscription must be returned
    , offset_member                  :: Maybe ChatInviteLinkMember.ChatInviteLinkMember -- ^ A chat member from which to return next chat members; pass null to get results from the beginning
    , limit                          :: Maybe Int                                       -- ^ The maximum number of chat members to return; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatInviteLinkMembers where
  shortShow
    GetChatInviteLinkMembers
      { chat_id                        = chat_id_
      , invite_link                    = invite_link_
      , only_with_expired_subscription = only_with_expired_subscription_
      , offset_member                  = offset_member_
      , limit                          = limit_
      }
        = "GetChatInviteLinkMembers"
          ++ I.cc
          [ "chat_id"                        `I.p` chat_id_
          , "invite_link"                    `I.p` invite_link_
          , "only_with_expired_subscription" `I.p` only_with_expired_subscription_
          , "offset_member"                  `I.p` offset_member_
          , "limit"                          `I.p` limit_
          ]

instance AT.ToJSON GetChatInviteLinkMembers where
  toJSON
    GetChatInviteLinkMembers
      { chat_id                        = chat_id_
      , invite_link                    = invite_link_
      , only_with_expired_subscription = only_with_expired_subscription_
      , offset_member                  = offset_member_
      , limit                          = limit_
      }
        = A.object
          [ "@type"                          A..= AT.String "getChatInviteLinkMembers"
          , "chat_id"                        A..= chat_id_
          , "invite_link"                    A..= invite_link_
          , "only_with_expired_subscription" A..= only_with_expired_subscription_
          , "offset_member"                  A..= offset_member_
          , "limit"                          A..= limit_
          ]

defaultGetChatInviteLinkMembers :: GetChatInviteLinkMembers
defaultGetChatInviteLinkMembers =
  GetChatInviteLinkMembers
    { chat_id                        = Nothing
    , invite_link                    = Nothing
    , only_with_expired_subscription = Nothing
    , offset_member                  = Nothing
    , limit                          = Nothing
    }

