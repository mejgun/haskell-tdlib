-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallParticipantVideoInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.GroupCallVideoSourceGroup as GroupCallVideoSourceGroup

-- |
-- 
-- Contains information about a group call participant's video channel 
-- 
-- __source_groups__ List of synchronization source groups of the video
-- 
-- __endpoint_id__ Video channel endpoint identifier
-- 
-- __is_paused__ True if the video is paused. This flag needs to be ignored, if new video frames are received
data GroupCallParticipantVideoInfo = 

 GroupCallParticipantVideoInfo { is_paused :: Maybe Bool, endpoint_id :: Maybe String, source_groups :: Maybe [GroupCallVideoSourceGroup.GroupCallVideoSourceGroup] }  deriving (Show, Eq)

instance T.ToJSON GroupCallParticipantVideoInfo where
 toJSON (GroupCallParticipantVideoInfo { is_paused = is_paused, endpoint_id = endpoint_id, source_groups = source_groups }) =
  A.object [ "@type" A..= T.String "groupCallParticipantVideoInfo", "is_paused" A..= is_paused, "endpoint_id" A..= endpoint_id, "source_groups" A..= source_groups ]

instance T.FromJSON GroupCallParticipantVideoInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallParticipantVideoInfo" -> parseGroupCallParticipantVideoInfo v
   _ -> mempty
  where
   parseGroupCallParticipantVideoInfo :: A.Value -> T.Parser GroupCallParticipantVideoInfo
   parseGroupCallParticipantVideoInfo = A.withObject "GroupCallParticipantVideoInfo" $ \o -> do
    is_paused <- o A..:? "is_paused"
    endpoint_id <- o A..:? "endpoint_id"
    source_groups <- o A..:? "source_groups"
    return $ GroupCallParticipantVideoInfo { is_paused = is_paused, endpoint_id = endpoint_id, source_groups = source_groups }