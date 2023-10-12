module TD.Query.GetCustomEmojiReactionAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetCustomEmojiReactionAnimations -- ^ Returns TGS stickers with generic animations for custom emoji reactions
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
