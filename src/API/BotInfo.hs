-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatAdministratorRights as ChatAdministratorRights
import {-# SOURCE #-} qualified API.BotCommand as BotCommand
import {-# SOURCE #-} qualified API.BotMenuButton as BotMenuButton

-- |
-- 
-- Contains information about a bot
-- 
-- __share_text__ The text that is shown on the bot's profile page and is sent together with the link when users share the bot
-- 
-- __param_description__ The text shown in the chat with the bot if the chat is empty
-- 
-- __menu_button__ Information about a button to show instead of the bot commands menu button; may be null if ordinary bot commands menu must be shown
-- 
-- __commands__ List of the bot commands
-- 
-- __default_group_administrator_rights__ Default administrator rights for adding the bot to basic group and supergroup chats; may be null
-- 
-- __default_channel_administrator_rights__ Default administrator rights for adding the bot to channels; may be null
data BotInfo = 

 BotInfo { default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights, default_group_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights, commands :: Maybe [BotCommand.BotCommand], menu_button :: Maybe BotMenuButton.BotMenuButton, description :: Maybe String, share_text :: Maybe String }  deriving (Eq)

instance Show BotInfo where
 show BotInfo { default_channel_administrator_rights=default_channel_administrator_rights, default_group_administrator_rights=default_group_administrator_rights, commands=commands, menu_button=menu_button, description=description, share_text=share_text } =
  "BotInfo" ++ cc [p "default_channel_administrator_rights" default_channel_administrator_rights, p "default_group_administrator_rights" default_group_administrator_rights, p "commands" commands, p "menu_button" menu_button, p "description" description, p "share_text" share_text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON BotInfo where
 toJSON BotInfo { default_channel_administrator_rights = default_channel_administrator_rights, default_group_administrator_rights = default_group_administrator_rights, commands = commands, menu_button = menu_button, description = description, share_text = share_text } =
  A.object [ "@type" A..= T.String "botInfo", "default_channel_administrator_rights" A..= default_channel_administrator_rights, "default_group_administrator_rights" A..= default_group_administrator_rights, "commands" A..= commands, "menu_button" A..= menu_button, "description" A..= description, "share_text" A..= share_text ]

instance T.FromJSON BotInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botInfo" -> parseBotInfo v
   _ -> mempty
  where
   parseBotInfo :: A.Value -> T.Parser BotInfo
   parseBotInfo = A.withObject "BotInfo" $ \o -> do
    default_channel_administrator_rights <- o A..:? "default_channel_administrator_rights"
    default_group_administrator_rights <- o A..:? "default_group_administrator_rights"
    commands <- o A..:? "commands"
    menu_button <- o A..:? "menu_button"
    description <- o A..:? "description"
    share_text <- o A..:? "share_text"
    return $ BotInfo { default_channel_administrator_rights = default_channel_administrator_rights, default_group_administrator_rights = default_group_administrator_rights, commands = commands, menu_button = menu_button, description = description, share_text = share_text }
 parseJSON _ = mempty
