{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAllStickerEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query, 1000000, chat_id)
data GetAllStickerEmojis = GetAllStickerEmojis
  { -- | Pass true if only main emoji for each found sticker must be included in the result
    return_only_main_emoji :: Maybe Bool,
    -- | Chat identifier for which to find stickers
    chat_id :: Maybe Int,
    -- | Search query
    query :: Maybe String,
    -- | Type of the stickers to search for
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetAllStickerEmojis where
  show
    GetAllStickerEmojis
      { return_only_main_emoji = return_only_main_emoji_,
        chat_id = chat_id_,
        query = query_,
        sticker_type = sticker_type_
      } =
      "GetAllStickerEmojis"
        ++ U.cc
          [ U.p "return_only_main_emoji" return_only_main_emoji_,
            U.p "chat_id" chat_id_,
            U.p "query" query_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetAllStickerEmojis where
  toJSON
    GetAllStickerEmojis
      { return_only_main_emoji = return_only_main_emoji_,
        chat_id = chat_id_,
        query = query_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getAllStickerEmojis",
          "return_only_main_emoji" A..= return_only_main_emoji_,
          "chat_id" A..= chat_id_,
          "query" A..= query_,
          "sticker_type" A..= sticker_type_
        ]
