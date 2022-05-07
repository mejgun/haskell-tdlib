{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreateNewStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputSticker as InputSticker
import qualified Utils as U

-- |
-- Creates a new sticker set. Returns the newly created sticker set
data CreateNewStickerSet = CreateNewStickerSet
  { -- | Source of the sticker set; may be empty if unknown
    source :: Maybe String,
    -- | List of stickers to be added to the set; must be non-empty. All stickers must have the same format. For TGS stickers, uploadStickerFile must be used before the sticker is shown
    stickers :: Maybe [InputSticker.InputSticker],
    -- | Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive) for bots; 1-64 characters
    name :: Maybe String,
    -- | Sticker set title; 1-64 characters
    title :: Maybe String,
    -- | Sticker set owner; ignored for regular users
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateNewStickerSet where
  show
    CreateNewStickerSet
      { source = source,
        stickers = stickers,
        name = name,
        title = title,
        user_id = user_id
      } =
      "CreateNewStickerSet"
        ++ U.cc
          [ U.p "source" source,
            U.p "stickers" stickers,
            U.p "name" name,
            U.p "title" title,
            U.p "user_id" user_id
          ]

instance T.ToJSON CreateNewStickerSet where
  toJSON
    CreateNewStickerSet
      { source = source,
        stickers = stickers,
        name = name,
        title = title,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "createNewStickerSet",
          "source" A..= source,
          "stickers" A..= stickers,
          "name" A..= name,
          "title" A..= title,
          "user_id" A..= user_id
        ]
