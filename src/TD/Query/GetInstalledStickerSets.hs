{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of installed sticker sets @is_masks Pass true to return mask sticker sets; pass false to return ordinary sticker sets
data GetInstalledStickerSets = GetInstalledStickerSets
  { -- |
    is_masks :: Maybe Bool
  }
  deriving (Eq)

instance Show GetInstalledStickerSets where
  show
    GetInstalledStickerSets
      { is_masks = is_masks_
      } =
      "GetInstalledStickerSets"
        ++ U.cc
          [ U.p "is_masks" is_masks_
          ]

instance T.ToJSON GetInstalledStickerSets where
  toJSON
    GetInstalledStickerSets
      { is_masks = is_masks_
      } =
      A.object
        [ "@type" A..= T.String "getInstalledStickerSets",
          "is_masks" A..= is_masks_
        ]
