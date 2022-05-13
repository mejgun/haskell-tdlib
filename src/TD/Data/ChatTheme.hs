{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatTheme where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeSettings as ThemeSettings
import qualified Utils as U

data ChatTheme = -- | Describes a chat theme
  ChatTheme
  { -- | Theme settings for a dark chat theme
    dark_settings :: Maybe ThemeSettings.ThemeSettings,
    -- | Theme settings for a light chat theme
    light_settings :: Maybe ThemeSettings.ThemeSettings,
    -- | Theme name
    name :: Maybe String
  }
  deriving (Eq)

instance Show ChatTheme where
  show
    ChatTheme
      { dark_settings = dark_settings_,
        light_settings = light_settings_,
        name = name_
      } =
      "ChatTheme"
        ++ U.cc
          [ U.p "dark_settings" dark_settings_,
            U.p "light_settings" light_settings_,
            U.p "name" name_
          ]

instance T.FromJSON ChatTheme where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatTheme" -> parseChatTheme v
      _ -> mempty
    where
      parseChatTheme :: A.Value -> T.Parser ChatTheme
      parseChatTheme = A.withObject "ChatTheme" $ \o -> do
        dark_settings_ <- o A..:? "dark_settings"
        light_settings_ <- o A..:? "light_settings"
        name_ <- o A..:? "name"
        return $ ChatTheme {dark_settings = dark_settings_, light_settings = light_settings_, name = name_}
  parseJSON _ = mempty

instance T.ToJSON ChatTheme where
  toJSON
    ChatTheme
      { dark_settings = dark_settings_,
        light_settings = light_settings_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "chatTheme",
          "dark_settings" A..= dark_settings_,
          "light_settings" A..= light_settings_,
          "name" A..= name_
        ]
