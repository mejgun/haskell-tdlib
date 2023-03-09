{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerSetThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Sets a sticker set thumbnail; for bots only
data SetStickerSetThumbnail = SetStickerSetThumbnail
  { -- | Thumbnail to set in PNG, TGS, or WEBM format; pass null to remove the sticker set thumbnail. Thumbnail format must match the format of stickers in the set
    thumbnail :: Maybe InputFile.InputFile,
    -- | Sticker set name
    name :: Maybe String,
    -- | Sticker set owner
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetStickerSetThumbnail where
  show
    SetStickerSetThumbnail
      { thumbnail = thumbnail_,
        name = name_,
        user_id = user_id_
      } =
      "SetStickerSetThumbnail"
        ++ U.cc
          [ U.p "thumbnail" thumbnail_,
            U.p "name" name_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON SetStickerSetThumbnail where
  toJSON
    SetStickerSetThumbnail
      { thumbnail = thumbnail_,
        name = name_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "setStickerSetThumbnail",
          "thumbnail" A..= thumbnail_,
          "name" A..= name_,
          "user_id" A..= user_id_
        ]
