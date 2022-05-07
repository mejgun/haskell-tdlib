{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetStickerSetThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputFile as InputFile
import qualified Utils as U

-- |
-- Sets a sticker set thumbnail; for bots only. Returns the sticker set
data SetStickerSetThumbnail = SetStickerSetThumbnail
  { -- | Thumbnail to set in PNG, TGS, or WEBM format; pass null to remove the sticker set thumbnail. Thumbnail format must match the format of stickers in the set
    thumbnail :: Maybe InputFile.InputFile,
    -- |
    name :: Maybe String,
    -- | Sticker set owner @name Sticker set name
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetStickerSetThumbnail where
  show
    SetStickerSetThumbnail
      { thumbnail = thumbnail,
        name = name,
        user_id = user_id
      } =
      "SetStickerSetThumbnail"
        ++ U.cc
          [ U.p "thumbnail" thumbnail,
            U.p "name" name,
            U.p "user_id" user_id
          ]

instance T.ToJSON SetStickerSetThumbnail where
  toJSON
    SetStickerSetThumbnail
      { thumbnail = thumbnail,
        name = name,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "setStickerSetThumbnail",
          "thumbnail" A..= thumbnail,
          "name" A..= name,
          "user_id" A..= user_id
        ]
