module TD.Query.GetCustomEmojiReactionAnimations
  (GetCustomEmojiReactionAnimations(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns TGS stickers with generic animations for custom emoji reactions
data GetCustomEmojiReactionAnimations
  = GetCustomEmojiReactionAnimations
  deriving (Eq)

instance Show GetCustomEmojiReactionAnimations where
  show
    GetCustomEmojiReactionAnimations
        = "GetCustomEmojiReactionAnimations"

instance AT.ToJSON GetCustomEmojiReactionAnimations where
  toJSON
    GetCustomEmojiReactionAnimations
        = A.object
          [ "@type" A..= AT.String "getCustomEmojiReactionAnimations"
          ]

