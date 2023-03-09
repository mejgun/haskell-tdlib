{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Changes the list of emoji corresponding to a sticker; for bots only. The sticker must belong to a regular or custom emoji sticker set created by the bot
data SetStickerEmojis = SetStickerEmojis
  { -- | New string with 1-20 emoji corresponding to the sticker
    emojis :: Maybe String,
    -- | Sticker
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show SetStickerEmojis where
  show
    SetStickerEmojis
      { emojis = emojis_,
        sticker = sticker_
      } =
      "SetStickerEmojis"
        ++ U.cc
          [ U.p "emojis" emojis_,
            U.p "sticker" sticker_
          ]

instance T.ToJSON SetStickerEmojis where
  toJSON
    SetStickerEmojis
      { emojis = emojis_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "setStickerEmojis",
          "emojis" A..= emojis_,
          "sticker" A..= sticker_
        ]
