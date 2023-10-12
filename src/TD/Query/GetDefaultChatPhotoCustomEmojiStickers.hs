module TD.Query.GetDefaultChatPhotoCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetDefaultChatPhotoCustomEmojiStickers -- ^ Returns default list of custom emoji stickers for placing on a chat photo
  = GetDefaultChatPhotoCustomEmojiStickers
  deriving (Eq)

instance Show GetDefaultChatPhotoCustomEmojiStickers where
  show
    GetDefaultChatPhotoCustomEmojiStickers
        = "GetDefaultChatPhotoCustomEmojiStickers"

instance AT.ToJSON GetDefaultChatPhotoCustomEmojiStickers where
  toJSON
    GetDefaultChatPhotoCustomEmojiStickers
        = A.object
          [ "@type" A..= AT.String "getDefaultChatPhotoCustomEmojiStickers"
          ]
