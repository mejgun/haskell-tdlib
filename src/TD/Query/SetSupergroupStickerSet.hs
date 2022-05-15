{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetSupergroupStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the sticker set of a supergroup; requires can_change_info administrator right @supergroup_id Identifier of the supergroup @sticker_set_id New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
data SetSupergroupStickerSet = SetSupergroupStickerSet
  { -- |
    sticker_set_id :: Maybe Int,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetSupergroupStickerSet where
  show
    SetSupergroupStickerSet
      { sticker_set_id = sticker_set_id_,
        supergroup_id = supergroup_id_
      } =
      "SetSupergroupStickerSet"
        ++ U.cc
          [ U.p "sticker_set_id" sticker_set_id_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON SetSupergroupStickerSet where
  toJSON
    SetSupergroupStickerSet
      { sticker_set_id = sticker_set_id_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "setSupergroupStickerSet",
          "sticker_set_id" A..= U.toS sticker_set_id_,
          "supergroup_id" A..= supergroup_id_
        ]
