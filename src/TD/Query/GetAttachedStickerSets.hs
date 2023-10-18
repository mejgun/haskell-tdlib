module TD.Query.GetAttachedStickerSets
  (GetAttachedStickerSets(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets. Returns 'TD.Data.StickerSets.StickerSets'
data GetAttachedStickerSets
  = GetAttachedStickerSets
    { file_id :: Maybe Int -- ^ File identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetAttachedStickerSets where
  shortShow
    GetAttachedStickerSets
      { file_id = file_id_
      }
        = "GetAttachedStickerSets"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON GetAttachedStickerSets where
  toJSON
    GetAttachedStickerSets
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getAttachedStickerSets"
          , "file_id" A..= file_id_
          ]

