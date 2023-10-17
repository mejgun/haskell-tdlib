module TD.Query.SearchStickerSets
  (SearchStickerSets(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results
data SearchStickerSets
  = SearchStickerSets
    { query :: Maybe T.Text -- ^ Query to search for
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStickerSets where
  shortShow
    SearchStickerSets
      { query = query_
      }
        = "SearchStickerSets"
          ++ I.cc
          [ "query" `I.p` query_
          ]

instance AT.ToJSON SearchStickerSets where
  toJSON
    SearchStickerSets
      { query = query_
      }
        = A.object
          [ "@type" A..= AT.String "searchStickerSets"
          , "query" A..= query_
          ]

