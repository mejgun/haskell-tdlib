{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Changes the order of installed sticker sets @sticker_type Type of the sticker sets to reorder @sticker_set_ids Identifiers of installed sticker sets in the new correct order
data ReorderInstalledStickerSets = ReorderInstalledStickerSets
  { -- |
    sticker_set_ids :: Maybe [Int],
    -- |
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show ReorderInstalledStickerSets where
  show
    ReorderInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        sticker_type = sticker_type_
      } =
      "ReorderInstalledStickerSets"
        ++ U.cc
          [ U.p "sticker_set_ids" sticker_set_ids_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON ReorderInstalledStickerSets where
  toJSON
    ReorderInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "reorderInstalledStickerSets",
          "sticker_set_ids" A..= U.toLS sticker_set_ids_,
          "sticker_type" A..= sticker_type_
        ]
