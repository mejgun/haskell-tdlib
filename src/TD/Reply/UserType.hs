{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.UserType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the type of a user. The following types are possible: regular users, deleted users and bots
data UserType
  = -- | A regular user
    UserTypeRegular
  | -- | A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user
    UserTypeDeleted
  | -- | A bot (see https://core.telegram.org/bots)
    UserTypeBot
      { -- | True, if the bot can be added to attachment menu
        can_be_added_to_attachment_menu :: Maybe Bool,
        -- | True, if the location of the user is expected to be sent with every inline query to this bot
        need_location :: Maybe Bool,
        -- | Placeholder for inline queries (displayed on the application input field)
        inline_query_placeholder :: Maybe String,
        -- | True, if the bot supports inline queries
        is_inline :: Maybe Bool,
        -- | True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
        can_read_all_group_messages :: Maybe Bool,
        -- | True, if the bot can be invited to basic group and supergroup chats
        can_join_groups :: Maybe Bool
      }
  | -- | No information on the user besides the user identifier is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
    UserTypeUnknown
  deriving (Eq)

instance Show UserType where
  show UserTypeRegular =
    "UserTypeRegular"
      ++ U.cc
        []
  show UserTypeDeleted =
    "UserTypeDeleted"
      ++ U.cc
        []
  show
    UserTypeBot
      { can_be_added_to_attachment_menu = can_be_added_to_attachment_menu,
        need_location = need_location,
        inline_query_placeholder = inline_query_placeholder,
        is_inline = is_inline,
        can_read_all_group_messages = can_read_all_group_messages,
        can_join_groups = can_join_groups
      } =
      "UserTypeBot"
        ++ U.cc
          [ U.p "can_be_added_to_attachment_menu" can_be_added_to_attachment_menu,
            U.p "need_location" need_location,
            U.p "inline_query_placeholder" inline_query_placeholder,
            U.p "is_inline" is_inline,
            U.p "can_read_all_group_messages" can_read_all_group_messages,
            U.p "can_join_groups" can_join_groups
          ]
  show UserTypeUnknown =
    "UserTypeUnknown"
      ++ U.cc
        []

instance T.FromJSON UserType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userTypeRegular" -> parseUserTypeRegular v
      "userTypeDeleted" -> parseUserTypeDeleted v
      "userTypeBot" -> parseUserTypeBot v
      "userTypeUnknown" -> parseUserTypeUnknown v
      _ -> fail ""
    where
      parseUserTypeRegular :: A.Value -> T.Parser UserType
      parseUserTypeRegular = A.withObject "UserTypeRegular" $ \o -> do
        return $ UserTypeRegular {}

      parseUserTypeDeleted :: A.Value -> T.Parser UserType
      parseUserTypeDeleted = A.withObject "UserTypeDeleted" $ \o -> do
        return $ UserTypeDeleted {}

      parseUserTypeBot :: A.Value -> T.Parser UserType
      parseUserTypeBot = A.withObject "UserTypeBot" $ \o -> do
        can_be_added_to_attachment_menu_ <- o A..:? "can_be_added_to_attachment_menu"
        need_location_ <- o A..:? "need_location"
        inline_query_placeholder_ <- o A..:? "inline_query_placeholder"
        is_inline_ <- o A..:? "is_inline"
        can_read_all_group_messages_ <- o A..:? "can_read_all_group_messages"
        can_join_groups_ <- o A..:? "can_join_groups"
        return $ UserTypeBot {can_be_added_to_attachment_menu = can_be_added_to_attachment_menu_, need_location = need_location_, inline_query_placeholder = inline_query_placeholder_, is_inline = is_inline_, can_read_all_group_messages = can_read_all_group_messages_, can_join_groups = can_join_groups_}

      parseUserTypeUnknown :: A.Value -> T.Parser UserType
      parseUserTypeUnknown = A.withObject "UserTypeUnknown" $ \o -> do
        return $ UserTypeUnknown {}
  parseJSON _ = fail ""

instance T.ToJSON UserType where
  toJSON UserTypeRegular =
    A.object
      [ "@type" A..= T.String "userTypeRegular"
      ]
  toJSON UserTypeDeleted =
    A.object
      [ "@type" A..= T.String "userTypeDeleted"
      ]
  toJSON
    UserTypeBot
      { can_be_added_to_attachment_menu = can_be_added_to_attachment_menu,
        need_location = need_location,
        inline_query_placeholder = inline_query_placeholder,
        is_inline = is_inline,
        can_read_all_group_messages = can_read_all_group_messages,
        can_join_groups = can_join_groups
      } =
      A.object
        [ "@type" A..= T.String "userTypeBot",
          "can_be_added_to_attachment_menu" A..= can_be_added_to_attachment_menu,
          "need_location" A..= need_location,
          "inline_query_placeholder" A..= inline_query_placeholder,
          "is_inline" A..= is_inline,
          "can_read_all_group_messages" A..= can_read_all_group_messages,
          "can_join_groups" A..= can_join_groups
        ]
  toJSON UserTypeUnknown =
    A.object
      [ "@type" A..= T.String "userTypeUnknown"
      ]
