module TD.Query.GetStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetStickerSet -- ^ Returns information about a sticker set by its identifier
  = GetStickerSet
    { set_id :: Maybe Int -- ^ Identifier of the sticker set
    }
  deriving (Eq)

instance Show GetStickerSet where
  show
    GetStickerSet
      { set_id = set_id_
      }
        = "GetStickerSet"
          ++ I.cc
          [ "set_id" `I.p` set_id_
          ]

instance AT.ToJSON GetStickerSet where
  toJSON
    GetStickerSet
      { set_id = set_id_
      }
        = A.object
          [ "@type"  A..= AT.String "getStickerSet"
          , "set_id" A..= I.toS set_id_
          ]
