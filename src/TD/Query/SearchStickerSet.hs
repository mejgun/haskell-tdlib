module TD.Query.SearchStickerSet
  (SearchStickerSet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for a sticker set by its name
data SearchStickerSet
  = SearchStickerSet
    { name :: Maybe T.Text -- ^ Name of the sticker set
    }
  deriving (Eq)

instance Show SearchStickerSet where
  show
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

