{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned @custom_emoji_ids Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
data GetCustomEmojiStickers = GetCustomEmojiStickers
  { -- |
    custom_emoji_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show GetCustomEmojiStickers where
  show
    GetCustomEmojiStickers
      { custom_emoji_ids = custom_emoji_ids_
      } =
      "GetCustomEmojiStickers"
        ++ U.cc
          [ U.p "custom_emoji_ids" custom_emoji_ids_
          ]

instance T.ToJSON GetCustomEmojiStickers where
  toJSON
    GetCustomEmojiStickers
      { custom_emoji_ids = custom_emoji_ids_
      } =
      A.object
        [ "@type" A..= T.String "getCustomEmojiStickers",
          "custom_emoji_ids" A..= U.toLS custom_emoji_ids_
        ]
