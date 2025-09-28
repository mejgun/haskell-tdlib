module TD.Data.ChatTheme
  (ChatTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.GiftChatTheme as GiftChatTheme

-- | Describes a chat theme
data ChatTheme
  = ChatThemeEmoji -- ^ A chat theme based on an emoji
    { name :: Maybe T.Text -- ^ Name of the theme; full theme description is received through updateEmojiChatThemes
    }
  | ChatThemeGift -- ^ A chat theme based on an upgraded gift
    { gift_theme :: Maybe GiftChatTheme.GiftChatTheme -- ^ The chat theme
    }
  deriving (Eq, Show)

instance I.ShortShow ChatTheme where
  shortShow ChatThemeEmoji
    { name = name_
    }
      = "ChatThemeEmoji"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow ChatThemeGift
    { gift_theme = gift_theme_
    }
      = "ChatThemeGift"
        ++ I.cc
        [ "gift_theme" `I.p` gift_theme_
        ]

instance AT.FromJSON ChatTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatThemeEmoji" -> parseChatThemeEmoji v
      "chatThemeGift"  -> parseChatThemeGift v
      _                -> mempty
    
    where
      parseChatThemeEmoji :: A.Value -> AT.Parser ChatTheme
      parseChatThemeEmoji = A.withObject "ChatThemeEmoji" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ ChatThemeEmoji
          { name = name_
          }
      parseChatThemeGift :: A.Value -> AT.Parser ChatTheme
      parseChatThemeGift = A.withObject "ChatThemeGift" $ \o -> do
        gift_theme_ <- o A..:?  "gift_theme"
        pure $ ChatThemeGift
          { gift_theme = gift_theme_
          }
  parseJSON _ = mempty

