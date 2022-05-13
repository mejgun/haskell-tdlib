{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UploadStickerFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputSticker as InputSticker
import qualified Utils as U

-- |
-- Uploads a file with a sticker; returns the uploaded file @user_id Sticker file owner; ignored for regular users @sticker Sticker file to upload
data UploadStickerFile = UploadStickerFile
  { -- |
    sticker :: Maybe InputSticker.InputSticker,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show UploadStickerFile where
  show
    UploadStickerFile
      { sticker = sticker_,
        user_id = user_id_
      } =
      "UploadStickerFile"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON UploadStickerFile where
  toJSON
    UploadStickerFile
      { sticker = sticker_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "uploadStickerFile",
          "sticker" A..= sticker_,
          "user_id" A..= user_id_
        ]
