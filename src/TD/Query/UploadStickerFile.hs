{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UploadStickerFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.StickerFormat as StickerFormat
import qualified Utils as U

-- |
-- Uploads a file with a sticker; returns the uploaded file
data UploadStickerFile = UploadStickerFile
  { -- | File file to upload; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.
    -- See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    sticker :: Maybe InputFile.InputFile,
    -- | Sticker format
    sticker_format :: Maybe StickerFormat.StickerFormat,
    -- | Sticker file owner; ignored for regular users
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show UploadStickerFile where
  show
    UploadStickerFile
      { sticker = sticker_,
        sticker_format = sticker_format_,
        user_id = user_id_
      } =
      "UploadStickerFile"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "sticker_format" sticker_format_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON UploadStickerFile where
  toJSON
    UploadStickerFile
      { sticker = sticker_,
        sticker_format = sticker_format_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "uploadStickerFile",
          "sticker" A..= sticker_,
          "sticker_format" A..= sticker_format_,
          "user_id" A..= user_id_
        ]
