module TD.Data.UserType (UserType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UserType -- ^ Represents the type of a user. The following types are possible: regular users, deleted users and bots
  = UserTypeRegular -- ^ A regular user
  | UserTypeDeleted -- ^ A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user
  | UserTypeBot -- ^ A bot (see https://core.telegram.org/bots)
    { can_be_edited                   :: Maybe Bool   -- ^ True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription
    , can_join_groups                 :: Maybe Bool   -- ^ True, if the bot can be invited to basic group and supergroup chats
    , can_read_all_group_messages     :: Maybe Bool   -- ^ True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
    , is_inline                       :: Maybe Bool   -- ^ True, if the bot supports inline queries
    , inline_query_placeholder        :: Maybe T.Text -- ^ Placeholder for inline queries (displayed on the application input field)
    , need_location                   :: Maybe Bool   -- ^ True, if the location of the user is expected to be sent with every inline query to this bot
    , can_be_added_to_attachment_menu :: Maybe Bool   -- ^ True, if the bot can be added to attachment menu
    }
  | UserTypeUnknown -- ^ No information on the user besides the user identifier is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
  deriving (Eq)

instance Show UserType where
  show UserTypeRegular
      = "UserTypeRegular"
  show UserTypeDeleted
      = "UserTypeDeleted"
  show UserTypeBot
    { can_be_edited                   = can_be_edited_
    , can_join_groups                 = can_join_groups_
    , can_read_all_group_messages     = can_read_all_group_messages_
    , is_inline                       = is_inline_
    , inline_query_placeholder        = inline_query_placeholder_
    , need_location                   = need_location_
    , can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_
    }
      = "UserTypeBot"
        ++ I.cc
        [ "can_be_edited"                   `I.p` can_be_edited_
        , "can_join_groups"                 `I.p` can_join_groups_
        , "can_read_all_group_messages"     `I.p` can_read_all_group_messages_
        , "is_inline"                       `I.p` is_inline_
        , "inline_query_placeholder"        `I.p` inline_query_placeholder_
        , "need_location"                   `I.p` need_location_
        , "can_be_added_to_attachment_menu" `I.p` can_be_added_to_attachment_menu_
        ]
  show UserTypeUnknown
      = "UserTypeUnknown"

instance AT.FromJSON UserType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userTypeRegular" -> pure UserTypeRegular
      "userTypeDeleted" -> pure UserTypeDeleted
      "userTypeBot"     -> parseUserTypeBot v
      "userTypeUnknown" -> pure UserTypeUnknown
      _                 -> mempty
    
    where
      parseUserTypeBot :: A.Value -> AT.Parser UserType
      parseUserTypeBot = A.withObject "UserTypeBot" $ \o -> do
        can_be_edited_                   <- o A..:?  "can_be_edited"
        can_join_groups_                 <- o A..:?  "can_join_groups"
        can_read_all_group_messages_     <- o A..:?  "can_read_all_group_messages"
        is_inline_                       <- o A..:?  "is_inline"
        inline_query_placeholder_        <- o A..:?  "inline_query_placeholder"
        need_location_                   <- o A..:?  "need_location"
        can_be_added_to_attachment_menu_ <- o A..:?  "can_be_added_to_attachment_menu"
        pure $ UserTypeBot
          { can_be_edited                   = can_be_edited_
          , can_join_groups                 = can_join_groups_
          , can_read_all_group_messages     = can_read_all_group_messages_
          , is_inline                       = is_inline_
          , inline_query_placeholder        = inline_query_placeholder_
          , need_location                   = need_location_
          , can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_
          }
  parseJSON _ = mempty

instance AT.ToJSON UserType where
  toJSON UserTypeRegular
      = A.object
        [ "@type" A..= AT.String "userTypeRegular"
        ]
  toJSON UserTypeDeleted
      = A.object
        [ "@type" A..= AT.String "userTypeDeleted"
        ]
  toJSON UserTypeBot
    { can_be_edited                   = can_be_edited_
    , can_join_groups                 = can_join_groups_
    , can_read_all_group_messages     = can_read_all_group_messages_
    , is_inline                       = is_inline_
    , inline_query_placeholder        = inline_query_placeholder_
    , need_location                   = need_location_
    , can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_
    }
      = A.object
        [ "@type"                           A..= AT.String "userTypeBot"
        , "can_be_edited"                   A..= can_be_edited_
        , "can_join_groups"                 A..= can_join_groups_
        , "can_read_all_group_messages"     A..= can_read_all_group_messages_
        , "is_inline"                       A..= is_inline_
        , "inline_query_placeholder"        A..= inline_query_placeholder_
        , "need_location"                   A..= need_location_
        , "can_be_added_to_attachment_menu" A..= can_be_added_to_attachment_menu_
        ]
  toJSON UserTypeUnknown
      = A.object
        [ "@type" A..= AT.String "userTypeUnknown"
        ]
