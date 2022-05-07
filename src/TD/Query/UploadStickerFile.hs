{-# LANGUAGE OverloadedStrings #-}

module TD.Query.UploadStickerFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputSticker as InputSticker
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
      { sticker = sticker,
        user_id = user_id
      } =
      "UploadStickerFile"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "user_id" user_id
          ]

instance T.ToJSON UploadStickerFile where
  toJSON
    UploadStickerFile
      { sticker = sticker,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "uploadStickerFile",
          "sticker" A..= sticker,
          "user_id" A..= user_id
        ]
