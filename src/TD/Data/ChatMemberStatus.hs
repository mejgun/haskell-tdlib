{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified Utils as U

-- | Provides information about the status of a member in a chat
data ChatMemberStatus
  = -- | The user is the owner of the chat and has all the administrator privileges
    ChatMemberStatusCreator
      { -- | True, if the user is a member of the chat
        is_member :: Maybe Bool,
        -- | True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
        is_anonymous :: Maybe Bool,
        -- | A custom title of the owner; 0-16 characters without emojis; applicable to supergroups only
        custom_title :: Maybe String
      }
  | -- | The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage video chats. In supergroups and channels, there are more detailed options for administrator privileges
    ChatMemberStatusAdministrator
      { -- | Rights of the administrator
        rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
        -- | True, if the current user can edit the administrator privileges for the called user
        can_be_edited :: Maybe Bool,
        -- | A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
        custom_title :: Maybe String
      }
  | -- | The user is a member of the chat, without any additional privileges or restrictions
    ChatMemberStatusMember
  | -- | The user is under certain restrictions in the chat. Not supported in basic groups and channels
    ChatMemberStatusRestricted
      { -- | User permissions in the chat
        permissions :: Maybe ChatPermissions.ChatPermissions,
        -- | Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
        restricted_until_date :: Maybe Int,
        -- | True, if the user is a member of the chat
        is_member :: Maybe Bool
      }
  | -- | The user or the chat is not a chat member
    ChatMemberStatusLeft
  | -- | The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat
    ChatMemberStatusBanned
      { -- | Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
        banned_until_date :: Maybe Int
      }
  deriving (Eq)

instance Show ChatMemberStatus where
  show
    ChatMemberStatusCreator
      { is_member = is_member_,
        is_anonymous = is_anonymous_,
        custom_title = custom_title_
      } =
      "ChatMemberStatusCreator"
        ++ U.cc
          [ U.p "is_member" is_member_,
            U.p "is_anonymous" is_anonymous_,
            U.p "custom_title" custom_title_
          ]
  show
    ChatMemberStatusAdministrator
      { rights = rights_,
        can_be_edited = can_be_edited_,
        custom_title = custom_title_
      } =
      "ChatMemberStatusAdministrator"
        ++ U.cc
          [ U.p "rights" rights_,
            U.p "can_be_edited" can_be_edited_,
            U.p "custom_title" custom_title_
          ]
  show ChatMemberStatusMember =
    "ChatMemberStatusMember"
      ++ U.cc
        []
  show
    ChatMemberStatusRestricted
      { permissions = permissions_,
        restricted_until_date = restricted_until_date_,
        is_member = is_member_
      } =
      "ChatMemberStatusRestricted"
        ++ U.cc
          [ U.p "permissions" permissions_,
            U.p "restricted_until_date" restricted_until_date_,
            U.p "is_member" is_member_
          ]
  show ChatMemberStatusLeft =
    "ChatMemberStatusLeft"
      ++ U.cc
        []
  show
    ChatMemberStatusBanned
      { banned_until_date = banned_until_date_
      } =
      "ChatMemberStatusBanned"
        ++ U.cc
          [ U.p "banned_until_date" banned_until_date_
          ]

instance T.FromJSON ChatMemberStatus where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMemberStatusCreator" -> parseChatMemberStatusCreator v
      "chatMemberStatusAdministrator" -> parseChatMemberStatusAdministrator v
      "chatMemberStatusMember" -> parseChatMemberStatusMember v
      "chatMemberStatusRestricted" -> parseChatMemberStatusRestricted v
      "chatMemberStatusLeft" -> parseChatMemberStatusLeft v
      "chatMemberStatusBanned" -> parseChatMemberStatusBanned v
      _ -> mempty
    where
      parseChatMemberStatusCreator :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusCreator = A.withObject "ChatMemberStatusCreator" $ \o -> do
        is_member_ <- o A..:? "is_member"
        is_anonymous_ <- o A..:? "is_anonymous"
        custom_title_ <- o A..:? "custom_title"
        return $ ChatMemberStatusCreator {is_member = is_member_, is_anonymous = is_anonymous_, custom_title = custom_title_}

      parseChatMemberStatusAdministrator :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusAdministrator = A.withObject "ChatMemberStatusAdministrator" $ \o -> do
        rights_ <- o A..:? "rights"
        can_be_edited_ <- o A..:? "can_be_edited"
        custom_title_ <- o A..:? "custom_title"
        return $ ChatMemberStatusAdministrator {rights = rights_, can_be_edited = can_be_edited_, custom_title = custom_title_}

      parseChatMemberStatusMember :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusMember = A.withObject "ChatMemberStatusMember" $ \_ -> return ChatMemberStatusMember

      parseChatMemberStatusRestricted :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusRestricted = A.withObject "ChatMemberStatusRestricted" $ \o -> do
        permissions_ <- o A..:? "permissions"
        restricted_until_date_ <- mconcat [o A..:? "restricted_until_date", U.rm <$> (o A..: "restricted_until_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        is_member_ <- o A..:? "is_member"
        return $ ChatMemberStatusRestricted {permissions = permissions_, restricted_until_date = restricted_until_date_, is_member = is_member_}

      parseChatMemberStatusLeft :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusLeft = A.withObject "ChatMemberStatusLeft" $ \_ -> return ChatMemberStatusLeft

      parseChatMemberStatusBanned :: A.Value -> T.Parser ChatMemberStatus
      parseChatMemberStatusBanned = A.withObject "ChatMemberStatusBanned" $ \o -> do
        banned_until_date_ <- mconcat [o A..:? "banned_until_date", U.rm <$> (o A..: "banned_until_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatMemberStatusBanned {banned_until_date = banned_until_date_}
  parseJSON _ = mempty

instance T.ToJSON ChatMemberStatus where
  toJSON
    ChatMemberStatusCreator
      { is_member = is_member_,
        is_anonymous = is_anonymous_,
        custom_title = custom_title_
      } =
      A.object
        [ "@type" A..= T.String "chatMemberStatusCreator",
          "is_member" A..= is_member_,
          "is_anonymous" A..= is_anonymous_,
          "custom_title" A..= custom_title_
        ]
  toJSON
    ChatMemberStatusAdministrator
      { rights = rights_,
        can_be_edited = can_be_edited_,
        custom_title = custom_title_
      } =
      A.object
        [ "@type" A..= T.String "chatMemberStatusAdministrator",
          "rights" A..= rights_,
          "can_be_edited" A..= can_be_edited_,
          "custom_title" A..= custom_title_
        ]
  toJSON ChatMemberStatusMember =
    A.object
      [ "@type" A..= T.String "chatMemberStatusMember"
      ]
  toJSON
    ChatMemberStatusRestricted
      { permissions = permissions_,
        restricted_until_date = restricted_until_date_,
        is_member = is_member_
      } =
      A.object
        [ "@type" A..= T.String "chatMemberStatusRestricted",
          "permissions" A..= permissions_,
          "restricted_until_date" A..= restricted_until_date_,
          "is_member" A..= is_member_
        ]
  toJSON ChatMemberStatusLeft =
    A.object
      [ "@type" A..= T.String "chatMemberStatusLeft"
      ]
  toJSON
    ChatMemberStatusBanned
      { banned_until_date = banned_until_date_
      } =
      A.object
        [ "@type" A..= T.String "chatMemberStatusBanned",
          "banned_until_date" A..= banned_until_date_
        ]
