{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns a list of installed sticker sets @sticker_type Type of the sticker sets to return
data GetInstalledStickerSets = GetInstalledStickerSets
  { -- |
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetInstalledStickerSets where
  show
    GetInstalledStickerSets
      { sticker_type = sticker_type_
      } =
      "GetInstalledStickerSets"
        ++ U.cc
          [ U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetInstalledStickerSets where
  toJSON
    GetInstalledStickerSets
      { sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getInstalledStickerSets",
          "sticker_type" A..= sticker_type_
        ]
