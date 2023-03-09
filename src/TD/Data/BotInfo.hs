{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BotInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.BotCommand as BotCommand
import qualified TD.Data.BotMenuButton as BotMenuButton
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.Photo as Photo
import qualified Utils as U

-- |
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
    -- | Animation shown in the chat with the bot if the chat is empty; may be null
    animation :: Maybe Animation.Animation,
    -- | Photo shown in the chat with the bot if the chat is empty; may be null
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- | The text that is shown on the bot's profile page and is sent together with the link when users share the bot
    short_description :: Maybe String
  }
  deriving (Eq)

instance Show BotInfo where
  show
    BotInfo
      { default_channel_administrator_rights = default_channel_administrator_rights_,
        default_group_administrator_rights = default_group_administrator_rights_,
        commands = commands_,
        menu_button = menu_button_,
        animation = animation_,
        photo = photo_,
        description = description_,
        short_description = short_description_
      } =
      "BotInfo"
        ++ U.cc
          [ U.p "default_channel_administrator_rights" default_channel_administrator_rights_,
            U.p "default_group_administrator_rights" default_group_administrator_rights_,
            U.p "commands" commands_,
            U.p "menu_button" menu_button_,
            U.p "animation" animation_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "short_description" short_description_
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
        animation_ <- o A..:? "animation"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        short_description_ <- o A..:? "short_description"
        return $ BotInfo {default_channel_administrator_rights = default_channel_administrator_rights_, default_group_administrator_rights = default_group_administrator_rights_, commands = commands_, menu_button = menu_button_, animation = animation_, photo = photo_, description = description_, short_description = short_description_}
  parseJSON _ = mempty

instance T.ToJSON BotInfo where
  toJSON
    BotInfo
      { default_channel_administrator_rights = default_channel_administrator_rights_,
        default_group_administrator_rights = default_group_administrator_rights_,
        commands = commands_,
        menu_button = menu_button_,
        animation = animation_,
        photo = photo_,
        description = description_,
        short_description = short_description_
      } =
      A.object
        [ "@type" A..= T.String "botInfo",
          "default_channel_administrator_rights" A..= default_channel_administrator_rights_,
          "default_group_administrator_rights" A..= default_group_administrator_rights_,
          "commands" A..= commands_,
          "menu_button" A..= menu_button_,
          "animation" A..= animation_,
          "photo" A..= photo_,
          "description" A..= description_,
          "short_description" A..= short_description_
        ]
