{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for a sticker set by its name @name Name of the sticker set
data SearchStickerSet = SearchStickerSet
  { -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show SearchStickerSet where
  show
    SearchStickerSet
      { name = name
      } =
      "SearchStickerSet"
        ++ U.cc
          [ U.p "name" name
          ]

instance T.ToJSON SearchStickerSet where
  toJSON
    SearchStickerSet
      { name = name
      } =
      A.object
        [ "@type" A..= T.String "searchStickerSet",
          "name" A..= name
        ]
