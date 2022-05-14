{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ThemeSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Background as Background
import qualified TD.Data.BackgroundFill as BackgroundFill
import qualified Utils as U

-- |
data ThemeSettings = -- | Describes theme settings
  ThemeSettings
  { -- | Accent color of outgoing messages in ARGB format
    outgoing_message_accent_color :: Maybe Int,
    -- | If true, the freeform gradient fill needs to be animated on every sent message
    animate_outgoing_message_fill :: Maybe Bool,
    -- | The fill to be used as a background for outgoing messages
    outgoing_message_fill :: Maybe BackgroundFill.BackgroundFill,
    -- | The background to be used in chats; may be null
    background :: Maybe Background.Background,
    -- | Theme accent color in ARGB format
    accent_color :: Maybe Int
  }
  deriving (Eq)

instance Show ThemeSettings where
  show
    ThemeSettings
      { outgoing_message_accent_color = outgoing_message_accent_color_,
        animate_outgoing_message_fill = animate_outgoing_message_fill_,
        outgoing_message_fill = outgoing_message_fill_,
        background = background_,
        accent_color = accent_color_
      } =
      "ThemeSettings"
        ++ U.cc
          [ U.p "outgoing_message_accent_color" outgoing_message_accent_color_,
            U.p "animate_outgoing_message_fill" animate_outgoing_message_fill_,
            U.p "outgoing_message_fill" outgoing_message_fill_,
            U.p "background" background_,
            U.p "accent_color" accent_color_
          ]

instance T.FromJSON ThemeSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "themeSettings" -> parseThemeSettings v
      _ -> mempty
    where
      parseThemeSettings :: A.Value -> T.Parser ThemeSettings
      parseThemeSettings = A.withObject "ThemeSettings" $ \o -> do
        outgoing_message_accent_color_ <- mconcat [o A..:? "outgoing_message_accent_color", U.rm <$> (o A..: "outgoing_message_accent_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        animate_outgoing_message_fill_ <- o A..:? "animate_outgoing_message_fill"
        outgoing_message_fill_ <- o A..:? "outgoing_message_fill"
        background_ <- o A..:? "background"
        accent_color_ <- mconcat [o A..:? "accent_color", U.rm <$> (o A..: "accent_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ThemeSettings {outgoing_message_accent_color = outgoing_message_accent_color_, animate_outgoing_message_fill = animate_outgoing_message_fill_, outgoing_message_fill = outgoing_message_fill_, background = background_, accent_color = accent_color_}
  parseJSON _ = mempty

instance T.ToJSON ThemeSettings where
  toJSON
    ThemeSettings
      { outgoing_message_accent_color = outgoing_message_accent_color_,
        animate_outgoing_message_fill = animate_outgoing_message_fill_,
        outgoing_message_fill = outgoing_message_fill_,
        background = background_,
        accent_color = accent_color_
      } =
      A.object
        [ "@type" A..= T.String "themeSettings",
          "outgoing_message_accent_color" A..= outgoing_message_accent_color_,
          "animate_outgoing_message_fill" A..= animate_outgoing_message_fill_,
          "outgoing_message_fill" A..= outgoing_message_fill_,
          "background" A..= background_,
          "accent_color" A..= accent_color_
        ]
