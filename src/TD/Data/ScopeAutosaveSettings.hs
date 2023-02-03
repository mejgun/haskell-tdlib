{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ScopeAutosaveSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ScopeAutosaveSettings = -- | Contains autosave settings for an autosave settings scope
  ScopeAutosaveSettings
  { -- | The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB
    max_video_file_size :: Maybe Int,
    -- | True, if video autosave is enabled
    autosave_videos :: Maybe Bool,
    -- | True, if photo autosave is enabled
    autosave_photos :: Maybe Bool
  }
  deriving (Eq)

instance Show ScopeAutosaveSettings where
  show
    ScopeAutosaveSettings
      { max_video_file_size = max_video_file_size_,
        autosave_videos = autosave_videos_,
        autosave_photos = autosave_photos_
      } =
      "ScopeAutosaveSettings"
        ++ U.cc
          [ U.p "max_video_file_size" max_video_file_size_,
            U.p "autosave_videos" autosave_videos_,
            U.p "autosave_photos" autosave_photos_
          ]

instance T.FromJSON ScopeAutosaveSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "scopeAutosaveSettings" -> parseScopeAutosaveSettings v
      _ -> mempty
    where
      parseScopeAutosaveSettings :: A.Value -> T.Parser ScopeAutosaveSettings
      parseScopeAutosaveSettings = A.withObject "ScopeAutosaveSettings" $ \o -> do
        max_video_file_size_ <- o A..:? "max_video_file_size"
        autosave_videos_ <- o A..:? "autosave_videos"
        autosave_photos_ <- o A..:? "autosave_photos"
        return $ ScopeAutosaveSettings {max_video_file_size = max_video_file_size_, autosave_videos = autosave_videos_, autosave_photos = autosave_photos_}
  parseJSON _ = mempty

instance T.ToJSON ScopeAutosaveSettings where
  toJSON
    ScopeAutosaveSettings
      { max_video_file_size = max_video_file_size_,
        autosave_videos = autosave_videos_,
        autosave_photos = autosave_photos_
      } =
      A.object
        [ "@type" A..= T.String "scopeAutosaveSettings",
          "max_video_file_size" A..= max_video_file_size_,
          "autosave_videos" A..= autosave_videos_,
          "autosave_photos" A..= autosave_photos_
        ]
