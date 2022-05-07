{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for installed sticker sets by looking for specified query in their title and name @is_masks Pass true to return mask sticker sets; pass false to return ordinary sticker sets @query Query to search for @limit The maximum number of sticker sets to return
data SearchInstalledStickerSets = SearchInstalledStickerSets
  { -- |
    limit :: Maybe Int,
    -- |
    query :: Maybe String,
    -- |
    is_masks :: Maybe Bool
  }
  deriving (Eq)

instance Show SearchInstalledStickerSets where
  show
    SearchInstalledStickerSets
      { limit = limit,
        query = query,
        is_masks = is_masks
      } =
      "SearchInstalledStickerSets"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "query" query,
            U.p "is_masks" is_masks
          ]

instance T.ToJSON SearchInstalledStickerSets where
  toJSON
    SearchInstalledStickerSets
      { limit = limit,
        query = query,
        is_masks = is_masks
      } =
      A.object
        [ "@type" A..= T.String "searchInstalledStickerSets",
          "limit" A..= limit,
          "query" A..= query,
          "is_masks" A..= is_masks
        ]
