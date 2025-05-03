module TD.Data.GroupCallJoinParameters
  ( GroupCallJoinParameters(..)    
  , defaultGroupCallJoinParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GroupCallJoinParameters
  = GroupCallJoinParameters -- ^ Describes parameters used to join a group call
    { audio_source_id     :: Maybe Int    -- ^ Audio channel synchronization source identifier; received from tgcalls
    , payload             :: Maybe T.Text -- ^ Group call join payload; received from tgcalls
    , is_muted            :: Maybe Bool   -- ^ Pass true to join the call with muted microphone
    , is_my_video_enabled :: Maybe Bool   -- ^ Pass true if the user's video is enabled
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallJoinParameters where
  shortShow GroupCallJoinParameters
    { audio_source_id     = audio_source_id_
    , payload             = payload_
    , is_muted            = is_muted_
    , is_my_video_enabled = is_my_video_enabled_
    }
      = "GroupCallJoinParameters"
        ++ I.cc
        [ "audio_source_id"     `I.p` audio_source_id_
        , "payload"             `I.p` payload_
        , "is_muted"            `I.p` is_muted_
        , "is_my_video_enabled" `I.p` is_my_video_enabled_
        ]

instance AT.FromJSON GroupCallJoinParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallJoinParameters" -> parseGroupCallJoinParameters v
      _                         -> mempty
    
    where
      parseGroupCallJoinParameters :: A.Value -> AT.Parser GroupCallJoinParameters
      parseGroupCallJoinParameters = A.withObject "GroupCallJoinParameters" $ \o -> do
        audio_source_id_     <- o A..:?  "audio_source_id"
        payload_             <- o A..:?  "payload"
        is_muted_            <- o A..:?  "is_muted"
        is_my_video_enabled_ <- o A..:?  "is_my_video_enabled"
        pure $ GroupCallJoinParameters
          { audio_source_id     = audio_source_id_
          , payload             = payload_
          , is_muted            = is_muted_
          , is_my_video_enabled = is_my_video_enabled_
          }
  parseJSON _ = mempty

instance AT.ToJSON GroupCallJoinParameters where
  toJSON GroupCallJoinParameters
    { audio_source_id     = audio_source_id_
    , payload             = payload_
    , is_muted            = is_muted_
    , is_my_video_enabled = is_my_video_enabled_
    }
      = A.object
        [ "@type"               A..= AT.String "groupCallJoinParameters"
        , "audio_source_id"     A..= audio_source_id_
        , "payload"             A..= payload_
        , "is_muted"            A..= is_muted_
        , "is_my_video_enabled" A..= is_my_video_enabled_
        ]

defaultGroupCallJoinParameters :: GroupCallJoinParameters
defaultGroupCallJoinParameters =
  GroupCallJoinParameters
    { audio_source_id     = Nothing
    , payload             = Nothing
    , is_muted            = Nothing
    , is_my_video_enabled = Nothing
    }

