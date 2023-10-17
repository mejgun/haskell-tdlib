module TD.Data.ChatTheme
  (ChatTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ThemeSettings as ThemeSettings

data ChatTheme
  = ChatTheme -- ^ Describes a chat theme
    { name           :: Maybe T.Text                      -- ^ Theme name
    , light_settings :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a light chat theme
    , dark_settings  :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a dark chat theme
    }
  deriving (Eq, Show)

instance I.ShortShow ChatTheme where
  shortShow ChatTheme
    { name           = name_
    , light_settings = light_settings_
    , dark_settings  = dark_settings_
    }
      = "ChatTheme"
        ++ I.cc
        [ "name"           `I.p` name_
        , "light_settings" `I.p` light_settings_
        , "dark_settings"  `I.p` dark_settings_
        ]

instance AT.FromJSON ChatTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatTheme" -> parseChatTheme v
      _           -> mempty
    
    where
      parseChatTheme :: A.Value -> AT.Parser ChatTheme
      parseChatTheme = A.withObject "ChatTheme" $ \o -> do
        name_           <- o A..:?  "name"
        light_settings_ <- o A..:?  "light_settings"
        dark_settings_  <- o A..:?  "dark_settings"
        pure $ ChatTheme
          { name           = name_
          , light_settings = light_settings_
          , dark_settings  = dark_settings_
          }
  parseJSON _ = mempty

