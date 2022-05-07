{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
data GetTrendingStickerSets = GetTrendingStickerSets
  { -- | The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
    limit :: Maybe Int,
    -- | The offset from which to return the sticker sets; must be non-negative
    offset :: Maybe Int
  }
  deriving (Eq)

instance Show GetTrendingStickerSets where
  show
    GetTrendingStickerSets
      { limit = limit,
        offset = offset
      } =
      "GetTrendingStickerSets"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset
          ]

instance T.ToJSON GetTrendingStickerSets where
  toJSON
    GetTrendingStickerSets
      { limit = limit,
        offset = offset
      } =
      A.object
        [ "@type" A..= T.String "getTrendingStickerSets",
          "limit" A..= limit,
          "offset" A..= offset
        ]
