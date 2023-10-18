module TD.Query.ReorderInstalledStickerSets
  (ReorderInstalledStickerSets(..)
  , defaultReorderInstalledStickerSets
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType

-- | Changes the order of installed sticker sets. Returns 'TD.Data.Ok.Ok'
data ReorderInstalledStickerSets
  = ReorderInstalledStickerSets
    { sticker_type    :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to reorder
    , sticker_set_ids :: Maybe [Int]                   -- ^ Identifiers of installed sticker sets in the new correct order
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderInstalledStickerSets where
  shortShow
    ReorderInstalledStickerSets
      { sticker_type    = sticker_type_
      , sticker_set_ids = sticker_set_ids_
      }
        = "ReorderInstalledStickerSets"
          ++ I.cc
          [ "sticker_type"    `I.p` sticker_type_
          , "sticker_set_ids" `I.p` sticker_set_ids_
          ]

instance AT.ToJSON ReorderInstalledStickerSets where
  toJSON
    ReorderInstalledStickerSets
      { sticker_type    = sticker_type_
      , sticker_set_ids = sticker_set_ids_
      }
        = A.object
          [ "@type"           A..= AT.String "reorderInstalledStickerSets"
          , "sticker_type"    A..= sticker_type_
          , "sticker_set_ids" A..= fmap (fmap I.writeInt64 ) sticker_set_ids_
          ]

defaultReorderInstalledStickerSets :: ReorderInstalledStickerSets
defaultReorderInstalledStickerSets =
  ReorderInstalledStickerSets
    { sticker_type    = Nothing
    , sticker_set_ids = Nothing
    }

