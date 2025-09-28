module TD.Data.InputChatTheme
  (InputChatTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a chat theme to set
data InputChatTheme
  = InputChatThemeEmoji -- ^ A theme based on an emoji
    { name :: Maybe T.Text -- ^ Name of the theme
    }
  | InputChatThemeGift -- ^ A theme based on an upgraded gift
    { name :: Maybe T.Text -- ^ Name of the upgraded gift. A gift can be used only in one chat in a time. When the same gift is used in another chat, theme in the previous chat is reset to default
    }
  deriving (Eq, Show)

instance I.ShortShow InputChatTheme where
  shortShow InputChatThemeEmoji
    { name = name_
    }
      = "InputChatThemeEmoji"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow InputChatThemeGift
    { name = name_
    }
      = "InputChatThemeGift"
        ++ I.cc
        [ "name" `I.p` name_
        ]

instance AT.FromJSON InputChatTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputChatThemeEmoji" -> parseInputChatThemeEmoji v
      "inputChatThemeGift"  -> parseInputChatThemeGift v
      _                     -> mempty
    
    where
      parseInputChatThemeEmoji :: A.Value -> AT.Parser InputChatTheme
      parseInputChatThemeEmoji = A.withObject "InputChatThemeEmoji" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ InputChatThemeEmoji
          { name = name_
          }
      parseInputChatThemeGift :: A.Value -> AT.Parser InputChatTheme
      parseInputChatThemeGift = A.withObject "InputChatThemeGift" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ InputChatThemeGift
          { name = name_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputChatTheme where
  toJSON InputChatThemeEmoji
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "inputChatThemeEmoji"
        , "name"  A..= name_
        ]
  toJSON InputChatThemeGift
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "inputChatThemeGift"
        , "name"  A..= name_
        ]

