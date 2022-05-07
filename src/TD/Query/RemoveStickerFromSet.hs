{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveStickerFromSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputFile as InputFile
import qualified Utils as U

-- |
-- Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot @sticker Sticker
data RemoveStickerFromSet = RemoveStickerFromSet
  { -- |
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show RemoveStickerFromSet where
  show
    RemoveStickerFromSet
      { sticker = sticker
      } =
      "RemoveStickerFromSet"
        ++ U.cc
          [ U.p "sticker" sticker
          ]

instance T.ToJSON RemoveStickerFromSet where
  toJSON
    RemoveStickerFromSet
      { sticker = sticker
      } =
      A.object
        [ "@type" A..= T.String "removeStickerFromSet",
          "sticker" A..= sticker
        ]
