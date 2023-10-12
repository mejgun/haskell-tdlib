module TD.Query.GetDefaultProfilePhotoCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetDefaultProfilePhotoCustomEmojiStickers -- ^ Returns default list of custom emoji stickers for placing on a profile photo
  = GetDefaultProfilePhotoCustomEmojiStickers
  deriving (Eq)

instance Show GetDefaultProfilePhotoCustomEmojiStickers where
  show
    GetDefaultProfilePhotoCustomEmojiStickers
        = "GetDefaultProfilePhotoCustomEmojiStickers"

instance AT.ToJSON GetDefaultProfilePhotoCustomEmojiStickers where
  toJSON
    GetDefaultProfilePhotoCustomEmojiStickers
        = A.object
          [ "@type" A..= AT.String "getDefaultProfilePhotoCustomEmojiStickers"
          ]
