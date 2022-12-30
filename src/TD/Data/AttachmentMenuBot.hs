{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AttachmentMenuBot where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Data.File as File
import qualified Utils as U

-- |
data AttachmentMenuBot = -- | Represents a bot, which can be added to attachment menu
  AttachmentMenuBot
  { -- | Default placeholder for opened Web Apps in SVG format; may be null
    web_app_placeholder :: Maybe File.File,
    -- | Color to highlight selected icon of the bot if appropriate; may be null
    icon_color :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor,
    -- | Attachment menu icon for the bot in TGS format for the official native macOS app; may be null
    macos_icon :: Maybe File.File,
    -- | Attachment menu icon for the bot in TGS format for the official Android app; may be null
    android_icon :: Maybe File.File,
    -- | Attachment menu icon for the bot in TGS format for the official iOS app; may be null
    ios_animated_icon :: Maybe File.File,
    -- | Attachment menu icon for the bot in SVG format for the official iOS app; may be null
    ios_static_icon :: Maybe File.File,
    -- | Default attachment menu icon for the bot in SVG format; may be null
    default_icon :: Maybe File.File,
    -- | Color to highlight selected name of the bot if appropriate; may be null
    name_color :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor,
    -- | Name for the bot in attachment menu
    name :: Maybe String,
    -- | True, if the user needs to be requested to give the permission to the bot to send them messages
    request_write_access :: Maybe Bool,
    -- | True, if the bot supports "settings_button_pressed" event
    supports_settings :: Maybe Bool,
    -- | True, if the bot supports opening from attachment menu in channel chats
    supports_channel_chats :: Maybe Bool,
    -- | True, if the bot supports opening from attachment menu in basic group and supergroup chats
    supports_group_chats :: Maybe Bool,
    -- | True, if the bot supports opening from attachment menu in private chats with other bots
    supports_bot_chats :: Maybe Bool,
    -- | True, if the bot supports opening from attachment menu in private chats with ordinary users
    supports_user_chats :: Maybe Bool,
    -- | True, if the bot supports opening from attachment menu in the chat with the bot
    supports_self_chat :: Maybe Bool,
    -- | User identifier of the bot added to attachment menu
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show AttachmentMenuBot where
  show
    AttachmentMenuBot
      { web_app_placeholder = web_app_placeholder_,
        icon_color = icon_color_,
        macos_icon = macos_icon_,
        android_icon = android_icon_,
        ios_animated_icon = ios_animated_icon_,
        ios_static_icon = ios_static_icon_,
        default_icon = default_icon_,
        name_color = name_color_,
        name = name_,
        request_write_access = request_write_access_,
        supports_settings = supports_settings_,
        supports_channel_chats = supports_channel_chats_,
        supports_group_chats = supports_group_chats_,
        supports_bot_chats = supports_bot_chats_,
        supports_user_chats = supports_user_chats_,
        supports_self_chat = supports_self_chat_,
        bot_user_id = bot_user_id_
      } =
      "AttachmentMenuBot"
        ++ U.cc
          [ U.p "web_app_placeholder" web_app_placeholder_,
            U.p "icon_color" icon_color_,
            U.p "macos_icon" macos_icon_,
            U.p "android_icon" android_icon_,
            U.p "ios_animated_icon" ios_animated_icon_,
            U.p "ios_static_icon" ios_static_icon_,
            U.p "default_icon" default_icon_,
            U.p "name_color" name_color_,
            U.p "name" name_,
            U.p "request_write_access" request_write_access_,
            U.p "supports_settings" supports_settings_,
            U.p "supports_channel_chats" supports_channel_chats_,
            U.p "supports_group_chats" supports_group_chats_,
            U.p "supports_bot_chats" supports_bot_chats_,
            U.p "supports_user_chats" supports_user_chats_,
            U.p "supports_self_chat" supports_self_chat_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.FromJSON AttachmentMenuBot where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "attachmentMenuBot" -> parseAttachmentMenuBot v
      _ -> mempty
    where
      parseAttachmentMenuBot :: A.Value -> T.Parser AttachmentMenuBot
      parseAttachmentMenuBot = A.withObject "AttachmentMenuBot" $ \o -> do
        web_app_placeholder_ <- o A..:? "web_app_placeholder"
        icon_color_ <- o A..:? "icon_color"
        macos_icon_ <- o A..:? "macos_icon"
        android_icon_ <- o A..:? "android_icon"
        ios_animated_icon_ <- o A..:? "ios_animated_icon"
        ios_static_icon_ <- o A..:? "ios_static_icon"
        default_icon_ <- o A..:? "default_icon"
        name_color_ <- o A..:? "name_color"
        name_ <- o A..:? "name"
        request_write_access_ <- o A..:? "request_write_access"
        supports_settings_ <- o A..:? "supports_settings"
        supports_channel_chats_ <- o A..:? "supports_channel_chats"
        supports_group_chats_ <- o A..:? "supports_group_chats"
        supports_bot_chats_ <- o A..:? "supports_bot_chats"
        supports_user_chats_ <- o A..:? "supports_user_chats"
        supports_self_chat_ <- o A..:? "supports_self_chat"
        bot_user_id_ <- o A..:? "bot_user_id"
        return $ AttachmentMenuBot {web_app_placeholder = web_app_placeholder_, icon_color = icon_color_, macos_icon = macos_icon_, android_icon = android_icon_, ios_animated_icon = ios_animated_icon_, ios_static_icon = ios_static_icon_, default_icon = default_icon_, name_color = name_color_, name = name_, request_write_access = request_write_access_, supports_settings = supports_settings_, supports_channel_chats = supports_channel_chats_, supports_group_chats = supports_group_chats_, supports_bot_chats = supports_bot_chats_, supports_user_chats = supports_user_chats_, supports_self_chat = supports_self_chat_, bot_user_id = bot_user_id_}
  parseJSON _ = mempty

instance T.ToJSON AttachmentMenuBot where
  toJSON
    AttachmentMenuBot
      { web_app_placeholder = web_app_placeholder_,
        icon_color = icon_color_,
        macos_icon = macos_icon_,
        android_icon = android_icon_,
        ios_animated_icon = ios_animated_icon_,
        ios_static_icon = ios_static_icon_,
        default_icon = default_icon_,
        name_color = name_color_,
        name = name_,
        request_write_access = request_write_access_,
        supports_settings = supports_settings_,
        supports_channel_chats = supports_channel_chats_,
        supports_group_chats = supports_group_chats_,
        supports_bot_chats = supports_bot_chats_,
        supports_user_chats = supports_user_chats_,
        supports_self_chat = supports_self_chat_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "attachmentMenuBot",
          "web_app_placeholder" A..= web_app_placeholder_,
          "icon_color" A..= icon_color_,
          "macos_icon" A..= macos_icon_,
          "android_icon" A..= android_icon_,
          "ios_animated_icon" A..= ios_animated_icon_,
          "ios_static_icon" A..= ios_static_icon_,
          "default_icon" A..= default_icon_,
          "name_color" A..= name_color_,
          "name" A..= name_,
          "request_write_access" A..= request_write_access_,
          "supports_settings" A..= supports_settings_,
          "supports_channel_chats" A..= supports_channel_chats_,
          "supports_group_chats" A..= supports_group_chats_,
          "supports_bot_chats" A..= supports_bot_chats_,
          "supports_user_chats" A..= supports_user_chats_,
          "supports_self_chat" A..= supports_self_chat_,
          "bot_user_id" A..= bot_user_id_
        ]
