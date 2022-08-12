{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is non-empty, then favorite, recently used or trending stickers may also be returned
data GetStickers = GetStickers
  { -- | Chat identifier for which to return stickers. Available custom emoji may be different for different chats
    chat_id :: Maybe Int,
    -- | The maximum number of stickers to be returned
    limit :: Maybe Int,
    -- | String representation of emoji. If empty, returns all known installed stickers
    emoji :: Maybe String,
    -- | Type of the sticker sets to return
    sticker_type :: Maybe StickerType.StickerType
  }
  deriving (Eq)

instance Show GetStickers where
  show
    GetStickers
      { chat_id = chat_id_,
        limit = limit_,
        emoji = emoji_,
        sticker_type = sticker_type_
      } =
      "GetStickers"
        ++ U.cc
          [ U.p "chat_id" chat_id_,
            U.p "limit" limit_,
            U.p "emoji" emoji_,
            U.p "sticker_type" sticker_type_
          ]

instance T.ToJSON GetStickers where
  toJSON
    GetStickers
      { chat_id = chat_id_,
        limit = limit_,
        emoji = emoji_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "getStickers",
          "chat_id" A..= chat_id_,
          "limit" A..= limit_,
          "emoji" A..= emoji_,
          "sticker_type" A..= sticker_type_
        ]
