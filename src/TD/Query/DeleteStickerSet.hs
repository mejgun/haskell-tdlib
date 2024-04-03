module TD.Query.DeleteStickerSet
  (DeleteStickerSet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Completely deletes a sticker set. Returns 'TD.Data.Ok.Ok'
data DeleteStickerSet
  = DeleteStickerSet
    { name :: Maybe T.Text -- ^ Sticker set name. The sticker set must be owned by the current user
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteStickerSet where
  shortShow
    DeleteStickerSet
      { name = name_
      }
        = "DeleteStickerSet"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON DeleteStickerSet where
  toJSON
    DeleteStickerSet
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "deleteStickerSet"
          , "name"  A..= name_
          ]

