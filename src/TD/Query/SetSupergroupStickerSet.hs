{-# LANGUAGE OverloadedStrings #-}

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
      { sticker_set_id = sticker_set_id,
        supergroup_id = supergroup_id
      } =
      "SetSupergroupStickerSet"
        ++ U.cc
          [ U.p "sticker_set_id" sticker_set_id,
            U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON SetSupergroupStickerSet where
  toJSON
    SetSupergroupStickerSet
      { sticker_set_id = sticker_set_id,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "setSupergroupStickerSet",
          "sticker_set_id" A..= sticker_set_id,
          "supergroup_id" A..= supergroup_id
        ]
