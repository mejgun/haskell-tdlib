module TD.Query.GetAttachedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetAttachedStickerSets -- ^ Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets
  = GetAttachedStickerSets
    { file_id :: Maybe Int -- ^ File identifier
    }
  deriving (Eq)

instance Show GetAttachedStickerSets where
  show
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
