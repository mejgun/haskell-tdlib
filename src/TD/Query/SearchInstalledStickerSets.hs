{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Searches for installed sticker sets by looking for specified query in their title and name @sticker_type Type of the sticker sets to search for @query Query to search for @limit The maximum number of sticker sets to return
data SearchInstalledStickerSets = SearchInstalledStickerSets
  { -- |
    limit :: Maybe Int,
    -- |
    query :: Maybe String,
    -- |
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show SearchInstalledStickerSets where
  show
    SearchInstalledStickerSets
      { limit = limit_,
        query = query_,
        sticker_type = sticker_type_
      } =
      "SearchInstalledStickerSets"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "query" query_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON SearchInstalledStickerSets where
  toJSON
    SearchInstalledStickerSets
      { limit = limit_,
        query = query_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "searchInstalledStickerSets",
          "limit" A..= limit_,
          "query" A..= query_,
          "sticker_type" A..= sticker_type_
        ]
