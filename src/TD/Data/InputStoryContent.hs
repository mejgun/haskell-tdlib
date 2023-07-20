{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputStoryContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- | The content of a story to send
data InputStoryContent
  = -- | A photo story
    InputStoryContentPhoto
      { -- | File identifiers of the stickers added to the photo, if applicable
        added_sticker_file_ids :: Maybe [Int],
        -- | Photo to send. The photo must be at most 10 MB in size. The photo size must be 720x1280
        photo :: Maybe InputFile.InputFile
      }
  | -- | A video story
    InputStoryContentVideo
      { -- | True, if the video has no sound
        is_animation :: Maybe Bool,
        -- | Precise duration of the video, in seconds; 0-60
        duration :: Maybe Float,
        -- | File identifiers of the stickers added to the video, if applicable
        added_sticker_file_ids :: Maybe [Int],
        -- | Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with x265 codec and key frames added each second
        video :: Maybe InputFile.InputFile
      }
  deriving (Eq)

instance Show InputStoryContent where
  show
    InputStoryContentPhoto
      { added_sticker_file_ids = added_sticker_file_ids_,
        photo = photo_
      } =
      "InputStoryContentPhoto"
        ++ U.cc
          [ U.p "added_sticker_file_ids" added_sticker_file_ids_,
            U.p "photo" photo_
          ]
  show
    InputStoryContentVideo
      { is_animation = is_animation_,
        duration = duration_,
        added_sticker_file_ids = added_sticker_file_ids_,
        video = video_
      } =
      "InputStoryContentVideo"
        ++ U.cc
          [ U.p "is_animation" is_animation_,
            U.p "duration" duration_,
            U.p "added_sticker_file_ids" added_sticker_file_ids_,
            U.p "video" video_
          ]

instance T.FromJSON InputStoryContent where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputStoryContentPhoto" -> parseInputStoryContentPhoto v
      "inputStoryContentVideo" -> parseInputStoryContentVideo v
      _ -> mempty
    where
      parseInputStoryContentPhoto :: A.Value -> T.Parser InputStoryContent
      parseInputStoryContentPhoto = A.withObject "InputStoryContentPhoto" $ \o -> do
        added_sticker_file_ids_ <- o A..:? "added_sticker_file_ids"
        photo_ <- o A..:? "photo"
        return $ InputStoryContentPhoto {added_sticker_file_ids = added_sticker_file_ids_, photo = photo_}

      parseInputStoryContentVideo :: A.Value -> T.Parser InputStoryContent
      parseInputStoryContentVideo = A.withObject "InputStoryContentVideo" $ \o -> do
        is_animation_ <- o A..:? "is_animation"
        duration_ <- o A..:? "duration"
        added_sticker_file_ids_ <- o A..:? "added_sticker_file_ids"
        video_ <- o A..:? "video"
        return $ InputStoryContentVideo {is_animation = is_animation_, duration = duration_, added_sticker_file_ids = added_sticker_file_ids_, video = video_}
  parseJSON _ = mempty

instance T.ToJSON InputStoryContent where
  toJSON
    InputStoryContentPhoto
      { added_sticker_file_ids = added_sticker_file_ids_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryContentPhoto",
          "added_sticker_file_ids" A..= added_sticker_file_ids_,
          "photo" A..= photo_
        ]
  toJSON
    InputStoryContentVideo
      { is_animation = is_animation_,
        duration = duration_,
        added_sticker_file_ids = added_sticker_file_ids_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryContentVideo",
          "is_animation" A..= is_animation_,
          "duration" A..= duration_,
          "added_sticker_file_ids" A..= added_sticker_file_ids_,
          "video" A..= video_
        ]
