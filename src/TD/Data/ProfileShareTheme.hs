module TD.Data.ProfileShareTheme
  (ProfileShareTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiType as EmojiType
import qualified TD.Data.UpgradedGift as UpgradedGift

-- | Describes a theme of the screen for sharing a link to a user or a chat
data ProfileShareTheme
  = ProfileShareThemeEmoji -- ^ A theme with emoji placed on a background
    { emojis                 :: Maybe [EmojiType.EmojiType] -- ^ The emoji; 0-6 regular or custom emoji. If empty, then use_default_background is false
    , use_default_background :: Maybe Bool                  -- ^ True, if the default background is used; otherwise, the backdrop with identifier background_backdrop_id is used as background
    , background_backdrop_id :: Maybe Int                   -- ^ Identifier of the backdrop used as background; must be ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get details about the backdrop
    }
  | ProfileShareThemeUpgradedGift -- ^ A theme based on an upgraded gift owned by the user or the chat
    { gift :: Maybe UpgradedGift.UpgradedGift -- ^ The upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileShareTheme where
  shortShow ProfileShareThemeEmoji
    { emojis                 = emojis_
    , use_default_background = use_default_background_
    , background_backdrop_id = background_backdrop_id_
    }
      = "ProfileShareThemeEmoji"
        ++ I.cc
        [ "emojis"                 `I.p` emojis_
        , "use_default_background" `I.p` use_default_background_
        , "background_backdrop_id" `I.p` background_backdrop_id_
        ]
  shortShow ProfileShareThemeUpgradedGift
    { gift = gift_
    }
      = "ProfileShareThemeUpgradedGift"
        ++ I.cc
        [ "gift" `I.p` gift_
        ]

instance AT.FromJSON ProfileShareTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileShareThemeEmoji"        -> parseProfileShareThemeEmoji v
      "profileShareThemeUpgradedGift" -> parseProfileShareThemeUpgradedGift v
      _                               -> mempty
    
    where
      parseProfileShareThemeEmoji :: A.Value -> AT.Parser ProfileShareTheme
      parseProfileShareThemeEmoji = A.withObject "ProfileShareThemeEmoji" $ \o -> do
        emojis_                 <- o A..:?  "emojis"
        use_default_background_ <- o A..:?  "use_default_background"
        background_backdrop_id_ <- o A..:?  "background_backdrop_id"
        pure $ ProfileShareThemeEmoji
          { emojis                 = emojis_
          , use_default_background = use_default_background_
          , background_backdrop_id = background_backdrop_id_
          }
      parseProfileShareThemeUpgradedGift :: A.Value -> AT.Parser ProfileShareTheme
      parseProfileShareThemeUpgradedGift = A.withObject "ProfileShareThemeUpgradedGift" $ \o -> do
        gift_ <- o A..:?  "gift"
        pure $ ProfileShareThemeUpgradedGift
          { gift = gift_
          }
  parseJSON _ = mempty

