{-# LANGUAGE OverloadedStrings #-}

module TD.Data.AttachmentMenuBot where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Data.File as File
import qualified Utils as U

data AttachmentMenuBot = -- | Represents a bot added to attachment menu
  AttachmentMenuBot
  { -- | Color to highlight selected icon of the bot if appropriate; may be null
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
    -- | User identifier of the bot added to attachment menu
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show AttachmentMenuBot where
  show
    AttachmentMenuBot
      { icon_color = icon_color,
        macos_icon = macos_icon,
        android_icon = android_icon,
        ios_animated_icon = ios_animated_icon,
        ios_static_icon = ios_static_icon,
        default_icon = default_icon,
        name_color = name_color,
        name = name,
        bot_user_id = bot_user_id
      } =
      "AttachmentMenuBot"
        ++ U.cc
          [ U.p "icon_color" icon_color,
            U.p "macos_icon" macos_icon,
            U.p "android_icon" android_icon,
            U.p "ios_animated_icon" ios_animated_icon,
            U.p "ios_static_icon" ios_static_icon,
            U.p "default_icon" default_icon,
            U.p "name_color" name_color,
            U.p "name" name,
            U.p "bot_user_id" bot_user_id
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
        icon_color_ <- o A..:? "icon_color"
        macos_icon_ <- o A..:? "macos_icon"
        android_icon_ <- o A..:? "android_icon"
        ios_animated_icon_ <- o A..:? "ios_animated_icon"
        ios_static_icon_ <- o A..:? "ios_static_icon"
        default_icon_ <- o A..:? "default_icon"
        name_color_ <- o A..:? "name_color"
        name_ <- o A..:? "name"
        bot_user_id_ <- mconcat [o A..:? "bot_user_id", U.rm <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ AttachmentMenuBot {icon_color = icon_color_, macos_icon = macos_icon_, android_icon = android_icon_, ios_animated_icon = ios_animated_icon_, ios_static_icon = ios_static_icon_, default_icon = default_icon_, name_color = name_color_, name = name_, bot_user_id = bot_user_id_}
  parseJSON _ = mempty

instance T.ToJSON AttachmentMenuBot where
  toJSON
    AttachmentMenuBot
      { icon_color = icon_color,
        macos_icon = macos_icon,
        android_icon = android_icon,
        ios_animated_icon = ios_animated_icon,
        ios_static_icon = ios_static_icon,
        default_icon = default_icon,
        name_color = name_color,
        name = name,
        bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "attachmentMenuBot",
          "icon_color" A..= icon_color,
          "macos_icon" A..= macos_icon,
          "android_icon" A..= android_icon,
          "ios_animated_icon" A..= ios_animated_icon,
          "ios_static_icon" A..= ios_static_icon,
          "default_icon" A..= default_icon,
          "name_color" A..= name_color,
          "name" A..= name,
          "bot_user_id" A..= bot_user_id
        ]
