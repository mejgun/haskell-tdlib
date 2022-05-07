{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddStickerToSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputSticker as InputSticker
import qualified Utils as U

-- |
-- Adds a new sticker to a set; for bots only. Returns the sticker set
data AddStickerToSet = AddStickerToSet
  { -- |
    sticker :: Maybe InputSticker.InputSticker,
    -- |
    name :: Maybe String,
    -- | Sticker set owner @name Sticker set name @sticker Sticker to add to the set
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddStickerToSet where
  show
    AddStickerToSet
      { sticker = sticker,
        name = name,
        user_id = user_id
      } =
      "AddStickerToSet"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "name" name,
            U.p "user_id" user_id
          ]

instance T.ToJSON AddStickerToSet where
  toJSON
    AddStickerToSet
      { sticker = sticker,
        name = name,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "addStickerToSet",
          "sticker" A..= sticker,
          "name" A..= name,
          "user_id" A..= user_id
        ]
