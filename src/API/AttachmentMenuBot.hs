-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AttachmentMenuBot where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.AttachmentMenuBotColor as AttachmentMenuBotColor

-- |
-- 
-- Represents a bot added to attachment menu
-- 
-- __bot_user_id__ User identifier of the bot added to attachment menu
-- 
-- __name__ Name for the bot in attachment menu
-- 
-- __name_color__ Color to highlight selected name of the bot if appropriate; may be null
-- 
-- __default_icon__ Default attachment menu icon for the bot in SVG format; may be null
-- 
-- __ios_static_icon__ Attachment menu icon for the bot in SVG format for the official iOS app; may be null
-- 
-- __ios_animated_icon__ Attachment menu icon for the bot in TGS format for the official iOS app; may be null
-- 
-- __android_icon__ Attachment menu icon for the bot in TGS format for the official Android app; may be null
-- 
-- __macos_icon__ Attachment menu icon for the bot in TGS format for the official native macOS app; may be null
-- 
-- __icon_color__ Color to highlight selected icon of the bot if appropriate; may be null
data AttachmentMenuBot = 

 AttachmentMenuBot { icon_color :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor, macos_icon :: Maybe File.File, android_icon :: Maybe File.File, ios_animated_icon :: Maybe File.File, ios_static_icon :: Maybe File.File, default_icon :: Maybe File.File, name_color :: Maybe AttachmentMenuBotColor.AttachmentMenuBotColor, name :: Maybe String, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show AttachmentMenuBot where
 show AttachmentMenuBot { icon_color=icon_color, macos_icon=macos_icon, android_icon=android_icon, ios_animated_icon=ios_animated_icon, ios_static_icon=ios_static_icon, default_icon=default_icon, name_color=name_color, name=name, bot_user_id=bot_user_id } =
  "AttachmentMenuBot" ++ U.cc [U.p "icon_color" icon_color, U.p "macos_icon" macos_icon, U.p "android_icon" android_icon, U.p "ios_animated_icon" ios_animated_icon, U.p "ios_static_icon" ios_static_icon, U.p "default_icon" default_icon, U.p "name_color" name_color, U.p "name" name, U.p "bot_user_id" bot_user_id ]

instance T.ToJSON AttachmentMenuBot where
 toJSON AttachmentMenuBot { icon_color = icon_color, macos_icon = macos_icon, android_icon = android_icon, ios_animated_icon = ios_animated_icon, ios_static_icon = ios_static_icon, default_icon = default_icon, name_color = name_color, name = name, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "attachmentMenuBot", "icon_color" A..= icon_color, "macos_icon" A..= macos_icon, "android_icon" A..= android_icon, "ios_animated_icon" A..= ios_animated_icon, "ios_static_icon" A..= ios_static_icon, "default_icon" A..= default_icon, "name_color" A..= name_color, "name" A..= name, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON AttachmentMenuBot where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "attachmentMenuBot" -> parseAttachmentMenuBot v
   _ -> mempty
  where
   parseAttachmentMenuBot :: A.Value -> T.Parser AttachmentMenuBot
   parseAttachmentMenuBot = A.withObject "AttachmentMenuBot" $ \o -> do
    icon_color <- o A..:? "icon_color"
    macos_icon <- o A..:? "macos_icon"
    android_icon <- o A..:? "android_icon"
    ios_animated_icon <- o A..:? "ios_animated_icon"
    ios_static_icon <- o A..:? "ios_static_icon"
    default_icon <- o A..:? "default_icon"
    name_color <- o A..:? "name_color"
    name <- o A..:? "name"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AttachmentMenuBot { icon_color = icon_color, macos_icon = macos_icon, android_icon = android_icon, ios_animated_icon = ios_animated_icon, ios_static_icon = ios_static_icon, default_icon = default_icon, name_color = name_color, name = name, bot_user_id = bot_user_id }
 parseJSON _ = mempty
