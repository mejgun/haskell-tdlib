module TD.Data.ChatAdministratorRights
  ( ChatAdministratorRights(..)    
  , defaultChatAdministratorRights 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatAdministratorRights
  = ChatAdministratorRights -- ^ Describes rights of the administrator
    { can_manage_chat        :: Maybe Bool -- ^ True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report supergroup spam messages and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
    , can_change_info        :: Maybe Bool -- ^ True, if the administrator can change the chat title, photo, and other settings
    , can_post_messages      :: Maybe Bool -- ^ True, if the administrator can create channel posts or view channel statistics; applicable to channels only
    , can_edit_messages      :: Maybe Bool -- ^ True, if the administrator can edit messages of other users and pin messages; applicable to channels only
    , can_delete_messages    :: Maybe Bool -- ^ True, if the administrator can delete messages of other users
    , can_invite_users       :: Maybe Bool -- ^ True, if the administrator can invite new users to the chat
    , can_restrict_members   :: Maybe Bool -- ^ True, if the administrator can restrict, ban, or unban chat members or view supergroup statistics; always true for channels
    , can_pin_messages       :: Maybe Bool -- ^ True, if the administrator can pin messages; applicable to basic groups and supergroups only
    , can_manage_topics      :: Maybe Bool -- ^ True, if the administrator can create, rename, close, reopen, hide, and unhide forum topics; applicable to forum supergroups only
    , can_promote_members    :: Maybe Bool -- ^ True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
    , can_manage_video_chats :: Maybe Bool -- ^ True, if the administrator can manage video chats
    , can_post_stories       :: Maybe Bool -- ^ True, if the administrator can create new chat stories, or edit and delete posted stories; applicable to supergroups and channels only
    , can_edit_stories       :: Maybe Bool -- ^ True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access story archive; applicable to supergroups and channels only
    , can_delete_stories     :: Maybe Bool -- ^ True, if the administrator can delete stories posted by other users; applicable to supergroups and channels only
    , is_anonymous           :: Maybe Bool -- ^ True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
    }
  deriving (Eq, Show)

instance I.ShortShow ChatAdministratorRights where
  shortShow ChatAdministratorRights
    { can_manage_chat        = can_manage_chat_
    , can_change_info        = can_change_info_
    , can_post_messages      = can_post_messages_
    , can_edit_messages      = can_edit_messages_
    , can_delete_messages    = can_delete_messages_
    , can_invite_users       = can_invite_users_
    , can_restrict_members   = can_restrict_members_
    , can_pin_messages       = can_pin_messages_
    , can_manage_topics      = can_manage_topics_
    , can_promote_members    = can_promote_members_
    , can_manage_video_chats = can_manage_video_chats_
    , can_post_stories       = can_post_stories_
    , can_edit_stories       = can_edit_stories_
    , can_delete_stories     = can_delete_stories_
    , is_anonymous           = is_anonymous_
    }
      = "ChatAdministratorRights"
        ++ I.cc
        [ "can_manage_chat"        `I.p` can_manage_chat_
        , "can_change_info"        `I.p` can_change_info_
        , "can_post_messages"      `I.p` can_post_messages_
        , "can_edit_messages"      `I.p` can_edit_messages_
        , "can_delete_messages"    `I.p` can_delete_messages_
        , "can_invite_users"       `I.p` can_invite_users_
        , "can_restrict_members"   `I.p` can_restrict_members_
        , "can_pin_messages"       `I.p` can_pin_messages_
        , "can_manage_topics"      `I.p` can_manage_topics_
        , "can_promote_members"    `I.p` can_promote_members_
        , "can_manage_video_chats" `I.p` can_manage_video_chats_
        , "can_post_stories"       `I.p` can_post_stories_
        , "can_edit_stories"       `I.p` can_edit_stories_
        , "can_delete_stories"     `I.p` can_delete_stories_
        , "is_anonymous"           `I.p` is_anonymous_
        ]

instance AT.FromJSON ChatAdministratorRights where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAdministratorRights" -> parseChatAdministratorRights v
      _                         -> mempty
    
    where
      parseChatAdministratorRights :: A.Value -> AT.Parser ChatAdministratorRights
      parseChatAdministratorRights = A.withObject "ChatAdministratorRights" $ \o -> do
        can_manage_chat_        <- o A..:?  "can_manage_chat"
        can_change_info_        <- o A..:?  "can_change_info"
        can_post_messages_      <- o A..:?  "can_post_messages"
        can_edit_messages_      <- o A..:?  "can_edit_messages"
        can_delete_messages_    <- o A..:?  "can_delete_messages"
        can_invite_users_       <- o A..:?  "can_invite_users"
        can_restrict_members_   <- o A..:?  "can_restrict_members"
        can_pin_messages_       <- o A..:?  "can_pin_messages"
        can_manage_topics_      <- o A..:?  "can_manage_topics"
        can_promote_members_    <- o A..:?  "can_promote_members"
        can_manage_video_chats_ <- o A..:?  "can_manage_video_chats"
        can_post_stories_       <- o A..:?  "can_post_stories"
        can_edit_stories_       <- o A..:?  "can_edit_stories"
        can_delete_stories_     <- o A..:?  "can_delete_stories"
        is_anonymous_           <- o A..:?  "is_anonymous"
        pure $ ChatAdministratorRights
          { can_manage_chat        = can_manage_chat_
          , can_change_info        = can_change_info_
          , can_post_messages      = can_post_messages_
          , can_edit_messages      = can_edit_messages_
          , can_delete_messages    = can_delete_messages_
          , can_invite_users       = can_invite_users_
          , can_restrict_members   = can_restrict_members_
          , can_pin_messages       = can_pin_messages_
          , can_manage_topics      = can_manage_topics_
          , can_promote_members    = can_promote_members_
          , can_manage_video_chats = can_manage_video_chats_
          , can_post_stories       = can_post_stories_
          , can_edit_stories       = can_edit_stories_
          , can_delete_stories     = can_delete_stories_
          , is_anonymous           = is_anonymous_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatAdministratorRights where
  toJSON ChatAdministratorRights
    { can_manage_chat        = can_manage_chat_
    , can_change_info        = can_change_info_
    , can_post_messages      = can_post_messages_
    , can_edit_messages      = can_edit_messages_
    , can_delete_messages    = can_delete_messages_
    , can_invite_users       = can_invite_users_
    , can_restrict_members   = can_restrict_members_
    , can_pin_messages       = can_pin_messages_
    , can_manage_topics      = can_manage_topics_
    , can_promote_members    = can_promote_members_
    , can_manage_video_chats = can_manage_video_chats_
    , can_post_stories       = can_post_stories_
    , can_edit_stories       = can_edit_stories_
    , can_delete_stories     = can_delete_stories_
    , is_anonymous           = is_anonymous_
    }
      = A.object
        [ "@type"                  A..= AT.String "chatAdministratorRights"
        , "can_manage_chat"        A..= can_manage_chat_
        , "can_change_info"        A..= can_change_info_
        , "can_post_messages"      A..= can_post_messages_
        , "can_edit_messages"      A..= can_edit_messages_
        , "can_delete_messages"    A..= can_delete_messages_
        , "can_invite_users"       A..= can_invite_users_
        , "can_restrict_members"   A..= can_restrict_members_
        , "can_pin_messages"       A..= can_pin_messages_
        , "can_manage_topics"      A..= can_manage_topics_
        , "can_promote_members"    A..= can_promote_members_
        , "can_manage_video_chats" A..= can_manage_video_chats_
        , "can_post_stories"       A..= can_post_stories_
        , "can_edit_stories"       A..= can_edit_stories_
        , "can_delete_stories"     A..= can_delete_stories_
        , "is_anonymous"           A..= is_anonymous_
        ]

defaultChatAdministratorRights :: ChatAdministratorRights
defaultChatAdministratorRights =
  ChatAdministratorRights
    { can_manage_chat        = Nothing
    , can_change_info        = Nothing
    , can_post_messages      = Nothing
    , can_edit_messages      = Nothing
    , can_delete_messages    = Nothing
    , can_invite_users       = Nothing
    , can_restrict_members   = Nothing
    , can_pin_messages       = Nothing
    , can_manage_topics      = Nothing
    , can_promote_members    = Nothing
    , can_manage_video_chats = Nothing
    , can_post_stories       = Nothing
    , can_edit_stories       = Nothing
    , can_delete_stories     = Nothing
    , is_anonymous           = Nothing
    }

