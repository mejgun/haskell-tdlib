{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerKeywords where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Changes the list of keywords of a sticker; for bots only. The sticker must belong to a regular or custom emoji sticker set created by the bot
data SetStickerKeywords = SetStickerKeywords
  { -- | List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
    keywords :: Maybe [String],
    -- | Sticker
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show SetStickerKeywords where
  show
    SetStickerKeywords
      { keywords = keywords_,
        sticker = sticker_
      } =
      "SetStickerKeywords"
        ++ U.cc
          [ U.p "keywords" keywords_,
            U.p "sticker" sticker_
          ]

instance T.ToJSON SetStickerKeywords where
  toJSON
    SetStickerKeywords
      { keywords = keywords_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "setStickerKeywords",
          "keywords" A..= keywords_,
          "sticker" A..= sticker_
        ]
