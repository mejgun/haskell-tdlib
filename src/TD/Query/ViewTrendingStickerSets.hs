{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ViewTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs the server that some trending sticker sets have been viewed by the user @sticker_set_ids Identifiers of viewed trending sticker sets
data ViewTrendingStickerSets = ViewTrendingStickerSets
  { -- |
    sticker_set_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show ViewTrendingStickerSets where
  show
    ViewTrendingStickerSets
      { sticker_set_ids = sticker_set_ids
      } =
      "ViewTrendingStickerSets"
        ++ U.cc
          [ U.p "sticker_set_ids" sticker_set_ids
          ]

instance T.ToJSON ViewTrendingStickerSets where
  toJSON
    ViewTrendingStickerSets
      { sticker_set_ids = sticker_set_ids
      } =
      A.object
        [ "@type" A..= T.String "viewTrendingStickerSets",
          "sticker_set_ids" A..= sticker_set_ids
        ]
