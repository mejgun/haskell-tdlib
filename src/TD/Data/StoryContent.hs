module TD.Data.StoryContent
  (StoryContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Photo as Photo
import qualified TD.Data.StoryVideo as StoryVideo

-- | Contains the content of a story
data StoryContent
  = StoryContentPhoto -- ^ A photo story
    { photo :: Maybe Photo.Photo -- ^ The photo
    }
  | StoryContentVideo -- ^ A video story
    { video             :: Maybe StoryVideo.StoryVideo -- ^ The video in MPEG4 format
    , alternative_video :: Maybe StoryVideo.StoryVideo -- ^ Alternative version of the video in MPEG4 format, encoded with H.264 codec; may be null
    }
  | StoryContentLive -- ^ A live story
    { group_call_id  :: Maybe Int  -- ^ Identifier of the corresponding group call. The group call can be received through the method getGroupCall
    , is_rtmp_stream :: Maybe Bool -- ^ True, if the call is an RTMP stream instead of an ordinary group call
    }
  | StoryContentUnsupported -- ^ A story content that is not supported in the current TDLib version
  deriving (Eq, Show)

instance I.ShortShow StoryContent where
  shortShow StoryContentPhoto
    { photo = photo_
    }
      = "StoryContentPhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow StoryContentVideo
    { video             = video_
    , alternative_video = alternative_video_
    }
      = "StoryContentVideo"
        ++ I.cc
        [ "video"             `I.p` video_
        , "alternative_video" `I.p` alternative_video_
        ]
  shortShow StoryContentLive
    { group_call_id  = group_call_id_
    , is_rtmp_stream = is_rtmp_stream_
    }
      = "StoryContentLive"
        ++ I.cc
        [ "group_call_id"  `I.p` group_call_id_
        , "is_rtmp_stream" `I.p` is_rtmp_stream_
        ]
  shortShow StoryContentUnsupported
      = "StoryContentUnsupported"

instance AT.FromJSON StoryContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyContentPhoto"       -> parseStoryContentPhoto v
      "storyContentVideo"       -> parseStoryContentVideo v
      "storyContentLive"        -> parseStoryContentLive v
      "storyContentUnsupported" -> pure StoryContentUnsupported
      _                         -> mempty
    
    where
      parseStoryContentPhoto :: A.Value -> AT.Parser StoryContent
      parseStoryContentPhoto = A.withObject "StoryContentPhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ StoryContentPhoto
          { photo = photo_
          }
      parseStoryContentVideo :: A.Value -> AT.Parser StoryContent
      parseStoryContentVideo = A.withObject "StoryContentVideo" $ \o -> do
        video_             <- o A..:?  "video"
        alternative_video_ <- o A..:?  "alternative_video"
        pure $ StoryContentVideo
          { video             = video_
          , alternative_video = alternative_video_
          }
      parseStoryContentLive :: A.Value -> AT.Parser StoryContent
      parseStoryContentLive = A.withObject "StoryContentLive" $ \o -> do
        group_call_id_  <- o A..:?  "group_call_id"
        is_rtmp_stream_ <- o A..:?  "is_rtmp_stream"
        pure $ StoryContentLive
          { group_call_id  = group_call_id_
          , is_rtmp_stream = is_rtmp_stream_
          }
  parseJSON _ = mempty

