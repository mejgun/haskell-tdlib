{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deleted a sticker set; for bots only @name Sticker set name
data DeleteStickerSet = DeleteStickerSet
  { -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show DeleteStickerSet where
  show
    DeleteStickerSet
      { name = name_
      } =
      "DeleteStickerSet"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.ToJSON DeleteStickerSet where
  toJSON
    DeleteStickerSet
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "deleteStickerSet",
          "name" A..= name_
        ]
