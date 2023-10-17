module TD.Data.GroupCallParticipantVideoInfo
  (GroupCallParticipantVideoInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallVideoSourceGroup as GroupCallVideoSourceGroup
import qualified Data.Text as T

data GroupCallParticipantVideoInfo
  = GroupCallParticipantVideoInfo -- ^ Contains information about a group call participant's video channel
    { source_groups :: Maybe [GroupCallVideoSourceGroup.GroupCallVideoSourceGroup] -- ^ List of synchronization source groups of the video
    , endpoint_id   :: Maybe T.Text                                                -- ^ Video channel endpoint identifier
    , is_paused     :: Maybe Bool                                                  -- ^ True, if the video is paused. This flag needs to be ignored, if new video frames are received
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallParticipantVideoInfo where
  shortShow GroupCallParticipantVideoInfo
    { source_groups = source_groups_
    , endpoint_id   = endpoint_id_
    , is_paused     = is_paused_
    }
      = "GroupCallParticipantVideoInfo"
        ++ I.cc
        [ "source_groups" `I.p` source_groups_
        , "endpoint_id"   `I.p` endpoint_id_
        , "is_paused"     `I.p` is_paused_
        ]

instance AT.FromJSON GroupCallParticipantVideoInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallParticipantVideoInfo" -> parseGroupCallParticipantVideoInfo v
      _                               -> mempty
    
    where
      parseGroupCallParticipantVideoInfo :: A.Value -> AT.Parser GroupCallParticipantVideoInfo
      parseGroupCallParticipantVideoInfo = A.withObject "GroupCallParticipantVideoInfo" $ \o -> do
        source_groups_ <- o A..:?  "source_groups"
        endpoint_id_   <- o A..:?  "endpoint_id"
        is_paused_     <- o A..:?  "is_paused"
        pure $ GroupCallParticipantVideoInfo
          { source_groups = source_groups_
          , endpoint_id   = endpoint_id_
          , is_paused     = is_paused_
          }
  parseJSON _ = mempty

