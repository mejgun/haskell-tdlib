module TD.Query.GetCustomEmojiReactionAnimations
  (GetCustomEmojiReactionAnimations(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns TGS stickers with generic animations for custom emoji reactions. Returns 'TD.Data.Stickers.Stickers'
data GetCustomEmojiReactionAnimations
  = GetCustomEmojiReactionAnimations
  deriving (Eq, Show)

instance I.ShortShow GetCustomEmojiReactionAnimations where
  shortShow
    GetCustomEmojiReactionAnimations
        = "GetCustomEmojiReactionAnimations"

instance AT.ToJSON GetCustomEmojiReactionAnimations where
  toJSON
    GetCustomEmojiReactionAnimations
        = A.object
          [ "@type" A..= AT.String "getCustomEmojiReactionAnimations"
          ]

