{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results @query Query to search for
data SearchStickerSets = SearchStickerSets
  { -- |
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchStickerSets where
  show
    SearchStickerSets
      { query = query_
      } =
      "SearchStickerSets"
        ++ U.cc
          [ U.p "query" query_
          ]

instance T.ToJSON SearchStickerSets where
  toJSON
    SearchStickerSets
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchStickerSets",
          "query" A..= query_
        ]
