{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

data InputThumbnail = -- | A thumbnail to be sent along with a file; must be in JPEG or WEBP format for stickers, and less than 200 KB in size
  InputThumbnail
  { -- | Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
    height :: Maybe Int,
    -- | Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
    width :: Maybe Int,
    -- | Thumbnail file to send. Sending thumbnails by file_id is currently not supported
    thumbnail :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show InputThumbnail where
  show
    InputThumbnail
      { height = height_,
        width = width_,
        thumbnail = thumbnail_
      } =
      "InputThumbnail"
        ++ U.cc
          [ U.p "height" height_,
            U.p "width" width_,
            U.p "thumbnail" thumbnail_
          ]

instance T.FromJSON InputThumbnail where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputThumbnail" -> parseInputThumbnail v
      _ -> mempty
    where
      parseInputThumbnail :: A.Value -> T.Parser InputThumbnail
      parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        thumbnail_ <- o A..:? "thumbnail"
        return $ InputThumbnail {height = height_, width = width_, thumbnail = thumbnail_}
  parseJSON _ = mempty

instance T.ToJSON InputThumbnail where
  toJSON
    InputThumbnail
      { height = height_,
        width = width_,
        thumbnail = thumbnail_
      } =
      A.object
        [ "@type" A..= T.String "inputThumbnail",
          "height" A..= height_,
          "width" A..= width_,
          "thumbnail" A..= thumbnail_
        ]
