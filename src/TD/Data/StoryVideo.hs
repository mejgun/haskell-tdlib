module TD.Data.StoryVideo
  (StoryVideo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data StoryVideo
  = StoryVideo -- ^ Describes a video file sent in a story
    { duration              :: Maybe Double                      -- ^ Duration of the video, in seconds
    , width                 :: Maybe Int                         -- ^ Video width
    , height                :: Maybe Int                         -- ^ Video height
    , has_stickers          :: Maybe Bool                        -- ^ True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
    , is_animation          :: Maybe Bool                        -- ^ True, if the video has no sound
    , minithumbnail         :: Maybe Minithumbnail.Minithumbnail -- ^ Video minithumbnail; may be null
    , thumbnail             :: Maybe Thumbnail.Thumbnail         -- ^ Video thumbnail in JPEG or MPEG4 format; may be null
    , preload_prefix_size   :: Maybe Int                         -- ^ Size of file prefix, which is expected to be preloaded, in bytes
    , cover_frame_timestamp :: Maybe Double                      -- ^ Timestamp of the frame used as video thumbnail
    , video                 :: Maybe File.File                   -- ^ File containing the video
    }
  deriving (Eq, Show)

instance I.ShortShow StoryVideo where
  shortShow StoryVideo
    { duration              = duration_
    , width                 = width_
    , height                = height_
    , has_stickers          = has_stickers_
    , is_animation          = is_animation_
    , minithumbnail         = minithumbnail_
    , thumbnail             = thumbnail_
    , preload_prefix_size   = preload_prefix_size_
    , cover_frame_timestamp = cover_frame_timestamp_
    , video                 = video_
    }
      = "StoryVideo"
        ++ I.cc
        [ "duration"              `I.p` duration_
        , "width"                 `I.p` width_
        , "height"                `I.p` height_
        , "has_stickers"          `I.p` has_stickers_
        , "is_animation"          `I.p` is_animation_
        , "minithumbnail"         `I.p` minithumbnail_
        , "thumbnail"             `I.p` thumbnail_
        , "preload_prefix_size"   `I.p` preload_prefix_size_
        , "cover_frame_timestamp" `I.p` cover_frame_timestamp_
        , "video"                 `I.p` video_
        ]

instance AT.FromJSON StoryVideo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyVideo" -> parseStoryVideo v
      _            -> mempty
    
    where
      parseStoryVideo :: A.Value -> AT.Parser StoryVideo
      parseStoryVideo = A.withObject "StoryVideo" $ \o -> do
        duration_              <- o A..:?  "duration"
        width_                 <- o A..:?  "width"
        height_                <- o A..:?  "height"
        has_stickers_          <- o A..:?  "has_stickers"
        is_animation_          <- o A..:?  "is_animation"
        minithumbnail_         <- o A..:?  "minithumbnail"
        thumbnail_             <- o A..:?  "thumbnail"
        preload_prefix_size_   <- o A..:?  "preload_prefix_size"
        cover_frame_timestamp_ <- o A..:?  "cover_frame_timestamp"
        video_                 <- o A..:?  "video"
        pure $ StoryVideo
          { duration              = duration_
          , width                 = width_
          , height                = height_
          , has_stickers          = has_stickers_
          , is_animation          = is_animation_
          , minithumbnail         = minithumbnail_
          , thumbnail             = thumbnail_
          , preload_prefix_size   = preload_prefix_size_
          , cover_frame_timestamp = cover_frame_timestamp_
          , video                 = video_
          }
  parseJSON _ = mempty

