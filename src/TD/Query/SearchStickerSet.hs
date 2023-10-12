module TD.Query.SearchStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SearchStickerSet -- ^ Searches for a sticker set by its name
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
