module TD.Data.AttachmentMenuBot
  (AttachmentMenuBot(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Data.File as File

data AttachmentMenuBot
  = AttachmentMenuBot -- ^ Represents a bot, which can be added to attachment or side menu
    { bot_user_id                  :: Maybe Int                                           -- ^ User identifier of the bot
    , supports_self_chat           :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in the chat with the bot
    , supports_user_chats          :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in private chats with ordinary users
    , supports_bot_chats           :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in private chats with other bots
    , supports_group_chats         :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in basic group and supergroup chats
    , supports_channel_chats       :: Maybe Bool                                          -- ^ True, if the bot supports opening from attachment menu in channel chats
    , request_write_access         :: Maybe Bool                                          -- ^ True, if the user must be asked for the permission to send messages to the bot
    , is_added                     :: Maybe Bool                                          -- ^ True, if the bot was explicitly added by the user. If the bot isn't added, then on the first bot launch toggleBotIsAddedToAttachmentMenu must be called and the bot must be added or removed
    , show_in_attachment_menu      :: Maybe Bool                                          -- ^ True, if the bot must be shown in the attachment menu
    , show_in_side_menu            :: Maybe Bool                                          -- ^ True, if the bot must be shown in the side menu
    , show_disclaimer_in_side_menu :: Maybe Bool                                          -- ^ True, if a disclaimer, why the bot is shown in the side menu, is needed
    , name                         :: Maybe T.Text                                        -- ^ Name for the bot in attachment menu
    , name_color                   :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor -- ^ Color to highlight selected name of the bot if appropriate; may be null
    , default_icon                 :: Maybe File.File                                     -- ^ Default icon for the bot in SVG format; may be null
    , ios_static_icon              :: Maybe File.File                                     -- ^ Icon for the bot in SVG format for the official iOS app; may be null
    , ios_animated_icon            :: Maybe File.File                                     -- ^ Icon for the bot in TGS format for the official iOS app; may be null
    , ios_side_menu_icon           :: Maybe File.File                                     -- ^ Icon for the bot in PNG format for the official iOS app side menu; may be null
    , android_icon                 :: Maybe File.File                                     -- ^ Icon for the bot in TGS format for the official Android app; may be null
    , android_side_menu_icon       :: Maybe File.File                                     -- ^ Icon for the bot in SVG format for the official Android app side menu; may be null
    , macos_icon                   :: Maybe File.File                                     -- ^ Icon for the bot in TGS format for the official native macOS app; may be null
    , macos_side_menu_icon         :: Maybe File.File                                     -- ^ Icon for the bot in PNG format for the official macOS app side menu; may be null
    , icon_color                   :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor -- ^ Color to highlight selected icon of the bot if appropriate; may be null
    , web_app_placeholder          :: Maybe File.File                                     -- ^ Default placeholder for opened Web Apps in SVG format; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow AttachmentMenuBot where
  shortShow AttachmentMenuBot
    { bot_user_id                  = bot_user_id_
    , supports_self_chat           = supports_self_chat_
    , supports_user_chats          = supports_user_chats_
    , supports_bot_chats           = supports_bot_chats_
    , supports_group_chats         = supports_group_chats_
    , supports_channel_chats       = supports_channel_chats_
    , request_write_access         = request_write_access_
    , is_added                     = is_added_
    , show_in_attachment_menu      = show_in_attachment_menu_
    , show_in_side_menu            = show_in_side_menu_
    , show_disclaimer_in_side_menu = show_disclaimer_in_side_menu_
    , name                         = name_
    , name_color                   = name_color_
    , default_icon                 = default_icon_
    , ios_static_icon              = ios_static_icon_
    , ios_animated_icon            = ios_animated_icon_
    , ios_side_menu_icon           = ios_side_menu_icon_
    , android_icon                 = android_icon_
    , android_side_menu_icon       = android_side_menu_icon_
    , macos_icon                   = macos_icon_
    , macos_side_menu_icon         = macos_side_menu_icon_
    , icon_color                   = icon_color_
    , web_app_placeholder          = web_app_placeholder_
    }
      = "AttachmentMenuBot"
        ++ I.cc
        [ "bot_user_id"                  `I.p` bot_user_id_
        , "supports_self_chat"           `I.p` supports_self_chat_
        , "supports_user_chats"          `I.p` supports_user_chats_
        , "supports_bot_chats"           `I.p` supports_bot_chats_
        , "supports_group_chats"         `I.p` supports_group_chats_
        , "supports_channel_chats"       `I.p` supports_channel_chats_
        , "request_write_access"         `I.p` request_write_access_
        , "is_added"                     `I.p` is_added_
        , "show_in_attachment_menu"      `I.p` show_in_attachment_menu_
        , "show_in_side_menu"            `I.p` show_in_side_menu_
        , "show_disclaimer_in_side_menu" `I.p` show_disclaimer_in_side_menu_
        , "name"                         `I.p` name_
        , "name_color"                   `I.p` name_color_
        , "default_icon"                 `I.p` default_icon_
        , "ios_static_icon"              `I.p` ios_static_icon_
        , "ios_animated_icon"            `I.p` ios_animated_icon_
        , "ios_side_menu_icon"           `I.p` ios_side_menu_icon_
        , "android_icon"                 `I.p` android_icon_
        , "android_side_menu_icon"       `I.p` android_side_menu_icon_
        , "macos_icon"                   `I.p` macos_icon_
        , "macos_side_menu_icon"         `I.p` macos_side_menu_icon_
        , "icon_color"                   `I.p` icon_color_
        , "web_app_placeholder"          `I.p` web_app_placeholder_
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
        bot_user_id_                  <- o A..:?  "bot_user_id"
        supports_self_chat_           <- o A..:?  "supports_self_chat"
        supports_user_chats_          <- o A..:?  "supports_user_chats"
        supports_bot_chats_           <- o A..:?  "supports_bot_chats"
        supports_group_chats_         <- o A..:?  "supports_group_chats"
        supports_channel_chats_       <- o A..:?  "supports_channel_chats"
        request_write_access_         <- o A..:?  "request_write_access"
        is_added_                     <- o A..:?  "is_added"
        show_in_attachment_menu_      <- o A..:?  "show_in_attachment_menu"
        show_in_side_menu_            <- o A..:?  "show_in_side_menu"
        show_disclaimer_in_side_menu_ <- o A..:?  "show_disclaimer_in_side_menu"
        name_                         <- o A..:?  "name"
        name_color_                   <- o A..:?  "name_color"
        default_icon_                 <- o A..:?  "default_icon"
        ios_static_icon_              <- o A..:?  "ios_static_icon"
        ios_animated_icon_            <- o A..:?  "ios_animated_icon"
        ios_side_menu_icon_           <- o A..:?  "ios_side_menu_icon"
        android_icon_                 <- o A..:?  "android_icon"
        android_side_menu_icon_       <- o A..:?  "android_side_menu_icon"
        macos_icon_                   <- o A..:?  "macos_icon"
        macos_side_menu_icon_         <- o A..:?  "macos_side_menu_icon"
        icon_color_                   <- o A..:?  "icon_color"
        web_app_placeholder_          <- o A..:?  "web_app_placeholder"
        pure $ AttachmentMenuBot
          { bot_user_id                  = bot_user_id_
          , supports_self_chat           = supports_self_chat_
          , supports_user_chats          = supports_user_chats_
          , supports_bot_chats           = supports_bot_chats_
          , supports_group_chats         = supports_group_chats_
          , supports_channel_chats       = supports_channel_chats_
          , request_write_access         = request_write_access_
          , is_added                     = is_added_
          , show_in_attachment_menu      = show_in_attachment_menu_
          , show_in_side_menu            = show_in_side_menu_
          , show_disclaimer_in_side_menu = show_disclaimer_in_side_menu_
          , name                         = name_
          , name_color                   = name_color_
          , default_icon                 = default_icon_
          , ios_static_icon              = ios_static_icon_
          , ios_animated_icon            = ios_animated_icon_
          , ios_side_menu_icon           = ios_side_menu_icon_
          , android_icon                 = android_icon_
          , android_side_menu_icon       = android_side_menu_icon_
          , macos_icon                   = macos_icon_
          , macos_side_menu_icon         = macos_side_menu_icon_
          , icon_color                   = icon_color_
          , web_app_placeholder          = web_app_placeholder_
          }
  parseJSON _ = mempty

