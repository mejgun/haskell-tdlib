-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AutoDownloadSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AutoDownloadSettings = 
 AutoDownloadSettings { use_less_data_for_calls :: Maybe Bool, preload_next_audio :: Maybe Bool, preload_large_videos :: Maybe Bool, video_upload_bitrate :: Maybe Int, max_other_file_size :: Maybe Int, max_video_file_size :: Maybe Int, max_photo_file_size :: Maybe Int, is_auto_download_enabled :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON AutoDownloadSettings where
 toJSON (AutoDownloadSettings { use_less_data_for_calls = use_less_data_for_calls, preload_next_audio = preload_next_audio, preload_large_videos = preload_large_videos, video_upload_bitrate = video_upload_bitrate, max_other_file_size = max_other_file_size, max_video_file_size = max_video_file_size, max_photo_file_size = max_photo_file_size, is_auto_download_enabled = is_auto_download_enabled }) =
  A.object [ "@type" A..= T.String "autoDownloadSettings", "use_less_data_for_calls" A..= use_less_data_for_calls, "preload_next_audio" A..= preload_next_audio, "preload_large_videos" A..= preload_large_videos, "video_upload_bitrate" A..= video_upload_bitrate, "max_other_file_size" A..= max_other_file_size, "max_video_file_size" A..= max_video_file_size, "max_photo_file_size" A..= max_photo_file_size, "is_auto_download_enabled" A..= is_auto_download_enabled ]

instance T.FromJSON AutoDownloadSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "autoDownloadSettings" -> parseAutoDownloadSettings v
   _ -> mempty
  where
   parseAutoDownloadSettings :: A.Value -> T.Parser AutoDownloadSettings
   parseAutoDownloadSettings = A.withObject "AutoDownloadSettings" $ \o -> do
    use_less_data_for_calls <- o A..:? "use_less_data_for_calls"
    preload_next_audio <- o A..:? "preload_next_audio"
    preload_large_videos <- o A..:? "preload_large_videos"
    video_upload_bitrate <- mconcat [ o A..:? "video_upload_bitrate", readMaybe <$> (o A..: "video_upload_bitrate" :: T.Parser String)] :: T.Parser (Maybe Int)
    max_other_file_size <- mconcat [ o A..:? "max_other_file_size", readMaybe <$> (o A..: "max_other_file_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    max_video_file_size <- mconcat [ o A..:? "max_video_file_size", readMaybe <$> (o A..: "max_video_file_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    max_photo_file_size <- mconcat [ o A..:? "max_photo_file_size", readMaybe <$> (o A..: "max_photo_file_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_auto_download_enabled <- o A..:? "is_auto_download_enabled"
    return $ AutoDownloadSettings { use_less_data_for_calls = use_less_data_for_calls, preload_next_audio = preload_next_audio, preload_large_videos = preload_large_videos, video_upload_bitrate = video_upload_bitrate, max_other_file_size = max_other_file_size, max_video_file_size = max_video_file_size, max_photo_file_size = max_photo_file_size, is_auto_download_enabled = is_auto_download_enabled }