{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Photo as Photo
import qualified TD.Data.StoryVideo as StoryVideo
import qualified Utils as U

-- | Contains the content of a story
data StoryContent
  = -- | A photo story @photo The photo
    StoryContentPhoto
      { -- |
        photo :: Maybe Photo.Photo
      }
  | -- | A video story @video The video in MPEG4 format @alternative_video Alternative version of the video in MPEG4 format, encoded by x264 codec; may be null
    StoryContentVideo
      { -- |
        alternative_video :: Maybe StoryVideo.StoryVideo,
        -- |
        video :: Maybe StoryVideo.StoryVideo
      }
  | -- | A story content that is not supported in the current TDLib version
    StoryContentUnsupported
  deriving (Eq)

instance Show StoryContent where
  show
    StoryContentPhoto
      { photo = photo_
      } =
      "StoryContentPhoto"
        ++ U.cc
          [ U.p "photo" photo_
          ]
  show
    StoryContentVideo
      { alternative_video = alternative_video_,
        video = video_
      } =
      "StoryContentVideo"
        ++ U.cc
          [ U.p "alternative_video" alternative_video_,
            U.p "video" video_
          ]
  show StoryContentUnsupported =
    "StoryContentUnsupported"
      ++ U.cc
        []

instance T.FromJSON StoryContent where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyContentPhoto" -> parseStoryContentPhoto v
      "storyContentVideo" -> parseStoryContentVideo v
      "storyContentUnsupported" -> parseStoryContentUnsupported v
      _ -> mempty
    where
      parseStoryContentPhoto :: A.Value -> T.Parser StoryContent
      parseStoryContentPhoto = A.withObject "StoryContentPhoto" $ \o -> do
        photo_ <- o A..:? "photo"
        return $ StoryContentPhoto {photo = photo_}

      parseStoryContentVideo :: A.Value -> T.Parser StoryContent
      parseStoryContentVideo = A.withObject "StoryContentVideo" $ \o -> do
        alternative_video_ <- o A..:? "alternative_video"
        video_ <- o A..:? "video"
        return $ StoryContentVideo {alternative_video = alternative_video_, video = video_}

      parseStoryContentUnsupported :: A.Value -> T.Parser StoryContent
      parseStoryContentUnsupported = A.withObject "StoryContentUnsupported" $ \_ -> return StoryContentUnsupported
  parseJSON _ = mempty

instance T.ToJSON StoryContent where
  toJSON
    StoryContentPhoto
      { photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "storyContentPhoto",
          "photo" A..= photo_
        ]
  toJSON
    StoryContentVideo
      { alternative_video = alternative_video_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "storyContentVideo",
          "alternative_video" A..= alternative_video_,
          "video" A..= video_
        ]
  toJSON StoryContentUnsupported =
    A.object
      [ "@type" A..= T.String "storyContentUnsupported"
      ]
