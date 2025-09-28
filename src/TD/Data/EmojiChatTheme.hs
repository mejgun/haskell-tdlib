module TD.Data.EmojiChatTheme
  (EmojiChatTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ThemeSettings as ThemeSettings

data EmojiChatTheme
  = EmojiChatTheme -- ^ Describes a chat theme based on an emoji
    { name           :: Maybe T.Text                      -- ^ Theme name
    , light_settings :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a light chat theme
    , dark_settings  :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a dark chat theme
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiChatTheme where
  shortShow EmojiChatTheme
    { name           = name_
    , light_settings = light_settings_
    , dark_settings  = dark_settings_
    }
      = "EmojiChatTheme"
        ++ I.cc
        [ "name"           `I.p` name_
        , "light_settings" `I.p` light_settings_
        , "dark_settings"  `I.p` dark_settings_
        ]

instance AT.FromJSON EmojiChatTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiChatTheme" -> parseEmojiChatTheme v
      _                -> mempty
    
    where
      parseEmojiChatTheme :: A.Value -> AT.Parser EmojiChatTheme
      parseEmojiChatTheme = A.withObject "EmojiChatTheme" $ \o -> do
        name_           <- o A..:?  "name"
        light_settings_ <- o A..:?  "light_settings"
        dark_settings_  <- o A..:?  "dark_settings"
        pure $ EmojiChatTheme
          { name           = name_
          , light_settings = light_settings_
          , dark_settings  = dark_settings_
          }
  parseJSON _ = mempty

