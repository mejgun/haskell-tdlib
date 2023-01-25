{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPermissions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatPermissions = -- | Describes actions that a user is allowed to take in a chat
  ChatPermissions
  { -- | True, if the user can manage topics
    can_manage_topics :: Maybe Bool,
    -- | True, if the user can pin messages
    can_pin_messages :: Maybe Bool,
    -- | True, if the user can invite new users to the chat
    can_invite_users :: Maybe Bool,
    -- | True, if the user can change the chat title, photo, and other settings
    can_change_info :: Maybe Bool,
    -- | True, if the user may add a web page preview to their messages. Implies can_send_messages permissions
    can_add_web_page_previews :: Maybe Bool,
    -- | True, if the user can send animations, games, stickers, and dice and use inline bots. Implies can_send_messages permissions
    can_send_other_messages :: Maybe Bool,
    -- | True, if the user can send polls. Implies can_send_messages permissions
    can_send_polls :: Maybe Bool,
    -- | True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
    can_send_media_messages :: Maybe Bool,
    -- | True, if the user can send text messages, contacts, invoices, locations, and venues
    can_send_messages :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatPermissions where
  show
    ChatPermissions
      { can_manage_topics = can_manage_topics_,
        can_pin_messages = can_pin_messages_,
        can_invite_users = can_invite_users_,
        can_change_info = can_change_info_,
        can_add_web_page_previews = can_add_web_page_previews_,
        can_send_other_messages = can_send_other_messages_,
        can_send_polls = can_send_polls_,
        can_send_media_messages = can_send_media_messages_,
        can_send_messages = can_send_messages_
      } =
      "ChatPermissions"
        ++ U.cc
          [ U.p "can_manage_topics" can_manage_topics_,
            U.p "can_pin_messages" can_pin_messages_,
            U.p "can_invite_users" can_invite_users_,
            U.p "can_change_info" can_change_info_,
            U.p "can_add_web_page_previews" can_add_web_page_previews_,
            U.p "can_send_other_messages" can_send_other_messages_,
            U.p "can_send_polls" can_send_polls_,
            U.p "can_send_media_messages" can_send_media_messages_,
            U.p "can_send_messages" can_send_messages_
          ]

instance T.FromJSON ChatPermissions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPermissions" -> parseChatPermissions v
      _ -> mempty
    where
      parseChatPermissions :: A.Value -> T.Parser ChatPermissions
      parseChatPermissions = A.withObject "ChatPermissions" $ \o -> do
        can_manage_topics_ <- o A..:? "can_manage_topics"
        can_pin_messages_ <- o A..:? "can_pin_messages"
        can_invite_users_ <- o A..:? "can_invite_users"
        can_change_info_ <- o A..:? "can_change_info"
        can_add_web_page_previews_ <- o A..:? "can_add_web_page_previews"
        can_send_other_messages_ <- o A..:? "can_send_other_messages"
        can_send_polls_ <- o A..:? "can_send_polls"
        can_send_media_messages_ <- o A..:? "can_send_media_messages"
        can_send_messages_ <- o A..:? "can_send_messages"
        return $ ChatPermissions {can_manage_topics = can_manage_topics_, can_pin_messages = can_pin_messages_, can_invite_users = can_invite_users_, can_change_info = can_change_info_, can_add_web_page_previews = can_add_web_page_previews_, can_send_other_messages = can_send_other_messages_, can_send_polls = can_send_polls_, can_send_media_messages = can_send_media_messages_, can_send_messages = can_send_messages_}
  parseJSON _ = mempty

instance T.ToJSON ChatPermissions where
  toJSON
    ChatPermissions
      { can_manage_topics = can_manage_topics_,
        can_pin_messages = can_pin_messages_,
        can_invite_users = can_invite_users_,
        can_change_info = can_change_info_,
        can_add_web_page_previews = can_add_web_page_previews_,
        can_send_other_messages = can_send_other_messages_,
        can_send_polls = can_send_polls_,
        can_send_media_messages = can_send_media_messages_,
        can_send_messages = can_send_messages_
      } =
      A.object
        [ "@type" A..= T.String "chatPermissions",
          "can_manage_topics" A..= can_manage_topics_,
          "can_pin_messages" A..= can_pin_messages_,
          "can_invite_users" A..= can_invite_users_,
          "can_change_info" A..= can_change_info_,
          "can_add_web_page_previews" A..= can_add_web_page_previews_,
          "can_send_other_messages" A..= can_send_other_messages_,
          "can_send_polls" A..= can_send_polls_,
          "can_send_media_messages" A..= can_send_media_messages_,
          "can_send_messages" A..= can_send_messages_
        ]
