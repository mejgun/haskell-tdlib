{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AutoDownloadSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data AutoDownloadSettings = -- | Contains auto-download settings
  AutoDownloadSettings
  { -- | True, if "use less data for calls" option needs to be enabled
    use_less_data_for_calls :: Maybe Bool,
    -- | True, if stories needs to be preloaded
    preload_stories :: Maybe Bool,
    -- | True, if the next audio track needs to be preloaded while the user is listening to an audio file
    preload_next_audio :: Maybe Bool,
    -- | True, if the beginning of video files needs to be preloaded for instant playback
    preload_large_videos :: Maybe Bool,
    -- | The maximum suggested bitrate for uploaded videos, in kbit/s
    video_upload_bitrate :: Maybe Int,
    -- | The maximum size of other file types to be auto-downloaded, in bytes
    max_other_file_size :: Maybe Int,
    -- | The maximum size of a video file to be auto-downloaded, in bytes
    max_video_file_size :: Maybe Int,
    -- | The maximum size of a photo file to be auto-downloaded, in bytes
    max_photo_file_size :: Maybe Int,
    -- | True, if the auto-download is enabled
    is_auto_download_enabled :: Maybe Bool
  }
  deriving (Eq)

instance Show AutoDownloadSettings where
  show
    AutoDownloadSettings
      { use_less_data_for_calls = use_less_data_for_calls_,
        preload_stories = preload_stories_,
        preload_next_audio = preload_next_audio_,
        preload_large_videos = preload_large_videos_,
        video_upload_bitrate = video_upload_bitrate_,
        max_other_file_size = max_other_file_size_,
        max_video_file_size = max_video_file_size_,
        max_photo_file_size = max_photo_file_size_,
        is_auto_download_enabled = is_auto_download_enabled_
      } =
      "AutoDownloadSettings"
        ++ U.cc
          [ U.p "use_less_data_for_calls" use_less_data_for_calls_,
            U.p "preload_stories" preload_stories_,
            U.p "preload_next_audio" preload_next_audio_,
            U.p "preload_large_videos" preload_large_videos_,
            U.p "video_upload_bitrate" video_upload_bitrate_,
            U.p "max_other_file_size" max_other_file_size_,
            U.p "max_video_file_size" max_video_file_size_,
            U.p "max_photo_file_size" max_photo_file_size_,
            U.p "is_auto_download_enabled" is_auto_download_enabled_
          ]

instance T.FromJSON AutoDownloadSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "autoDownloadSettings" -> parseAutoDownloadSettings v
      _ -> mempty
    where
      parseAutoDownloadSettings :: A.Value -> T.Parser AutoDownloadSettings
      parseAutoDownloadSettings = A.withObject "AutoDownloadSettings" $ \o -> do
        use_less_data_for_calls_ <- o A..:? "use_less_data_for_calls"
        preload_stories_ <- o A..:? "preload_stories"
        preload_next_audio_ <- o A..:? "preload_next_audio"
        preload_large_videos_ <- o A..:? "preload_large_videos"
        video_upload_bitrate_ <- o A..:? "video_upload_bitrate"
        max_other_file_size_ <- o A..:? "max_other_file_size"
        max_video_file_size_ <- o A..:? "max_video_file_size"
        max_photo_file_size_ <- o A..:? "max_photo_file_size"
        is_auto_download_enabled_ <- o A..:? "is_auto_download_enabled"
        return $ AutoDownloadSettings {use_less_data_for_calls = use_less_data_for_calls_, preload_stories = preload_stories_, preload_next_audio = preload_next_audio_, preload_large_videos = preload_large_videos_, video_upload_bitrate = video_upload_bitrate_, max_other_file_size = max_other_file_size_, max_video_file_size = max_video_file_size_, max_photo_file_size = max_photo_file_size_, is_auto_download_enabled = is_auto_download_enabled_}
  parseJSON _ = mempty

instance T.ToJSON AutoDownloadSettings where
  toJSON
    AutoDownloadSettings
      { use_less_data_for_calls = use_less_data_for_calls_,
        preload_stories = preload_stories_,
        preload_next_audio = preload_next_audio_,
        preload_large_videos = preload_large_videos_,
        video_upload_bitrate = video_upload_bitrate_,
        max_other_file_size = max_other_file_size_,
        max_video_file_size = max_video_file_size_,
        max_photo_file_size = max_photo_file_size_,
        is_auto_download_enabled = is_auto_download_enabled_
      } =
      A.object
        [ "@type" A..= T.String "autoDownloadSettings",
          "use_less_data_for_calls" A..= use_less_data_for_calls_,
          "preload_stories" A..= preload_stories_,
          "preload_next_audio" A..= preload_next_audio_,
          "preload_large_videos" A..= preload_large_videos_,
          "video_upload_bitrate" A..= video_upload_bitrate_,
          "max_other_file_size" A..= max_other_file_size_,
          "max_video_file_size" A..= max_video_file_size_,
          "max_photo_file_size" A..= max_photo_file_size_,
          "is_auto_download_enabled" A..= is_auto_download_enabled_
        ]
