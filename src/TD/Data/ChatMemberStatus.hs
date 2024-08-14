module TD.Data.ChatMemberStatus
  (ChatMemberStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.ChatPermissions as ChatPermissions

-- | Provides information about the status of a member in a chat
data ChatMemberStatus
  = ChatMemberStatusCreator -- ^ The user is the owner of the chat and has all the administrator privileges
    { custom_title :: Maybe T.Text -- ^ A custom title of the owner; 0-16 characters without emoji; applicable to supergroups only
    , is_anonymous :: Maybe Bool   -- ^ True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
    , is_member    :: Maybe Bool   -- ^ True, if the user is a member of the chat
    }
  | ChatMemberStatusAdministrator -- ^ The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage video chats. In supergroups and channels, there are more detailed options for administrator privileges
    { custom_title  :: Maybe T.Text                                          -- ^ A custom title of the administrator; 0-16 characters without emoji; applicable to supergroups only
    , can_be_edited :: Maybe Bool                                            -- ^ True, if the current user can edit the administrator privileges for the called user
    , rights        :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Rights of the administrator
    }
  | ChatMemberStatusMember -- ^ The user is a member of the chat, without any additional privileges or restrictions
    { member_until_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the user will be removed from the chat because of the expired subscription; 0 if never. Ignored in setChatMemberStatus
    }
  | ChatMemberStatusRestricted -- ^ The user is under certain restrictions in the chat. Not supported in basic groups and channels
    { is_member             :: Maybe Bool                            -- ^ True, if the user is a member of the chat
    , restricted_until_date :: Maybe Int                             -- ^ Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
    , permissions           :: Maybe ChatPermissions.ChatPermissions -- ^ User permissions in the chat
    }
  | ChatMemberStatusLeft -- ^ The user or the chat is not a chat member
  | ChatMemberStatusBanned -- ^ The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat
    { banned_until_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
    }
  deriving (Eq, Show)

instance I.ShortShow ChatMemberStatus where
  shortShow ChatMemberStatusCreator
    { custom_title = custom_title_
    , is_anonymous = is_anonymous_
    , is_member    = is_member_
    }
      = "ChatMemberStatusCreator"
        ++ I.cc
        [ "custom_title" `I.p` custom_title_
        , "is_anonymous" `I.p` is_anonymous_
        , "is_member"    `I.p` is_member_
        ]
  shortShow ChatMemberStatusAdministrator
    { custom_title  = custom_title_
    , can_be_edited = can_be_edited_
    , rights        = rights_
    }
      = "ChatMemberStatusAdministrator"
        ++ I.cc
        [ "custom_title"  `I.p` custom_title_
        , "can_be_edited" `I.p` can_be_edited_
        , "rights"        `I.p` rights_
        ]
  shortShow ChatMemberStatusMember
    { member_until_date = member_until_date_
    }
      = "ChatMemberStatusMember"
        ++ I.cc
        [ "member_until_date" `I.p` member_until_date_
        ]
  shortShow ChatMemberStatusRestricted
    { is_member             = is_member_
    , restricted_until_date = restricted_until_date_
    , permissions           = permissions_
    }
      = "ChatMemberStatusRestricted"
        ++ I.cc
        [ "is_member"             `I.p` is_member_
        , "restricted_until_date" `I.p` restricted_until_date_
        , "permissions"           `I.p` permissions_
        ]
  shortShow ChatMemberStatusLeft
      = "ChatMemberStatusLeft"
  shortShow ChatMemberStatusBanned
    { banned_until_date = banned_until_date_
    }
      = "ChatMemberStatusBanned"
        ++ I.cc
        [ "banned_until_date" `I.p` banned_until_date_
        ]

instance AT.FromJSON ChatMemberStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMemberStatusCreator"       -> parseChatMemberStatusCreator v
      "chatMemberStatusAdministrator" -> parseChatMemberStatusAdministrator v
      "chatMemberStatusMember"        -> parseChatMemberStatusMember v
      "chatMemberStatusRestricted"    -> parseChatMemberStatusRestricted v
      "chatMemberStatusLeft"          -> pure ChatMemberStatusLeft
      "chatMemberStatusBanned"        -> parseChatMemberStatusBanned v
      _                               -> mempty
    
    where
      parseChatMemberStatusCreator :: A.Value -> AT.Parser ChatMemberStatus
      parseChatMemberStatusCreator = A.withObject "ChatMemberStatusCreator" $ \o -> do
        custom_title_ <- o A..:?  "custom_title"
        is_anonymous_ <- o A..:?  "is_anonymous"
        is_member_    <- o A..:?  "is_member"
        pure $ ChatMemberStatusCreator
          { custom_title = custom_title_
          , is_anonymous = is_anonymous_
          , is_member    = is_member_
          }
      parseChatMemberStatusAdministrator :: A.Value -> AT.Parser ChatMemberStatus
      parseChatMemberStatusAdministrator = A.withObject "ChatMemberStatusAdministrator" $ \o -> do
        custom_title_  <- o A..:?  "custom_title"
        can_be_edited_ <- o A..:?  "can_be_edited"
        rights_        <- o A..:?  "rights"
        pure $ ChatMemberStatusAdministrator
          { custom_title  = custom_title_
          , can_be_edited = can_be_edited_
          , rights        = rights_
          }
      parseChatMemberStatusMember :: A.Value -> AT.Parser ChatMemberStatus
      parseChatMemberStatusMember = A.withObject "ChatMemberStatusMember" $ \o -> do
        member_until_date_ <- o A..:?  "member_until_date"
        pure $ ChatMemberStatusMember
          { member_until_date = member_until_date_
          }
      parseChatMemberStatusRestricted :: A.Value -> AT.Parser ChatMemberStatus
      parseChatMemberStatusRestricted = A.withObject "ChatMemberStatusRestricted" $ \o -> do
        is_member_             <- o A..:?  "is_member"
        restricted_until_date_ <- o A..:?  "restricted_until_date"
        permissions_           <- o A..:?  "permissions"
        pure $ ChatMemberStatusRestricted
          { is_member             = is_member_
          , restricted_until_date = restricted_until_date_
          , permissions           = permissions_
          }
      parseChatMemberStatusBanned :: A.Value -> AT.Parser ChatMemberStatus
      parseChatMemberStatusBanned = A.withObject "ChatMemberStatusBanned" $ \o -> do
        banned_until_date_ <- o A..:?  "banned_until_date"
        pure $ ChatMemberStatusBanned
          { banned_until_date = banned_until_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatMemberStatus where
  toJSON ChatMemberStatusCreator
    { custom_title = custom_title_
    , is_anonymous = is_anonymous_
    , is_member    = is_member_
    }
      = A.object
        [ "@type"        A..= AT.String "chatMemberStatusCreator"
        , "custom_title" A..= custom_title_
        , "is_anonymous" A..= is_anonymous_
        , "is_member"    A..= is_member_
        ]
  toJSON ChatMemberStatusAdministrator
    { custom_title  = custom_title_
    , can_be_edited = can_be_edited_
    , rights        = rights_
    }
      = A.object
        [ "@type"         A..= AT.String "chatMemberStatusAdministrator"
        , "custom_title"  A..= custom_title_
        , "can_be_edited" A..= can_be_edited_
        , "rights"        A..= rights_
        ]
  toJSON ChatMemberStatusMember
    { member_until_date = member_until_date_
    }
      = A.object
        [ "@type"             A..= AT.String "chatMemberStatusMember"
        , "member_until_date" A..= member_until_date_
        ]
  toJSON ChatMemberStatusRestricted
    { is_member             = is_member_
    , restricted_until_date = restricted_until_date_
    , permissions           = permissions_
    }
      = A.object
        [ "@type"                 A..= AT.String "chatMemberStatusRestricted"
        , "is_member"             A..= is_member_
        , "restricted_until_date" A..= restricted_until_date_
        , "permissions"           A..= permissions_
        ]
  toJSON ChatMemberStatusLeft
      = A.object
        [ "@type" A..= AT.String "chatMemberStatusLeft"
        ]
  toJSON ChatMemberStatusBanned
    { banned_until_date = banned_until_date_
    }
      = A.object
        [ "@type"             A..= AT.String "chatMemberStatusBanned"
        , "banned_until_date" A..= banned_until_date_
        ]

