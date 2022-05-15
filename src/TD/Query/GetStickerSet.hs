{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a sticker set by its identifier @set_id Identifier of the sticker set
data GetStickerSet = GetStickerSet
  { -- |
    set_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetStickerSet where
  show
    GetStickerSet
      { set_id = set_id_
      } =
      "GetStickerSet"
        ++ U.cc
          [ U.p "set_id" set_id_
          ]

instance T.ToJSON GetStickerSet where
  toJSON
    GetStickerSet
      { set_id = set_id_
      } =
      A.object
        [ "@type" A..= T.String "getStickerSet",
          "set_id" A..= U.toS set_id_
        ]
