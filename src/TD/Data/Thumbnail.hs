{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Thumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.ThumbnailFormat as ThumbnailFormat
import qualified Utils as U

-- |
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
      { file = file_,
        height = height_,
        width = width_,
        format = format_
      } =
      "Thumbnail"
        ++ U.cc
          [ U.p "file" file_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "format" format_
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
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        format_ <- o A..:? "format"
        return $ Thumbnail {file = file_, height = height_, width = width_, format = format_}
  parseJSON _ = mempty

instance T.ToJSON Thumbnail where
  toJSON
    Thumbnail
      { file = file_,
        height = height_,
        width = width_,
        format = format_
      } =
      A.object
        [ "@type" A..= T.String "thumbnail",
          "file" A..= file_,
          "height" A..= height_,
          "width" A..= width_,
          "format" A..= format_
        ]
