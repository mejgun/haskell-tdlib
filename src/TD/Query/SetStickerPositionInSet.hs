{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerPositionInSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot
data SetStickerPositionInSet = SetStickerPositionInSet
  { -- |
    position :: Maybe Int,
    -- | Sticker @position New position of the sticker in the set, zero-based
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show SetStickerPositionInSet where
  show
    SetStickerPositionInSet
      { position = position_,
        sticker = sticker_
      } =
      "SetStickerPositionInSet"
        ++ U.cc
          [ U.p "position" position_,
            U.p "sticker" sticker_
          ]

instance T.ToJSON SetStickerPositionInSet where
  toJSON
    SetStickerPositionInSet
      { position = position_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "setStickerPositionInSet",
          "position" A..= position_,
          "sticker" A..= sticker_
        ]
