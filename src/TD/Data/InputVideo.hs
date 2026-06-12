module TD.Data.InputVideo
  ( InputVideo(..)    
  , defaultInputVideo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputVideo
  = InputVideo -- ^ A video to be sent
    { video                  :: Maybe InputFile.InputFile           -- ^ Video file to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender
    , thumbnail              :: Maybe InputThumbnail.InputThumbnail -- ^ Video thumbnail; pass null to skip thumbnail uploading
    , cover                  :: Maybe InputFile.InputFile           -- ^ Cover of the video; pass null to skip cover uploading; not supported in secret chats and for self-destructing messages
    , start_timestamp        :: Maybe Int                           -- ^ Timestamp from which the video playing must start, in seconds
    , added_sticker_file_ids :: Maybe [Int]                         -- ^ File identifiers of the stickers added to the video, if applicable
    , duration               :: Maybe Int                           -- ^ Duration of the video, in seconds
    , width                  :: Maybe Int                           -- ^ Video width
    , height                 :: Maybe Int                           -- ^ Video height
    , supports_streaming     :: Maybe Bool                          -- ^ True, if the video is expected to be streamed
    }
  deriving (Eq, Show)

instance I.ShortShow InputVideo where
  shortShow InputVideo
    { video                  = video_
    , thumbnail              = thumbnail_
    , cover                  = cover_
    , start_timestamp        = start_timestamp_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , width                  = width_
    , height                 = height_
    , supports_streaming     = supports_streaming_
    }
      = "InputVideo"
        ++ I.cc
        [ "video"                  `I.p` video_
        , "thumbnail"              `I.p` thumbnail_
        , "cover"                  `I.p` cover_
        , "start_timestamp"        `I.p` start_timestamp_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        , "duration"               `I.p` duration_
        , "width"                  `I.p` width_
        , "height"                 `I.p` height_
        , "supports_streaming"     `I.p` supports_streaming_
        ]

instance AT.FromJSON InputVideo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputVideo" -> parseInputVideo v
      _            -> mempty
    
    where
      parseInputVideo :: A.Value -> AT.Parser InputVideo
      parseInputVideo = A.withObject "InputVideo" $ \o -> do
        video_                  <- o A..:?  "video"
        thumbnail_              <- o A..:?  "thumbnail"
        cover_                  <- o A..:?  "cover"
        start_timestamp_        <- o A..:?  "start_timestamp"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        duration_               <- o A..:?  "duration"
        width_                  <- o A..:?  "width"
        height_                 <- o A..:?  "height"
        supports_streaming_     <- o A..:?  "supports_streaming"
        pure $ InputVideo
          { video                  = video_
          , thumbnail              = thumbnail_
          , cover                  = cover_
          , start_timestamp        = start_timestamp_
          , added_sticker_file_ids = added_sticker_file_ids_
          , duration               = duration_
          , width                  = width_
          , height                 = height_
          , supports_streaming     = supports_streaming_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputVideo where
  toJSON InputVideo
    { video                  = video_
    , thumbnail              = thumbnail_
    , cover                  = cover_
    , start_timestamp        = start_timestamp_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , width                  = width_
    , height                 = height_
    , supports_streaming     = supports_streaming_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputVideo"
        , "video"                  A..= video_
        , "thumbnail"              A..= thumbnail_
        , "cover"                  A..= cover_
        , "start_timestamp"        A..= start_timestamp_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        , "duration"               A..= duration_
        , "width"                  A..= width_
        , "height"                 A..= height_
        , "supports_streaming"     A..= supports_streaming_
        ]

defaultInputVideo :: InputVideo
defaultInputVideo =
  InputVideo
    { video                  = Nothing
    , thumbnail              = Nothing
    , cover                  = Nothing
    , start_timestamp        = Nothing
    , added_sticker_file_ids = Nothing
    , duration               = Nothing
    , width                  = Nothing
    , height                 = Nothing
    , supports_streaming     = Nothing
    }

