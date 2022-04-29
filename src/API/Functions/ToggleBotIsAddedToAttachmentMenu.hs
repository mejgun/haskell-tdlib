-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleBotIsAddedToAttachmentMenu where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Adds or removes a bot to attachment menu. Bot can be added to attachment menu, only if userTypeBot.can_be_added_to_attachment_menu == true 
-- 
-- __bot_user_id__ Bot's user identifier
-- 
-- __is_added__ Pass true to add the bot to attachment menu; pass false to remove the bot from attachment menu
data ToggleBotIsAddedToAttachmentMenu = 

 ToggleBotIsAddedToAttachmentMenu { is_added :: Maybe Bool, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show ToggleBotIsAddedToAttachmentMenu where
 show ToggleBotIsAddedToAttachmentMenu { is_added=is_added, bot_user_id=bot_user_id } =
  "ToggleBotIsAddedToAttachmentMenu" ++ cc [p "is_added" is_added, p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleBotIsAddedToAttachmentMenu where
 toJSON ToggleBotIsAddedToAttachmentMenu { is_added = is_added, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "toggleBotIsAddedToAttachmentMenu", "is_added" A..= is_added, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON ToggleBotIsAddedToAttachmentMenu where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleBotIsAddedToAttachmentMenu" -> parseToggleBotIsAddedToAttachmentMenu v
   _ -> mempty
  where
   parseToggleBotIsAddedToAttachmentMenu :: A.Value -> T.Parser ToggleBotIsAddedToAttachmentMenu
   parseToggleBotIsAddedToAttachmentMenu = A.withObject "ToggleBotIsAddedToAttachmentMenu" $ \o -> do
    is_added <- o A..:? "is_added"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleBotIsAddedToAttachmentMenu { is_added = is_added, bot_user_id = bot_user_id }
 parseJSON _ = mempty
