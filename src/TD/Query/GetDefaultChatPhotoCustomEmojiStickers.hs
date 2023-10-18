module TD.Query.GetDefaultChatPhotoCustomEmojiStickers
  (GetDefaultChatPhotoCustomEmojiStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default list of custom emoji stickers for placing on a chat photo. Returns 'TD.Data.Stickers.Stickers'
data GetDefaultChatPhotoCustomEmojiStickers
  = GetDefaultChatPhotoCustomEmojiStickers
  deriving (Eq, Show)

instance I.ShortShow GetDefaultChatPhotoCustomEmojiStickers where
  shortShow
    GetDefaultChatPhotoCustomEmojiStickers
        = "GetDefaultChatPhotoCustomEmojiStickers"

instance AT.ToJSON GetDefaultChatPhotoCustomEmojiStickers where
  toJSON
    GetDefaultChatPhotoCustomEmojiStickers
        = A.object
          [ "@type" A..= AT.String "getDefaultChatPhotoCustomEmojiStickers"
          ]

