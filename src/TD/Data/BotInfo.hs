{-# LANGUAGE OverloadedStrings #-}

module TD.Data.BotInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommand as BotCommand
import qualified TD.Data.BotMenuButton as BotMenuButton
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified Utils as U

data BotInfo = -- | Contains information about a bot
  BotInfo
  { -- | Default administrator rights for adding the bot to channels; may be null
    default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
    -- | Default administrator rights for adding the bot to basic group and supergroup chats; may be null
    default_group_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
    -- | List of the bot commands
    commands :: Maybe [BotCommand.BotCommand],
    -- | Information about a button to show instead of the bot commands menu button; may be null if ordinary bot commands menu must be shown
    menu_button :: Maybe BotMenuButton.BotMenuButton,
    -- |
    description :: Maybe String,
    -- | The text that is shown on the bot's profile page and is sent together with the link when users share the bot
    share_text :: Maybe String
  }
  deriving (Eq)

instance Show BotInfo where
  show
    BotInfo
      { default_channel_administrator_rights = default_channel_administrator_rights,
        default_group_administrator_rights = default_group_administrator_rights,
        commands = commands,
        menu_button = menu_button,
        description = description,
        share_text = share_text
      } =
      "BotInfo"
        ++ U.cc
          [ U.p "default_channel_administrator_rights" default_channel_administrator_rights,
            U.p "default_group_administrator_rights" default_group_administrator_rights,
            U.p "commands" commands,
            U.p "menu_button" menu_button,
            U.p "description" description,
            U.p "share_text" share_text
          ]

instance T.FromJSON BotInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botInfo" -> parseBotInfo v
      _ -> mempty
    where
      parseBotInfo :: A.Value -> T.Parser BotInfo
      parseBotInfo = A.withObject "BotInfo" $ \o -> do
        default_channel_administrator_rights_ <- o A..:? "default_channel_administrator_rights"
        default_group_administrator_rights_ <- o A..:? "default_group_administrator_rights"
        commands_ <- o A..:? "commands"
        menu_button_ <- o A..:? "menu_button"
        description_ <- o A..:? "description"
        share_text_ <- o A..:? "share_text"
        return $ BotInfo {default_channel_administrator_rights = default_channel_administrator_rights_, default_group_administrator_rights = default_group_administrator_rights_, commands = commands_, menu_button = menu_button_, description = description_, share_text = share_text_}
  parseJSON _ = mempty

instance T.ToJSON BotInfo where
  toJSON
    BotInfo
      { default_channel_administrator_rights = default_channel_administrator_rights,
        default_group_administrator_rights = default_group_administrator_rights,
        commands = commands,
        menu_button = menu_button,
        description = description,
        share_text = share_text
      } =
      A.object
        [ "@type" A..= T.String "botInfo",
          "default_channel_administrator_rights" A..= default_channel_administrator_rights,
          "default_group_administrator_rights" A..= default_group_administrator_rights,
          "commands" A..= commands,
          "menu_button" A..= menu_button,
          "description" A..= description,
          "share_text" A..= share_text
        ]
