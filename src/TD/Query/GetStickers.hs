{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns stickers from the installed sticker sets that correspond to a given emoji or can be found by sticker-specific keywords. If the query is non-empty, then favorite, recently used or trending stickers may also be returned
data GetStickers = GetStickers
  { -- | Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats
    chat_id :: Maybe Int,
    -- | The maximum number of stickers to be returned
    limit :: Maybe Int,
    -- | Search query; an emoji or a keyword prefix. If empty, returns all known installed stickers
    query :: Maybe String,
    -- | Type of the stickers to return
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetStickers where
  show
    GetStickers
      { chat_id = chat_id_,
        limit = limit_,
        query = query_,
        sticker_type = sticker_type_
      } =
      "GetStickers"
        ++ U.cc
          [ U.p "chat_id" chat_id_,
            U.p "limit" limit_,
            U.p "query" query_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetStickers where
  toJSON
    GetStickers
      { chat_id = chat_id_,
        limit = limit_,
        query = query_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getStickers",
          "chat_id" A..= chat_id_,
          "limit" A..= limit_,
          "query" A..= query_,
          "sticker_type" A..= sticker_type_
        ]
