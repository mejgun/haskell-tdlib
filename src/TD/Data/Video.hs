{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Video where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data Video = -- | Describes a video file @duration Duration of the video, in seconds; as defined by the sender @width Video width; as defined by the sender @height Video height; as defined by the sender
  Video
  { -- |
    video :: Maybe File.File,
    -- | Video thumbnail in JPEG or MPEG4 format; as defined by the sender; may be null @video File containing the video
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- |
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | True, if the video is supposed to be streamed @minithumbnail Video minithumbnail; may be null
    supports_streaming :: Maybe Bool,
    -- | True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
    has_stickers :: Maybe Bool,
    -- |
    mime_type :: Maybe String,
    -- | Original name of the file; as defined by the sender @mime_type MIME type of the file; as defined by the sender
    file_name :: Maybe String,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int,
    -- |
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show Video where
  show
    Video
      { video = video_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        supports_streaming = supports_streaming_,
        has_stickers = has_stickers_,
        mime_type = mime_type_,
        file_name = file_name_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      "Video"
        ++ U.cc
          [ U.p "video" video_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "supports_streaming" supports_streaming_,
            U.p "has_stickers" has_stickers_,
            U.p "mime_type" mime_type_,
            U.p "file_name" file_name_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "duration" duration_
          ]

instance T.FromJSON Video where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "video" -> parseVideo v
      _ -> mempty
    where
      parseVideo :: A.Value -> T.Parser Video
      parseVideo = A.withObject "Video" $ \o -> do
        video_ <- o A..:? "video"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        supports_streaming_ <- o A..:? "supports_streaming"
        has_stickers_ <- o A..:? "has_stickers"
        mime_type_ <- o A..:? "mime_type"
        file_name_ <- o A..:? "file_name"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        duration_ <- o A..:? "duration"
        return $ Video {video = video_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, supports_streaming = supports_streaming_, has_stickers = has_stickers_, mime_type = mime_type_, file_name = file_name_, height = height_, width = width_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON Video where
  toJSON
    Video
      { video = video_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        supports_streaming = supports_streaming_,
        has_stickers = has_stickers_,
        mime_type = mime_type_,
        file_name = file_name_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "video",
          "video" A..= video_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "supports_streaming" A..= supports_streaming_,
          "has_stickers" A..= has_stickers_,
          "mime_type" A..= mime_type_,
          "file_name" A..= file_name_,
          "height" A..= height_,
          "width" A..= width_,
          "duration" A..= duration_
        ]
