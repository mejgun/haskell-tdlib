{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateNewStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputSticker as InputSticker
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
-- Creates a new sticker set. Returns the newly created sticker set
data CreateNewStickerSet = CreateNewStickerSet
  { -- | Source of the sticker set; may be empty if unknown
    source :: Maybe String,
    -- | List of stickers to be added to the set; must be non-empty. All stickers must have the same format. For TGS stickers, uploadStickerFile must be used before the sticker is shown
    stickers :: Maybe [InputSticker.InputSticker],
    -- | Pass true if stickers in the sticker set must be repainted; for custom emoji sticker sets only
    needs_repainting :: Maybe Bool,
    -- | Type of the stickers in the set
    sticker_type :: Maybe StickerType.StickerType,
    -- | Format of the stickers in the set
    sticker_format :: Maybe StickerFormat.StickerFormat,
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
      { source = source_,
        stickers = stickers_,
        needs_repainting = needs_repainting_,
        sticker_type = sticker_type_,
        sticker_format = sticker_format_,
        name = name_,
        title = title_,
        user_id = user_id_
      } =
      "CreateNewStickerSet"
        ++ U.cc
          [ U.p "source" source_,
            U.p "stickers" stickers_,
            U.p "needs_repainting" needs_repainting_,
            U.p "sticker_type" sticker_type_,
            U.p "sticker_format" sticker_format_,
            U.p "name" name_,
            U.p "title" title_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON CreateNewStickerSet where
  toJSON
    CreateNewStickerSet
      { source = source_,
        stickers = stickers_,
        needs_repainting = needs_repainting_,
        sticker_type = sticker_type_,
        sticker_format = sticker_format_,
        name = name_,
        title = title_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "createNewStickerSet",
          "source" A..= source_,
          "stickers" A..= stickers_,
          "needs_repainting" A..= needs_repainting_,
          "sticker_type" A..= sticker_type_,
          "sticker_format" A..= sticker_format_,
          "name" A..= name_,
          "title" A..= title_,
          "user_id" A..= user_id_
        ]
