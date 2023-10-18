module TD.Query.GetDefaultProfilePhotoCustomEmojiStickers
  (GetDefaultProfilePhotoCustomEmojiStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default list of custom emoji stickers for placing on a profile photo. Returns 'TD.Data.Stickers.Stickers'
data GetDefaultProfilePhotoCustomEmojiStickers
  = GetDefaultProfilePhotoCustomEmojiStickers
  deriving (Eq, Show)

instance I.ShortShow GetDefaultProfilePhotoCustomEmojiStickers where
  shortShow
    GetDefaultProfilePhotoCustomEmojiStickers
        = "GetDefaultProfilePhotoCustomEmojiStickers"

instance AT.ToJSON GetDefaultProfilePhotoCustomEmojiStickers where
  toJSON
    GetDefaultProfilePhotoCustomEmojiStickers
        = A.object
          [ "@type" A..= AT.String "getDefaultProfilePhotoCustomEmojiStickers"
          ]

