module TD.Data.ScopeAutosaveSettings
  ( ScopeAutosaveSettings(..)    
  , defaultScopeAutosaveSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ScopeAutosaveSettings
  = ScopeAutosaveSettings -- ^ Contains autosave settings for an autosave settings scope
    { autosave_photos     :: Maybe Bool -- ^ True, if photo autosave is enabled
    , autosave_videos     :: Maybe Bool -- ^ True, if video autosave is enabled
    , max_video_file_size :: Maybe Int  -- ^ The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB
    }
  deriving (Eq, Show)

instance I.ShortShow ScopeAutosaveSettings where
  shortShow ScopeAutosaveSettings
    { autosave_photos     = autosave_photos_
    , autosave_videos     = autosave_videos_
    , max_video_file_size = max_video_file_size_
    }
      = "ScopeAutosaveSettings"
        ++ I.cc
        [ "autosave_photos"     `I.p` autosave_photos_
        , "autosave_videos"     `I.p` autosave_videos_
        , "max_video_file_size" `I.p` max_video_file_size_
        ]

instance AT.FromJSON ScopeAutosaveSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "scopeAutosaveSettings" -> parseScopeAutosaveSettings v
      _                       -> mempty
    
    where
      parseScopeAutosaveSettings :: A.Value -> AT.Parser ScopeAutosaveSettings
      parseScopeAutosaveSettings = A.withObject "ScopeAutosaveSettings" $ \o -> do
        autosave_photos_     <- o A..:?  "autosave_photos"
        autosave_videos_     <- o A..:?  "autosave_videos"
        max_video_file_size_ <- o A..:?  "max_video_file_size"
        pure $ ScopeAutosaveSettings
          { autosave_photos     = autosave_photos_
          , autosave_videos     = autosave_videos_
          , max_video_file_size = max_video_file_size_
          }
  parseJSON _ = mempty

instance AT.ToJSON ScopeAutosaveSettings where
  toJSON ScopeAutosaveSettings
    { autosave_photos     = autosave_photos_
    , autosave_videos     = autosave_videos_
    , max_video_file_size = max_video_file_size_
    }
      = A.object
        [ "@type"               A..= AT.String "scopeAutosaveSettings"
        , "autosave_photos"     A..= autosave_photos_
        , "autosave_videos"     A..= autosave_videos_
        , "max_video_file_size" A..= max_video_file_size_
        ]

defaultScopeAutosaveSettings :: ScopeAutosaveSettings
defaultScopeAutosaveSettings =
  ScopeAutosaveSettings
    { autosave_photos     = Nothing
    , autosave_videos     = Nothing
    , max_video_file_size = Nothing
    }

