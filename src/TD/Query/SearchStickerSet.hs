module TD.Query.SearchStickerSet
  (SearchStickerSet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for a sticker set by its name. Returns 'TD.Data.StickerSet.StickerSet'
data SearchStickerSet
  = SearchStickerSet
    { name :: Maybe T.Text -- ^ Name of the sticker set
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStickerSet where
  shortShow
    SearchStickerSet
      { name = name_
      }
        = "SearchStickerSet"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON SearchStickerSet where
  toJSON
    SearchStickerSet
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "searchStickerSet"
          , "name"  A..= name_
          ]

