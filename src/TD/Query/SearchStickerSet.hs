module TD.Query.SearchStickerSet
  (SearchStickerSet(..)
  , defaultSearchStickerSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for a sticker set by its name. Returns 'TD.Data.StickerSet.StickerSet'
data SearchStickerSet
  = SearchStickerSet
    { name         :: Maybe T.Text -- ^ Name of the sticker set
    , ignore_cache :: Maybe Bool   -- ^ Pass true to ignore local cache of sticker sets and always send a network request
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStickerSet where
  shortShow
    SearchStickerSet
      { name         = name_
      , ignore_cache = ignore_cache_
      }
        = "SearchStickerSet"
          ++ I.cc
          [ "name"         `I.p` name_
          , "ignore_cache" `I.p` ignore_cache_
          ]

instance AT.ToJSON SearchStickerSet where
  toJSON
    SearchStickerSet
      { name         = name_
      , ignore_cache = ignore_cache_
      }
        = A.object
          [ "@type"        A..= AT.String "searchStickerSet"
          , "name"         A..= name_
          , "ignore_cache" A..= ignore_cache_
          ]

defaultSearchStickerSet :: SearchStickerSet
defaultSearchStickerSet =
  SearchStickerSet
    { name         = Nothing
    , ignore_cache = Nothing
    }

