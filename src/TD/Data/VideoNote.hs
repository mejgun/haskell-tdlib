{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.VideoNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data VideoNote = -- | Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format @duration Duration of the video, in seconds; as defined by the sender
  VideoNote
  { -- |
    video :: Maybe File.File,
    -- | Video thumbnail in JPEG format; as defined by the sender; may be null @video File containing the video
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- |
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | Video width and height; as defined by the sender @minithumbnail Video minithumbnail; may be null
    _length :: Maybe Int,
    -- |
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show VideoNote where
  show
    VideoNote
      { video = video_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        _length = _length_,
        duration = duration_
      } =
      "VideoNote"
        ++ U.cc
          [ U.p "video" video_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "_length" _length_,
            U.p "duration" duration_
          ]

instance T.FromJSON VideoNote where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "videoNote" -> parseVideoNote v
      _ -> mempty
    where
      parseVideoNote :: A.Value -> T.Parser VideoNote
      parseVideoNote = A.withObject "VideoNote" $ \o -> do
        video_ <- o A..:? "video"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        _length_ <- mconcat [o A..:? "length", U.rm <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ VideoNote {video = video_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, _length = _length_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON VideoNote where
  toJSON
    VideoNote
      { video = video_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        _length = _length_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "videoNote",
          "video" A..= video_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "length" A..= _length_,
          "duration" A..= duration_
        ]
