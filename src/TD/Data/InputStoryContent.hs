module TD.Data.InputStoryContent
  (InputStoryContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | The content of a story to send
data InputStoryContent
  = InputStoryContentPhoto -- ^ A photo story
    { photo                  :: Maybe InputFile.InputFile -- ^ Photo to send. The photo must be at most 10 MB in size. The photo size must be 1080x1920
    , added_sticker_file_ids :: Maybe [Int]               -- ^ File identifiers of the stickers added to the photo, if applicable
    }
  | InputStoryContentVideo -- ^ A video story
    { video                  :: Maybe InputFile.InputFile -- ^ Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with H.265 codec and key frames added each second
    , added_sticker_file_ids :: Maybe [Int]               -- ^ File identifiers of the stickers added to the video, if applicable
    , duration               :: Maybe Double              -- ^ Precise duration of the video, in seconds; 0-60
    , cover_frame_timestamp  :: Maybe Double              -- ^ Timestamp of the frame, which will be used as video thumbnail
    , is_animation           :: Maybe Bool                -- ^ True, if the video has no sound
    }
  deriving (Eq, Show)

instance I.ShortShow InputStoryContent where
  shortShow InputStoryContentPhoto
    { photo                  = photo_
    , added_sticker_file_ids = added_sticker_file_ids_
    }
      = "InputStoryContentPhoto"
        ++ I.cc
        [ "photo"                  `I.p` photo_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        ]
  shortShow InputStoryContentVideo
    { video                  = video_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , cover_frame_timestamp  = cover_frame_timestamp_
    , is_animation           = is_animation_
    }
      = "InputStoryContentVideo"
        ++ I.cc
        [ "video"                  `I.p` video_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        , "duration"               `I.p` duration_
        , "cover_frame_timestamp"  `I.p` cover_frame_timestamp_
        , "is_animation"           `I.p` is_animation_
        ]

instance AT.FromJSON InputStoryContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputStoryContentPhoto" -> parseInputStoryContentPhoto v
      "inputStoryContentVideo" -> parseInputStoryContentVideo v
      _                        -> mempty
    
    where
      parseInputStoryContentPhoto :: A.Value -> AT.Parser InputStoryContent
      parseInputStoryContentPhoto = A.withObject "InputStoryContentPhoto" $ \o -> do
        photo_                  <- o A..:?  "photo"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        pure $ InputStoryContentPhoto
          { photo                  = photo_
          , added_sticker_file_ids = added_sticker_file_ids_
          }
      parseInputStoryContentVideo :: A.Value -> AT.Parser InputStoryContent
      parseInputStoryContentVideo = A.withObject "InputStoryContentVideo" $ \o -> do
        video_                  <- o A..:?  "video"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        duration_               <- o A..:?  "duration"
        cover_frame_timestamp_  <- o A..:?  "cover_frame_timestamp"
        is_animation_           <- o A..:?  "is_animation"
        pure $ InputStoryContentVideo
          { video                  = video_
          , added_sticker_file_ids = added_sticker_file_ids_
          , duration               = duration_
          , cover_frame_timestamp  = cover_frame_timestamp_
          , is_animation           = is_animation_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputStoryContent where
  toJSON InputStoryContentPhoto
    { photo                  = photo_
    , added_sticker_file_ids = added_sticker_file_ids_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputStoryContentPhoto"
        , "photo"                  A..= photo_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        ]
  toJSON InputStoryContentVideo
    { video                  = video_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , cover_frame_timestamp  = cover_frame_timestamp_
    , is_animation           = is_animation_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputStoryContentVideo"
        , "video"                  A..= video_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        , "duration"               A..= duration_
        , "cover_frame_timestamp"  A..= cover_frame_timestamp_
        , "is_animation"           A..= is_animation_
        ]

