{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.GroupCallParticipantVideoInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.GroupCallVideoSourceGroup as GroupCallVideoSourceGroup
import qualified Utils as U

data GroupCallParticipantVideoInfo = -- | Contains information about a group call participant's video channel @source_groups List of synchronization source groups of the video @endpoint_id Video channel endpoint identifier
  GroupCallParticipantVideoInfo
  { -- | True if the video is paused. This flag needs to be ignored, if new video frames are received
    is_paused :: Maybe Bool,
    -- |
    endpoint_id :: Maybe String,
    -- |
    source_groups :: Maybe [GroupCallVideoSourceGroup.GroupCallVideoSourceGroup]
  }
  deriving (Eq)

instance Show GroupCallParticipantVideoInfo where
  show
    GroupCallParticipantVideoInfo
      { is_paused = is_paused,
        endpoint_id = endpoint_id,
        source_groups = source_groups
      } =
      "GroupCallParticipantVideoInfo"
        ++ U.cc
          [ U.p "is_paused" is_paused,
            U.p "endpoint_id" endpoint_id,
            U.p "source_groups" source_groups
          ]

instance T.FromJSON GroupCallParticipantVideoInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallParticipantVideoInfo" -> parseGroupCallParticipantVideoInfo v
      _ -> fail ""
    where
      parseGroupCallParticipantVideoInfo :: A.Value -> T.Parser GroupCallParticipantVideoInfo
      parseGroupCallParticipantVideoInfo = A.withObject "GroupCallParticipantVideoInfo" $ \o -> do
        is_paused_ <- o A..:? "is_paused"
        endpoint_id_ <- o A..:? "endpoint_id"
        source_groups_ <- o A..:? "source_groups"
        return $ GroupCallParticipantVideoInfo {is_paused = is_paused_, endpoint_id = endpoint_id_, source_groups = source_groups_}
  parseJSON _ = fail ""

instance T.ToJSON GroupCallParticipantVideoInfo where
  toJSON
    GroupCallParticipantVideoInfo
      { is_paused = is_paused,
        endpoint_id = endpoint_id,
        source_groups = source_groups
      } =
      A.object
        [ "@type" A..= T.String "groupCallParticipantVideoInfo",
          "is_paused" A..= is_paused,
          "endpoint_id" A..= endpoint_id,
          "source_groups" A..= source_groups
        ]
