module TD.Data.InputProfileShareTheme
  (InputProfileShareTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiType as EmojiType
import qualified Data.Text as T

-- | Describes a theme of the screen for sharing a link to a user or a chat to be set
data InputProfileShareTheme
  = InputProfileShareThemeEmoji -- ^ A theme with emoji placed on a background
    { emojis                 :: Maybe [EmojiType.EmojiType] -- ^ The emoji; 0-6 regular or custom emoji. If empty, then use_default_background must be false
    , use_default_background :: Maybe Bool                  -- ^ Pass true to use the default background; otherwise, the backdrop with identifier background_backdrop_id will be used as background
    , background_backdrop_id :: Maybe Int                   -- ^ Identifier of the backdrop to be used as background; ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get the list of available backdrops
    }
  | InputProfileShareThemeUpgradedGift -- ^ A theme based on an upgraded gift
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the upgraded gift, which is owned by the user or the chat, for which the theme is set
    }
  deriving (Eq, Show)

instance I.ShortShow InputProfileShareTheme where
  shortShow InputProfileShareThemeEmoji
    { emojis                 = emojis_
    , use_default_background = use_default_background_
    , background_backdrop_id = background_backdrop_id_
    }
      = "InputProfileShareThemeEmoji"
        ++ I.cc
        [ "emojis"                 `I.p` emojis_
        , "use_default_background" `I.p` use_default_background_
        , "background_backdrop_id" `I.p` background_backdrop_id_
        ]
  shortShow InputProfileShareThemeUpgradedGift
    { received_gift_id = received_gift_id_
    }
      = "InputProfileShareThemeUpgradedGift"
        ++ I.cc
        [ "received_gift_id" `I.p` received_gift_id_
        ]

instance AT.FromJSON InputProfileShareTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputProfileShareThemeEmoji"        -> parseInputProfileShareThemeEmoji v
      "inputProfileShareThemeUpgradedGift" -> parseInputProfileShareThemeUpgradedGift v
      _                                    -> mempty
    
    where
      parseInputProfileShareThemeEmoji :: A.Value -> AT.Parser InputProfileShareTheme
      parseInputProfileShareThemeEmoji = A.withObject "InputProfileShareThemeEmoji" $ \o -> do
        emojis_                 <- o A..:?  "emojis"
        use_default_background_ <- o A..:?  "use_default_background"
        background_backdrop_id_ <- o A..:?  "background_backdrop_id"
        pure $ InputProfileShareThemeEmoji
          { emojis                 = emojis_
          , use_default_background = use_default_background_
          , background_backdrop_id = background_backdrop_id_
          }
      parseInputProfileShareThemeUpgradedGift :: A.Value -> AT.Parser InputProfileShareTheme
      parseInputProfileShareThemeUpgradedGift = A.withObject "InputProfileShareThemeUpgradedGift" $ \o -> do
        received_gift_id_ <- o A..:?  "received_gift_id"
        pure $ InputProfileShareThemeUpgradedGift
          { received_gift_id = received_gift_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputProfileShareTheme where
  toJSON InputProfileShareThemeEmoji
    { emojis                 = emojis_
    , use_default_background = use_default_background_
    , background_backdrop_id = background_backdrop_id_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputProfileShareThemeEmoji"
        , "emojis"                 A..= emojis_
        , "use_default_background" A..= use_default_background_
        , "background_backdrop_id" A..= background_backdrop_id_
        ]
  toJSON InputProfileShareThemeUpgradedGift
    { received_gift_id = received_gift_id_
    }
      = A.object
        [ "@type"            A..= AT.String "inputProfileShareThemeUpgradedGift"
        , "received_gift_id" A..= received_gift_id_
        ]

