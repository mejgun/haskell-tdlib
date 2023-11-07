module TD.Query.GetDefaultBackgroundCustomEmojiStickers
  (GetDefaultBackgroundCustomEmojiStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default list of custom emoji stickers for reply background. Returns 'TD.Data.Stickers.Stickers'
data GetDefaultBackgroundCustomEmojiStickers
  = GetDefaultBackgroundCustomEmojiStickers
  deriving (Eq, Show)

instance I.ShortShow GetDefaultBackgroundCustomEmojiStickers where
  shortShow
    GetDefaultBackgroundCustomEmojiStickers
        = "GetDefaultBackgroundCustomEmojiStickers"

instance AT.ToJSON GetDefaultBackgroundCustomEmojiStickers where
  toJSON
    GetDefaultBackgroundCustomEmojiStickers
        = A.object
          [ "@type" A..= AT.String "getDefaultBackgroundCustomEmojiStickers"
          ]

