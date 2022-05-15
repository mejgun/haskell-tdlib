{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the order of installed sticker sets @is_masks Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets @sticker_set_ids Identifiers of installed sticker sets in the new correct order
data ReorderInstalledStickerSets = ReorderInstalledStickerSets
  { -- |
    sticker_set_ids :: Maybe [Int],
    -- |
    is_masks :: Maybe Bool
  }
  deriving (Eq)

instance Show ReorderInstalledStickerSets where
  show
    ReorderInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        is_masks = is_masks_
      } =
      "ReorderInstalledStickerSets"
        ++ U.cc
          [ U.p "sticker_set_ids" sticker_set_ids_,
            U.p "is_masks" is_masks_
          ]

instance T.ToJSON ReorderInstalledStickerSets where
  toJSON
    ReorderInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        is_masks = is_masks_
      } =
      A.object
        [ "@type" A..= T.String "reorderInstalledStickerSets",
          "sticker_set_ids" A..= U.toLS sticker_set_ids_,
          "is_masks" A..= is_masks_
        ]
