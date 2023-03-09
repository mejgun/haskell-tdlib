{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerMaskPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.MaskPosition as MaskPosition
import qualified Utils as U

-- |
-- Changes the mask position of a mask sticker; for bots only. The sticker must belong to a mask sticker set created by the bot
data SetStickerMaskPosition = SetStickerMaskPosition
  { -- | Position where the mask is placed; pass null to remove mask position
    mask_position :: Maybe MaskPosition.MaskPosition,
    -- | Sticker
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show SetStickerMaskPosition where
  show
    SetStickerMaskPosition
      { mask_position = mask_position_,
        sticker = sticker_
      } =
      "SetStickerMaskPosition"
        ++ U.cc
          [ U.p "mask_position" mask_position_,
            U.p "sticker" sticker_
          ]

instance T.ToJSON SetStickerMaskPosition where
  toJSON
    SetStickerMaskPosition
      { mask_position = mask_position_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "setStickerMaskPosition",
          "mask_position" A..= mask_position_,
          "sticker" A..= sticker_
        ]
