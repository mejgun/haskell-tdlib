module TD.Data.ThemeSettings
  (ThemeSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Background as Background
import qualified TD.Data.BackgroundFill as BackgroundFill

data ThemeSettings
  = ThemeSettings -- ^ Describes theme settings
    { accent_color                  :: Maybe Int                           -- ^ Theme accent color in ARGB format
    , background                    :: Maybe Background.Background         -- ^ The background to be used in chats; may be null
    , outgoing_message_fill         :: Maybe BackgroundFill.BackgroundFill -- ^ The fill to be used as a background for outgoing messages
    , animate_outgoing_message_fill :: Maybe Bool                          -- ^ If true, the freeform gradient fill needs to be animated on every sent message
    , outgoing_message_accent_color :: Maybe Int                           -- ^ Accent color of outgoing messages in ARGB format
    }
  deriving (Eq, Show)

instance I.ShortShow ThemeSettings where
  shortShow ThemeSettings
    { accent_color                  = accent_color_
    , background                    = background_
    , outgoing_message_fill         = outgoing_message_fill_
    , animate_outgoing_message_fill = animate_outgoing_message_fill_
    , outgoing_message_accent_color = outgoing_message_accent_color_
    }
      = "ThemeSettings"
        ++ I.cc
        [ "accent_color"                  `I.p` accent_color_
        , "background"                    `I.p` background_
        , "outgoing_message_fill"         `I.p` outgoing_message_fill_
        , "animate_outgoing_message_fill" `I.p` animate_outgoing_message_fill_
        , "outgoing_message_accent_color" `I.p` outgoing_message_accent_color_
        ]

instance AT.FromJSON ThemeSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "themeSettings" -> parseThemeSettings v
      _               -> mempty
    
    where
      parseThemeSettings :: A.Value -> AT.Parser ThemeSettings
      parseThemeSettings = A.withObject "ThemeSettings" $ \o -> do
        accent_color_                  <- o A..:?  "accent_color"
        background_                    <- o A..:?  "background"
        outgoing_message_fill_         <- o A..:?  "outgoing_message_fill"
        animate_outgoing_message_fill_ <- o A..:?  "animate_outgoing_message_fill"
        outgoing_message_accent_color_ <- o A..:?  "outgoing_message_accent_color"
        pure $ ThemeSettings
          { accent_color                  = accent_color_
          , background                    = background_
          , outgoing_message_fill         = outgoing_message_fill_
          , animate_outgoing_message_fill = animate_outgoing_message_fill_
          , outgoing_message_accent_color = outgoing_message_accent_color_
          }
  parseJSON _ = mempty

