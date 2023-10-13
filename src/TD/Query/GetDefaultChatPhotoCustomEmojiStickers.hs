module TD.Query.GetDefaultChatPhotoCustomEmojiStickers(GetDefaultChatPhotoCustomEmojiStickers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

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
