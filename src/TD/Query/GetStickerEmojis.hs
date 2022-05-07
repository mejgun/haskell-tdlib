{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetStickerEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object @sticker Sticker file identifier
data GetStickerEmojis = GetStickerEmojis
  { -- |
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show GetStickerEmojis where
  show
    GetStickerEmojis
      { sticker = sticker
      } =
      "GetStickerEmojis"
        ++ U.cc
          [ U.p "sticker" sticker
          ]

instance T.ToJSON GetStickerEmojis where
  toJSON
    GetStickerEmojis
      { sticker = sticker
      } =
      A.object
        [ "@type" A..= T.String "getStickerEmojis",
          "sticker" A..= sticker
        ]
