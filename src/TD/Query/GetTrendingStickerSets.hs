{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
data GetTrendingStickerSets = GetTrendingStickerSets
  { -- | The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
    limit :: Maybe Int,
    -- | The offset from which to return the sticker sets; must be non-negative
    offset :: Maybe Int,
    -- | Type of the sticker sets to return
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetTrendingStickerSets where
  show
    GetTrendingStickerSets
      { limit = limit_,
        offset = offset_,
        sticker_type = sticker_type_
      } =
      "GetTrendingStickerSets"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetTrendingStickerSets where
  toJSON
    GetTrendingStickerSets
      { limit = limit_,
        offset = offset_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getTrendingStickerSets",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "sticker_type" A..= sticker_type_
        ]
