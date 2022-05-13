{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetArchivedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of archived sticker sets @is_masks Pass true to return mask stickers sets; pass false to return ordinary sticker sets @offset_sticker_set_id Identifier of the sticker set from which to return the result @limit The maximum number of sticker sets to return; up to 100
data GetArchivedStickerSets = GetArchivedStickerSets
  { -- |
    limit :: Maybe Int,
    -- |
    offset_sticker_set_id :: Maybe Int,
    -- |
    is_masks :: Maybe Bool
  }
  deriving (Eq)

instance Show GetArchivedStickerSets where
  show
    GetArchivedStickerSets
      { limit = limit_,
        offset_sticker_set_id = offset_sticker_set_id_,
        is_masks = is_masks_
      } =
      "GetArchivedStickerSets"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_sticker_set_id" offset_sticker_set_id_,
            U.p "is_masks" is_masks_
          ]

instance T.ToJSON GetArchivedStickerSets where
  toJSON
    GetArchivedStickerSets
      { limit = limit_,
        offset_sticker_set_id = offset_sticker_set_id_,
        is_masks = is_masks_
      } =
      A.object
        [ "@type" A..= T.String "getArchivedStickerSets",
          "limit" A..= limit_,
          "offset_sticker_set_id" A..= offset_sticker_set_id_,
          "is_masks" A..= is_masks_
        ]
