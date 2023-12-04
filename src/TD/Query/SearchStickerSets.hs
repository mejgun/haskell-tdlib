module TD.Query.SearchStickerSets
  (SearchStickerSets(..)
  , defaultSearchStickerSets
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType
import qualified Data.Text as T

-- | Searches for sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results. Returns 'TD.Data.StickerSets.StickerSets'
data SearchStickerSets
  = SearchStickerSets
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to return
    , query        :: Maybe T.Text                  -- ^ Query to search for
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStickerSets where
  shortShow
    SearchStickerSets
      { sticker_type = sticker_type_
      , query        = query_
      }
        = "SearchStickerSets"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          , "query"        `I.p` query_
          ]

instance AT.ToJSON SearchStickerSets where
  toJSON
    SearchStickerSets
      { sticker_type = sticker_type_
      , query        = query_
      }
        = A.object
          [ "@type"        A..= AT.String "searchStickerSets"
          , "sticker_type" A..= sticker_type_
          , "query"        A..= query_
          ]

defaultSearchStickerSets :: SearchStickerSets
defaultSearchStickerSets =
  SearchStickerSets
    { sticker_type = Nothing
    , query        = Nothing
    }

