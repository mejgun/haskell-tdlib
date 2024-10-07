module TD.Data.Video
  (Video(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Video
  = Video -- ^ Describes a video file
    { duration           :: Maybe Int                         -- ^ Duration of the video, in seconds; as defined by the sender
    , width              :: Maybe Int                         -- ^ Video width; as defined by the sender
    , height             :: Maybe Int                         -- ^ Video height; as defined by the sender
    , file_name          :: Maybe T.Text                      -- ^ Original name of the file; as defined by the sender
    , mime_type          :: Maybe T.Text                      -- ^ MIME type of the file; as defined by the sender
    , has_stickers       :: Maybe Bool                        -- ^ True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
    , supports_streaming :: Maybe Bool                        -- ^ True, if the video is expected to be streamed
    , minithumbnail      :: Maybe Minithumbnail.Minithumbnail -- ^ Video minithumbnail; may be null
    , thumbnail          :: Maybe Thumbnail.Thumbnail         -- ^ Video thumbnail in JPEG or MPEG4 format; as defined by the sender; may be null
    , video              :: Maybe File.File                   -- ^ File containing the video
    }
  deriving (Eq, Show)

instance I.ShortShow Video where
  shortShow Video
    { duration           = duration_
    , width              = width_
    , height             = height_
    , file_name          = file_name_
    , mime_type          = mime_type_
    , has_stickers       = has_stickers_
    , supports_streaming = supports_streaming_
    , minithumbnail      = minithumbnail_
    , thumbnail          = thumbnail_
    , video              = video_
    }
      = "Video"
        ++ I.cc
        [ "duration"           `I.p` duration_
        , "width"              `I.p` width_
        , "height"             `I.p` height_
        , "file_name"          `I.p` file_name_
        , "mime_type"          `I.p` mime_type_
        , "has_stickers"       `I.p` has_stickers_
        , "supports_streaming" `I.p` supports_streaming_
        , "minithumbnail"      `I.p` minithumbnail_
        , "thumbnail"          `I.p` thumbnail_
        , "video"              `I.p` video_
        ]

instance AT.FromJSON Video where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "video" -> parseVideo v
      _       -> mempty
    
    where
      parseVideo :: A.Value -> AT.Parser Video
      parseVideo = A.withObject "Video" $ \o -> do
        duration_           <- o A..:?  "duration"
        width_              <- o A..:?  "width"
        height_             <- o A..:?  "height"
        file_name_          <- o A..:?  "file_name"
        mime_type_          <- o A..:?  "mime_type"
        has_stickers_       <- o A..:?  "has_stickers"
        supports_streaming_ <- o A..:?  "supports_streaming"
        minithumbnail_      <- o A..:?  "minithumbnail"
        thumbnail_          <- o A..:?  "thumbnail"
        video_              <- o A..:?  "video"
        pure $ Video
          { duration           = duration_
          , width              = width_
          , height             = height_
          , file_name          = file_name_
          , mime_type          = mime_type_
          , has_stickers       = has_stickers_
          , supports_streaming = supports_streaming_
          , minithumbnail      = minithumbnail_
          , thumbnail          = thumbnail_
          , video              = video_
          }
  parseJSON _ = mempty

