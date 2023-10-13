module TD.Data.AttachmentMenuBot
  ( AttachmentMenuBot(..)    
  , defaultAttachmentMenuBot 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Data.File as File

data AttachmentMenuBot
  = AttachmentMenuBot -- ^ Represents a bot, which can be added to attachment menu
    { bot_user_id            :: Maybe Int                                           -- ^ User identifier of the bot added to attachment menu
    , supports_self_chat     :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in the chat with the bot
    , supports_user_chats    :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in private chats with ordinary users
    , supports_bot_chats     :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in private chats with other bots
    , supports_group_chats   :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in basic group and supergroup chats
    , supports_channel_chats :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in channel chats
    , supports_settings      :: Maybe Bool                                          -- ^ True, if the bot supports "settings_button_pressed" event
    , request_write_access   :: Maybe Bool                                          -- ^ True, if the user must be asked for the permission to the bot to send them messages
    , name                   :: Maybe T.Text                                        -- ^ Name for the bot in attachment menu
    , name_color             :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor -- ^ Color to highlight selected name of the bot if appropriate; may be null
    , default_icon           :: Maybe File.File                                     -- ^ Default attachment menu icon for the bot in SVG format; may be null
    , ios_static_icon        :: Maybe File.File                                     -- ^ Attachment menu icon for the bot in SVG format for the official iOS app; may be null
    , ios_animated_icon      :: Maybe File.File                                     -- ^ Attachment menu icon for the bot in TGS format for the official iOS app; may be null
    , android_icon           :: Maybe File.File                                     -- ^ Attachment menu icon for the bot in TGS format for the official Android app; may be null
    , macos_icon             :: Maybe File.File                                     -- ^ Attachment menu icon for the bot in TGS format for the official native macOS app; may be null
    , icon_color             :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor -- ^ Color to highlight selected icon of the bot if appropriate; may be null
    , web_app_placeholder    :: Maybe File.File                                     -- ^ Default placeholder for opened Web Apps in SVG format; may be null
    }
  deriving (Eq)

instance Show AttachmentMenuBot where
  show AttachmentMenuBot
    { bot_user_id            = bot_user_id_
    , supports_self_chat     = supports_self_chat_
    , supports_user_chats    = supports_user_chats_
    , supports_bot_chats     = supports_bot_chats_
    , supports_group_chats   = supports_group_chats_
    , supports_channel_chats = supports_channel_chats_
    , supports_settings      = supports_settings_
    , request_write_access   = request_write_access_
    , name                   = name_
    , name_color             = name_color_
    , default_icon           = default_icon_
    , ios_static_icon        = ios_static_icon_
    , ios_animated_icon      = ios_animated_icon_
    , android_icon           = android_icon_
    , macos_icon             = macos_icon_
    , icon_color             = icon_color_
    , web_app_placeholder    = web_app_placeholder_
    }
      = "AttachmentMenuBot"
        ++ I.cc
        [ "bot_user_id"            `I.p` bot_user_id_
        , "supports_self_chat"     `I.p` supports_self_chat_
        , "supports_user_chats"    `I.p` supports_user_chats_
        , "supports_bot_chats"     `I.p` supports_bot_chats_
        , "supports_group_chats"   `I.p` supports_group_chats_
        , "supports_channel_chats" `I.p` supports_channel_chats_
        , "supports_settings"      `I.p` supports_settings_
        , "request_write_access"   `I.p` request_write_access_
        , "name"                   `I.p` name_
        , "name_color"             `I.p` name_color_
        , "default_icon"           `I.p` default_icon_
        , "ios_static_icon"        `I.p` ios_static_icon_
        , "ios_animated_icon"      `I.p` ios_animated_icon_
        , "android_icon"           `I.p` android_icon_
        , "macos_icon"             `I.p` macos_icon_
        , "icon_color"             `I.p` icon_color_
        , "web_app_placeholder"    `I.p` web_app_placeholder_
        ]

instance AT.FromJSON AttachmentMenuBot where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "attachmentMenuBot" -> parseAttachmentMenuBot v
      _                   -> mempty
    
    where
      parseAttachmentMenuBot :: A.Value -> AT.Parser AttachmentMenuBot
      parseAttachmentMenuBot = A.withObject "AttachmentMenuBot" $ \o -> do
        bot_user_id_            <- o A..:?  "bot_user_id"
        supports_self_chat_     <- o A..:?  "supports_self_chat"
        supports_user_chats_    <- o A..:?  "supports_user_chats"
        supports_bot_chats_     <- o A..:?  "supports_bot_chats"
        supports_group_chats_   <- o A..:?  "supports_group_chats"
        supports_channel_chats_ <- o A..:?  "supports_channel_chats"
        supports_settings_      <- o A..:?  "supports_settings"
        request_write_access_   <- o A..:?  "request_write_access"
        name_                   <- o A..:?  "name"
        name_color_             <- o A..:?  "name_color"
        default_icon_           <- o A..:?  "default_icon"
        ios_static_icon_        <- o A..:?  "ios_static_icon"
        ios_animated_icon_      <- o A..:?  "ios_animated_icon"
        android_icon_           <- o A..:?  "android_icon"
        macos_icon_             <- o A..:?  "macos_icon"
        icon_color_             <- o A..:?  "icon_color"
        web_app_placeholder_    <- o A..:?  "web_app_placeholder"
        pure $ AttachmentMenuBot
          { bot_user_id            = bot_user_id_
          , supports_self_chat     = supports_self_chat_
          , supports_user_chats    = supports_user_chats_
          , supports_bot_chats     = supports_bot_chats_
          , supports_group_chats   = supports_group_chats_
          , supports_channel_chats = supports_channel_chats_
          , supports_settings      = supports_settings_
          , request_write_access   = request_write_access_
          , name                   = name_
          , name_color             = name_color_
          , default_icon           = default_icon_
          , ios_static_icon        = ios_static_icon_
          , ios_animated_icon      = ios_animated_icon_
          , android_icon           = android_icon_
          , macos_icon             = macos_icon_
          , icon_color             = icon_color_
          , web_app_placeholder    = web_app_placeholder_
          }
  parseJSON _ = mempty

instance AT.ToJSON AttachmentMenuBot where
  toJSON AttachmentMenuBot
    { bot_user_id            = bot_user_id_
    , supports_self_chat     = supports_self_chat_
    , supports_user_chats    = supports_user_chats_
    , supports_bot_chats     = supports_bot_chats_
    , supports_group_chats   = supports_group_chats_
    , supports_channel_chats = supports_channel_chats_
    , supports_settings      = supports_settings_
    , request_write_access   = request_write_access_
    , name                   = name_
    , name_color             = name_color_
    , default_icon           = default_icon_
    , ios_static_icon        = ios_static_icon_
    , ios_animated_icon      = ios_animated_icon_
    , android_icon           = android_icon_
    , macos_icon             = macos_icon_
    , icon_color             = icon_color_
    , web_app_placeholder    = web_app_placeholder_
    }
      = A.object
        [ "@type"                  A..= AT.String "attachmentMenuBot"
        , "bot_user_id"            A..= bot_user_id_
        , "supports_self_chat"     A..= supports_self_chat_
        , "supports_user_chats"    A..= supports_user_chats_
        , "supports_bot_chats"     A..= supports_bot_chats_
        , "supports_group_chats"   A..= supports_group_chats_
        , "supports_channel_chats" A..= supports_channel_chats_
        , "supports_settings"      A..= supports_settings_
        , "request_write_access"   A..= request_write_access_
        , "name"                   A..= name_
        , "name_color"             A..= name_color_
        , "default_icon"           A..= default_icon_
        , "ios_static_icon"        A..= ios_static_icon_
        , "ios_animated_icon"      A..= ios_animated_icon_
        , "android_icon"           A..= android_icon_
        , "macos_icon"             A..= macos_icon_
        , "icon_color"             A..= icon_color_
        , "web_app_placeholder"    A..= web_app_placeholder_
        ]

defaultAttachmentMenuBot :: AttachmentMenuBot
defaultAttachmentMenuBot =
  AttachmentMenuBot
    { bot_user_id            = Nothing
    , supports_self_chat     = Nothing
    , supports_user_chats    = Nothing
    , supports_bot_chats     = Nothing
    , supports_group_chats   = Nothing
    , supports_channel_chats = Nothing
    , supports_settings      = Nothing
    , request_write_access   = Nothing
    , name                   = Nothing
    , name_color             = Nothing
    , default_icon           = Nothing
    , ios_static_icon        = Nothing
    , ios_animated_icon      = Nothing
    , android_icon           = Nothing
    , macos_icon             = Nothing
    , icon_color             = Nothing
    , web_app_placeholder    = Nothing
    }

