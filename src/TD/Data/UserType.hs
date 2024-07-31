module TD.Data.UserType
  (UserType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents the type of user. The following types are possible: regular users, deleted users and bots
data UserType
  = UserTypeRegular -- ^ A regular user
  | UserTypeDeleted -- ^ A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user
  | UserTypeBot -- ^ A bot (see https://core.telegram.org/bots)
    { can_be_edited                   :: Maybe Bool   -- ^ True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription
    , can_join_groups                 :: Maybe Bool   -- ^ True, if the bot can be invited to basic group and supergroup chats
    , can_read_all_group_messages     :: Maybe Bool   -- ^ True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
    , has_main_web_app                :: Maybe Bool   -- ^ True, if the bot has the main Web App
    , is_inline                       :: Maybe Bool   -- ^ True, if the bot supports inline queries
    , inline_query_placeholder        :: Maybe T.Text -- ^ Placeholder for inline queries (displayed on the application input field)
    , need_location                   :: Maybe Bool   -- ^ True, if the location of the user is expected to be sent with every inline query to this bot
    , can_connect_to_business         :: Maybe Bool   -- ^ True, if the bot supports connection to Telegram Business accounts
    , can_be_added_to_attachment_menu :: Maybe Bool   -- ^ True, if the bot can be added to attachment or side menu
    , active_user_count               :: Maybe Int    -- ^ The number of recently active users of the bot
    }
  | UserTypeUnknown -- ^ No information on the user besides the user identifier is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
  deriving (Eq, Show)

instance I.ShortShow UserType where
  shortShow UserTypeRegular
      = "UserTypeRegular"
  shortShow UserTypeDeleted
      = "UserTypeDeleted"
  shortShow UserTypeBot
    { can_be_edited                   = can_be_edited_
    , can_join_groups                 = can_join_groups_
    , can_read_all_group_messages     = can_read_all_group_messages_
    , has_main_web_app                = has_main_web_app_
    , is_inline                       = is_inline_
    , inline_query_placeholder        = inline_query_placeholder_
    , need_location                   = need_location_
    , can_connect_to_business         = can_connect_to_business_
    , can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_
    , active_user_count               = active_user_count_
    }
      = "UserTypeBot"
        ++ I.cc
        [ "can_be_edited"                   `I.p` can_be_edited_
        , "can_join_groups"                 `I.p` can_join_groups_
        , "can_read_all_group_messages"     `I.p` can_read_all_group_messages_
        , "has_main_web_app"                `I.p` has_main_web_app_
        , "is_inline"                       `I.p` is_inline_
        , "inline_query_placeholder"        `I.p` inline_query_placeholder_
        , "need_location"                   `I.p` need_location_
        , "can_connect_to_business"         `I.p` can_connect_to_business_
        , "can_be_added_to_attachment_menu" `I.p` can_be_added_to_attachment_menu_
        , "active_user_count"               `I.p` active_user_count_
        ]
  shortShow UserTypeUnknown
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
        has_main_web_app_                <- o A..:?  "has_main_web_app"
        is_inline_                       <- o A..:?  "is_inline"
        inline_query_placeholder_        <- o A..:?  "inline_query_placeholder"
        need_location_                   <- o A..:?  "need_location"
        can_connect_to_business_         <- o A..:?  "can_connect_to_business"
        can_be_added_to_attachment_menu_ <- o A..:?  "can_be_added_to_attachment_menu"
        active_user_count_               <- o A..:?  "active_user_count"
        pure $ UserTypeBot
          { can_be_edited                   = can_be_edited_
          , can_join_groups                 = can_join_groups_
          , can_read_all_group_messages     = can_read_all_group_messages_
          , has_main_web_app                = has_main_web_app_
          , is_inline                       = is_inline_
          , inline_query_placeholder        = inline_query_placeholder_
          , need_location                   = need_location_
          , can_connect_to_business         = can_connect_to_business_
          , can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_
          , active_user_count               = active_user_count_
          }
  parseJSON _ = mempty

