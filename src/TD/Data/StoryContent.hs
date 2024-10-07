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
  shortShow StoryContentUnsupported
      = "StoryContentUnsupported"

instance AT.FromJSON StoryContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyContentPhoto"       -> parseStoryContentPhoto v
      "storyContentVideo"       -> parseStoryContentVideo v
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
  parseJSON _ = mempty

