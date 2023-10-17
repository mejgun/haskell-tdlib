module TD.Data.AutoDownloadSettings
  ( AutoDownloadSettings(..)    
  , defaultAutoDownloadSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AutoDownloadSettings
  = AutoDownloadSettings -- ^ Contains auto-download settings
    { is_auto_download_enabled :: Maybe Bool -- ^ True, if the auto-download is enabled
    , max_photo_file_size      :: Maybe Int  -- ^ The maximum size of a photo file to be auto-downloaded, in bytes
    , max_video_file_size      :: Maybe Int  -- ^ The maximum size of a video file to be auto-downloaded, in bytes
    , max_other_file_size      :: Maybe Int  -- ^ The maximum size of other file types to be auto-downloaded, in bytes
    , video_upload_bitrate     :: Maybe Int  -- ^ The maximum suggested bitrate for uploaded videos, in kbit/s
    , preload_large_videos     :: Maybe Bool -- ^ True, if the beginning of video files needs to be preloaded for instant playback
    , preload_next_audio       :: Maybe Bool -- ^ True, if the next audio track needs to be preloaded while the user is listening to an audio file
    , preload_stories          :: Maybe Bool -- ^ True, if stories needs to be preloaded
    , use_less_data_for_calls  :: Maybe Bool -- ^ True, if "use less data for calls" option needs to be enabled
    }
  deriving (Eq, Show)

instance I.ShortShow AutoDownloadSettings where
  shortShow AutoDownloadSettings
    { is_auto_download_enabled = is_auto_download_enabled_
    , max_photo_file_size      = max_photo_file_size_
    , max_video_file_size      = max_video_file_size_
    , max_other_file_size      = max_other_file_size_
    , video_upload_bitrate     = video_upload_bitrate_
    , preload_large_videos     = preload_large_videos_
    , preload_next_audio       = preload_next_audio_
    , preload_stories          = preload_stories_
    , use_less_data_for_calls  = use_less_data_for_calls_
    }
      = "AutoDownloadSettings"
        ++ I.cc
        [ "is_auto_download_enabled" `I.p` is_auto_download_enabled_
        , "max_photo_file_size"      `I.p` max_photo_file_size_
        , "max_video_file_size"      `I.p` max_video_file_size_
        , "max_other_file_size"      `I.p` max_other_file_size_
        , "video_upload_bitrate"     `I.p` video_upload_bitrate_
        , "preload_large_videos"     `I.p` preload_large_videos_
        , "preload_next_audio"       `I.p` preload_next_audio_
        , "preload_stories"          `I.p` preload_stories_
        , "use_less_data_for_calls"  `I.p` use_less_data_for_calls_
        ]

instance AT.FromJSON AutoDownloadSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "autoDownloadSettings" -> parseAutoDownloadSettings v
      _                      -> mempty
    
    where
      parseAutoDownloadSettings :: A.Value -> AT.Parser AutoDownloadSettings
      parseAutoDownloadSettings = A.withObject "AutoDownloadSettings" $ \o -> do
        is_auto_download_enabled_ <- o A..:?  "is_auto_download_enabled"
        max_photo_file_size_      <- o A..:?  "max_photo_file_size"
        max_video_file_size_      <- o A..:?  "max_video_file_size"
        max_other_file_size_      <- o A..:?  "max_other_file_size"
        video_upload_bitrate_     <- o A..:?  "video_upload_bitrate"
        preload_large_videos_     <- o A..:?  "preload_large_videos"
        preload_next_audio_       <- o A..:?  "preload_next_audio"
        preload_stories_          <- o A..:?  "preload_stories"
        use_less_data_for_calls_  <- o A..:?  "use_less_data_for_calls"
        pure $ AutoDownloadSettings
          { is_auto_download_enabled = is_auto_download_enabled_
          , max_photo_file_size      = max_photo_file_size_
          , max_video_file_size      = max_video_file_size_
          , max_other_file_size      = max_other_file_size_
          , video_upload_bitrate     = video_upload_bitrate_
          , preload_large_videos     = preload_large_videos_
          , preload_next_audio       = preload_next_audio_
          , preload_stories          = preload_stories_
          , use_less_data_for_calls  = use_less_data_for_calls_
          }
  parseJSON _ = mempty

instance AT.ToJSON AutoDownloadSettings where
  toJSON AutoDownloadSettings
    { is_auto_download_enabled = is_auto_download_enabled_
    , max_photo_file_size      = max_photo_file_size_
    , max_video_file_size      = max_video_file_size_
    , max_other_file_size      = max_other_file_size_
    , video_upload_bitrate     = video_upload_bitrate_
    , preload_large_videos     = preload_large_videos_
    , preload_next_audio       = preload_next_audio_
    , preload_stories          = preload_stories_
    , use_less_data_for_calls  = use_less_data_for_calls_
    }
      = A.object
        [ "@type"                    A..= AT.String "autoDownloadSettings"
        , "is_auto_download_enabled" A..= is_auto_download_enabled_
        , "max_photo_file_size"      A..= max_photo_file_size_
        , "max_video_file_size"      A..= max_video_file_size_
        , "max_other_file_size"      A..= max_other_file_size_
        , "video_upload_bitrate"     A..= video_upload_bitrate_
        , "preload_large_videos"     A..= preload_large_videos_
        , "preload_next_audio"       A..= preload_next_audio_
        , "preload_stories"          A..= preload_stories_
        , "use_less_data_for_calls"  A..= use_less_data_for_calls_
        ]

defaultAutoDownloadSettings :: AutoDownloadSettings
defaultAutoDownloadSettings =
  AutoDownloadSettings
    { is_auto_download_enabled = Nothing
    , max_photo_file_size      = Nothing
    , max_video_file_size      = Nothing
    , max_other_file_size      = Nothing
    , video_upload_bitrate     = Nothing
    , preload_large_videos     = Nothing
    , preload_next_audio       = Nothing
    , preload_stories          = Nothing
    , use_less_data_for_calls  = Nothing
    }

