{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetStickerPositionInSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputFile as InputFile
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
      { position = position,
        sticker = sticker
      } =
      "SetStickerPositionInSet"
        ++ U.cc
          [ U.p "position" position,
            U.p "sticker" sticker
          ]

instance T.ToJSON SetStickerPositionInSet where
  toJSON
    SetStickerPositionInSet
      { position = position,
        sticker = sticker
      } =
      A.object
        [ "@type" A..= T.String "setStickerPositionInSet",
          "position" A..= position,
          "sticker" A..= sticker
        ]
