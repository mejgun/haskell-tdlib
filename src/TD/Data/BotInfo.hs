module TD.Data.BotInfo
  (BotInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Animation as Animation
import qualified TD.Data.BotMenuButton as BotMenuButton
import qualified TD.Data.BotCommand as BotCommand
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.AffiliateProgramInfo as AffiliateProgramInfo
import qualified TD.Data.InternalLinkType as InternalLinkType

data BotInfo
  = BotInfo -- ^ Contains information about a bot
    { short_description                    :: Maybe T.Text                                          -- ^ The text that is shown on the bot's profile page and is sent together with the link when users share the bot
    , description                          :: Maybe T.Text                                          -- ^ The text shown in the chat with the bot if the chat is empty
    , photo                                :: Maybe Photo.Photo                                     -- ^ Photo shown in the chat with the bot if the chat is empty; may be null
    , animation                            :: Maybe Animation.Animation                             -- ^ Animation shown in the chat with the bot if the chat is empty; may be null
    , menu_button                          :: Maybe BotMenuButton.BotMenuButton                     -- ^ Information about a button to show instead of the bot commands menu button; may be null if ordinary bot commands menu must be shown
    , commands                             :: Maybe [BotCommand.BotCommand]                         -- ^ List of the bot commands
    , privacy_policy_url                   :: Maybe T.Text                                          -- ^ The HTTP link to the privacy policy of the bot. If empty, then /privacy command must be used if supported by the bot. If the command isn't supported, then https://telegram.org/privacy-tpa must be opened
    , default_group_administrator_rights   :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Default administrator rights for adding the bot to basic group and supergroup chats; may be null
    , default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Default administrator rights for adding the bot to channels; may be null
    , affiliate_program                    :: Maybe AffiliateProgramInfo.AffiliateProgramInfo       -- ^ Information about the affiliate program of the bot; may be null if none
    , web_app_background_light_color       :: Maybe Int                                             -- ^ Default light background color for bot Web Apps; -1 if not specified
    , web_app_background_dark_color        :: Maybe Int                                             -- ^ Default dark background color for bot Web Apps; -1 if not specified
    , web_app_header_light_color           :: Maybe Int                                             -- ^ Default light header color for bot Web Apps; -1 if not specified
    , web_app_header_dark_color            :: Maybe Int                                             -- ^ Default dark header color for bot Web Apps; -1 if not specified
    , can_get_revenue_statistics           :: Maybe Bool                                            -- ^ True, if the bot's revenue statistics are available to the current user
    , can_manage_emoji_status              :: Maybe Bool                                            -- ^ True, if the bot can manage emoji status of the current user
    , has_media_previews                   :: Maybe Bool                                            -- ^ True, if the bot has media previews
    , edit_commands_link                   :: Maybe InternalLinkType.InternalLinkType               -- ^ The internal link, which can be used to edit bot commands; may be null
    , edit_description_link                :: Maybe InternalLinkType.InternalLinkType               -- ^ The internal link, which can be used to edit bot description; may be null
    , edit_description_media_link          :: Maybe InternalLinkType.InternalLinkType               -- ^ The internal link, which can be used to edit the photo or animation shown in the chat with the bot if the chat is empty; may be null
    , edit_settings_link                   :: Maybe InternalLinkType.InternalLinkType               -- ^ The internal link, which can be used to edit bot settings; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow BotInfo where
  shortShow BotInfo
    { short_description                    = short_description_
    , description                          = description_
    , photo                                = photo_
    , animation                            = animation_
    , menu_button                          = menu_button_
    , commands                             = commands_
    , privacy_policy_url                   = privacy_policy_url_
    , default_group_administrator_rights   = default_group_administrator_rights_
    , default_channel_administrator_rights = default_channel_administrator_rights_
    , affiliate_program                    = affiliate_program_
    , web_app_background_light_color       = web_app_background_light_color_
    , web_app_background_dark_color        = web_app_background_dark_color_
    , web_app_header_light_color           = web_app_header_light_color_
    , web_app_header_dark_color            = web_app_header_dark_color_
    , can_get_revenue_statistics           = can_get_revenue_statistics_
    , can_manage_emoji_status              = can_manage_emoji_status_
    , has_media_previews                   = has_media_previews_
    , edit_commands_link                   = edit_commands_link_
    , edit_description_link                = edit_description_link_
    , edit_description_media_link          = edit_description_media_link_
    , edit_settings_link                   = edit_settings_link_
    }
      = "BotInfo"
        ++ I.cc
        [ "short_description"                    `I.p` short_description_
        , "description"                          `I.p` description_
        , "photo"                                `I.p` photo_
        , "animation"                            `I.p` animation_
        , "menu_button"                          `I.p` menu_button_
        , "commands"                             `I.p` commands_
        , "privacy_policy_url"                   `I.p` privacy_policy_url_
        , "default_group_administrator_rights"   `I.p` default_group_administrator_rights_
        , "default_channel_administrator_rights" `I.p` default_channel_administrator_rights_
        , "affiliate_program"                    `I.p` affiliate_program_
        , "web_app_background_light_color"       `I.p` web_app_background_light_color_
        , "web_app_background_dark_color"        `I.p` web_app_background_dark_color_
        , "web_app_header_light_color"           `I.p` web_app_header_light_color_
        , "web_app_header_dark_color"            `I.p` web_app_header_dark_color_
        , "can_get_revenue_statistics"           `I.p` can_get_revenue_statistics_
        , "can_manage_emoji_status"              `I.p` can_manage_emoji_status_
        , "has_media_previews"                   `I.p` has_media_previews_
        , "edit_commands_link"                   `I.p` edit_commands_link_
        , "edit_description_link"                `I.p` edit_description_link_
        , "edit_description_media_link"          `I.p` edit_description_media_link_
        , "edit_settings_link"                   `I.p` edit_settings_link_
        ]

instance AT.FromJSON BotInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botInfo" -> parseBotInfo v
      _         -> mempty
    
    where
      parseBotInfo :: A.Value -> AT.Parser BotInfo
      parseBotInfo = A.withObject "BotInfo" $ \o -> do
        short_description_                    <- o A..:?  "short_description"
        description_                          <- o A..:?  "description"
        photo_                                <- o A..:?  "photo"
        animation_                            <- o A..:?  "animation"
        menu_button_                          <- o A..:?  "menu_button"
        commands_                             <- o A..:?  "commands"
        privacy_policy_url_                   <- o A..:?  "privacy_policy_url"
        default_group_administrator_rights_   <- o A..:?  "default_group_administrator_rights"
        default_channel_administrator_rights_ <- o A..:?  "default_channel_administrator_rights"
        affiliate_program_                    <- o A..:?  "affiliate_program"
        web_app_background_light_color_       <- o A..:?  "web_app_background_light_color"
        web_app_background_dark_color_        <- o A..:?  "web_app_background_dark_color"
        web_app_header_light_color_           <- o A..:?  "web_app_header_light_color"
        web_app_header_dark_color_            <- o A..:?  "web_app_header_dark_color"
        can_get_revenue_statistics_           <- o A..:?  "can_get_revenue_statistics"
        can_manage_emoji_status_              <- o A..:?  "can_manage_emoji_status"
        has_media_previews_                   <- o A..:?  "has_media_previews"
        edit_commands_link_                   <- o A..:?  "edit_commands_link"
        edit_description_link_                <- o A..:?  "edit_description_link"
        edit_description_media_link_          <- o A..:?  "edit_description_media_link"
        edit_settings_link_                   <- o A..:?  "edit_settings_link"
        pure $ BotInfo
          { short_description                    = short_description_
          , description                          = description_
          , photo                                = photo_
          , animation                            = animation_
          , menu_button                          = menu_button_
          , commands                             = commands_
          , privacy_policy_url                   = privacy_policy_url_
          , default_group_administrator_rights   = default_group_administrator_rights_
          , default_channel_administrator_rights = default_channel_administrator_rights_
          , affiliate_program                    = affiliate_program_
          , web_app_background_light_color       = web_app_background_light_color_
          , web_app_background_dark_color        = web_app_background_dark_color_
          , web_app_header_light_color           = web_app_header_light_color_
          , web_app_header_dark_color            = web_app_header_dark_color_
          , can_get_revenue_statistics           = can_get_revenue_statistics_
          , can_manage_emoji_status              = can_manage_emoji_status_
          , has_media_previews                   = has_media_previews_
          , edit_commands_link                   = edit_commands_link_
          , edit_description_link                = edit_description_link_
          , edit_description_media_link          = edit_description_media_link_
          , edit_settings_link                   = edit_settings_link_
          }
  parseJSON _ = mempty

