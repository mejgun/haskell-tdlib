module TD.Query.UploadStickerFile
  (UploadStickerFile(..)
  , defaultUploadStickerFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.InputFile as InputFile

-- | Uploads a file with a sticker; returns the uploaded file. Returns 'TD.Data.File.File'
data UploadStickerFile
  = UploadStickerFile
    { user_id        :: Maybe Int                         -- ^ Sticker file owner; ignored for regular users
    , sticker_format :: Maybe StickerFormat.StickerFormat -- ^ Sticker format
    , sticker        :: Maybe InputFile.InputFile         -- ^ File file to upload; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    }
  deriving (Eq, Show)

instance I.ShortShow UploadStickerFile where
  shortShow
    UploadStickerFile
      { user_id        = user_id_
      , sticker_format = sticker_format_
      , sticker        = sticker_
      }
        = "UploadStickerFile"
          ++ I.cc
          [ "user_id"        `I.p` user_id_
          , "sticker_format" `I.p` sticker_format_
          , "sticker"        `I.p` sticker_
          ]

instance AT.ToJSON UploadStickerFile where
  toJSON
    UploadStickerFile
      { user_id        = user_id_
      , sticker_format = sticker_format_
      , sticker        = sticker_
      }
        = A.object
          [ "@type"          A..= AT.String "uploadStickerFile"
          , "user_id"        A..= user_id_
          , "sticker_format" A..= sticker_format_
          , "sticker"        A..= sticker_
          ]

defaultUploadStickerFile :: UploadStickerFile
defaultUploadStickerFile =
  UploadStickerFile
    { user_id        = Nothing
    , sticker_format = Nothing
    , sticker        = Nothing
    }

