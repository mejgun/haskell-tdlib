{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAttachedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets @file_id File identifier
data GetAttachedStickerSets = GetAttachedStickerSets
  { -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetAttachedStickerSets where
  show
    GetAttachedStickerSets
      { file_id = file_id_
      } =
      "GetAttachedStickerSets"
        ++ U.cc
          [ U.p "file_id" file_id_
          ]

instance T.ToJSON GetAttachedStickerSets where
  toJSON
    GetAttachedStickerSets
      { file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "getAttachedStickerSets",
          "file_id" A..= file_id_
        ]
