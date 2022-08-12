{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetArchivedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns a list of archived sticker sets @sticker_type Type of the sticker sets to return @offset_sticker_set_id Identifier of the sticker set from which to return the result @limit The maximum number of sticker sets to return; up to 100
data GetArchivedStickerSets = GetArchivedStickerSets
  { -- |
    limit :: Maybe Int,
    -- |
    offset_sticker_set_id :: Maybe Int,
    -- |
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetArchivedStickerSets where
  show
    GetArchivedStickerSets
      { limit = limit_,
        offset_sticker_set_id = offset_sticker_set_id_,
        sticker_type = sticker_type_
      } =
      "GetArchivedStickerSets"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_sticker_set_id" offset_sticker_set_id_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetArchivedStickerSets where
  toJSON
    GetArchivedStickerSets
      { limit = limit_,
        offset_sticker_set_id = offset_sticker_set_id_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getArchivedStickerSets",
          "limit" A..= limit_,
          "offset_sticker_set_id" A..= U.toS offset_sticker_set_id_,
          "sticker_type" A..= sticker_type_
        ]
