{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Searches for stickers from public sticker sets that correspond to any of the given emoji
data SearchStickers = SearchStickers
  { -- | The maximum number of stickers to be returned; 0-100
    limit :: Maybe Int,
    -- | Space-separated list of emoji to search for; must be non-empty
    emojis :: Maybe String,
    -- | Type of the stickers to return
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show SearchStickers where
  show
    SearchStickers
      { limit = limit_,
        emojis = emojis_,
        sticker_type = sticker_type_
      } =
      "SearchStickers"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "emojis" emojis_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON SearchStickers where
  toJSON
    SearchStickers
      { limit = limit_,
        emojis = emojis_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "searchStickers",
          "limit" A..= limit_,
          "emojis" A..= emojis_,
          "sticker_type" A..= sticker_type_
        ]
