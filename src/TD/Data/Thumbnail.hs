{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Thumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.ThumbnailFormat as ThumbnailFormat
import qualified Utils as U

data Thumbnail = -- | Represents a thumbnail @format Thumbnail format @width Thumbnail width @height Thumbnail height @file The thumbnail
  Thumbnail
  { -- |
    file :: Maybe File.File,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int,
    -- |
    format :: Maybe ThumbnailFormat.ThumbnailFormat
  }
  deriving (Eq)

instance Show Thumbnail where
  show
    Thumbnail
      { file = file,
        height = height,
        width = width,
        format = format
      } =
      "Thumbnail"
        ++ U.cc
          [ U.p "file" file,
            U.p "height" height,
            U.p "width" width,
            U.p "format" format
          ]

instance T.FromJSON Thumbnail where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "thumbnail" -> parseThumbnail v
      _ -> mempty
    where
      parseThumbnail :: A.Value -> T.Parser Thumbnail
      parseThumbnail = A.withObject "Thumbnail" $ \o -> do
        file_ <- o A..:? "file"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        format_ <- o A..:? "format"
        return $ Thumbnail {file = file_, height = height_, width = width_, format = format_}
  parseJSON _ = mempty

instance T.ToJSON Thumbnail where
  toJSON
    Thumbnail
      { file = file,
        height = height,
        width = width,
        format = format
      } =
      A.object
        [ "@type" A..= T.String "thumbnail",
          "file" A..= file,
          "height" A..= height,
          "width" A..= width,
          "format" A..= format
        ]
