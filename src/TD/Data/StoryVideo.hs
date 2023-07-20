{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryVideo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data StoryVideo = -- | Describes a video file sent in a story
  StoryVideo
  { -- | File containing the video
    video :: Maybe File.File,
    -- | Size of file prefix, which is supposed to be preloaded, in bytes
    preload_prefix_size :: Maybe Int,
    -- | Video thumbnail in JPEG or MPEG4 format; may be null
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Video minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | True, if the video has no sound
    is_animation :: Maybe Bool,
    -- | True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
    has_stickers :: Maybe Bool,
    -- | Video height
    height :: Maybe Int,
    -- | Video width
    width :: Maybe Int,
    -- | Duration of the video, in seconds
    duration :: Maybe Float
  }
  deriving (Eq)

instance Show StoryVideo where
  show
    StoryVideo
      { video = video_,
        preload_prefix_size = preload_prefix_size_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        is_animation = is_animation_,
        has_stickers = has_stickers_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      "StoryVideo"
        ++ U.cc
          [ U.p "video" video_,
            U.p "preload_prefix_size" preload_prefix_size_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "is_animation" is_animation_,
            U.p "has_stickers" has_stickers_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "duration" duration_
          ]

instance T.FromJSON StoryVideo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyVideo" -> parseStoryVideo v
      _ -> mempty
    where
      parseStoryVideo :: A.Value -> T.Parser StoryVideo
      parseStoryVideo = A.withObject "StoryVideo" $ \o -> do
        video_ <- o A..:? "video"
        preload_prefix_size_ <- o A..:? "preload_prefix_size"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        is_animation_ <- o A..:? "is_animation"
        has_stickers_ <- o A..:? "has_stickers"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        duration_ <- o A..:? "duration"
        return $ StoryVideo {video = video_, preload_prefix_size = preload_prefix_size_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, is_animation = is_animation_, has_stickers = has_stickers_, height = height_, width = width_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON StoryVideo where
  toJSON
    StoryVideo
      { video = video_,
        preload_prefix_size = preload_prefix_size_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        is_animation = is_animation_,
        has_stickers = has_stickers_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "storyVideo",
          "video" A..= video_,
          "preload_prefix_size" A..= preload_prefix_size_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "is_animation" A..= is_animation_,
          "has_stickers" A..= has_stickers_,
          "height" A..= height_,
          "width" A..= width_,
          "duration" A..= duration_
        ]
