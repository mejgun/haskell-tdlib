module TD.Query.GetStickerSet
  (GetStickerSet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a sticker set by its identifier. Returns 'TD.Data.StickerSet.StickerSet'
data GetStickerSet
  = GetStickerSet
    { set_id :: Maybe Int -- ^ Identifier of the sticker set
    }
  deriving (Eq, Show)

instance I.ShortShow GetStickerSet where
  shortShow
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
          , "set_id" A..= fmap I.writeInt64  set_id_
          ]

