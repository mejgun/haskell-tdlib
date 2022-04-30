-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetGroupCallParticipantVolumeLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level
-- 
-- __group_call_id__ Group call identifier
-- 
-- __participant_id__ Participant identifier
-- 
-- __volume_level__ New participant's volume level; 1-20000 in hundreds of percents
data SetGroupCallParticipantVolumeLevel = 

 SetGroupCallParticipantVolumeLevel { volume_level :: Maybe Int, participant_id :: Maybe MessageSender.MessageSender, group_call_id :: Maybe Int }  deriving (Eq)

instance Show SetGroupCallParticipantVolumeLevel where
 show SetGroupCallParticipantVolumeLevel { volume_level=volume_level, participant_id=participant_id, group_call_id=group_call_id } =
  "SetGroupCallParticipantVolumeLevel" ++ U.cc [U.p "volume_level" volume_level, U.p "participant_id" participant_id, U.p "group_call_id" group_call_id ]

instance T.ToJSON SetGroupCallParticipantVolumeLevel where
 toJSON SetGroupCallParticipantVolumeLevel { volume_level = volume_level, participant_id = participant_id, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "setGroupCallParticipantVolumeLevel", "volume_level" A..= volume_level, "participant_id" A..= participant_id, "group_call_id" A..= group_call_id ]

instance T.FromJSON SetGroupCallParticipantVolumeLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setGroupCallParticipantVolumeLevel" -> parseSetGroupCallParticipantVolumeLevel v
   _ -> mempty
  where
   parseSetGroupCallParticipantVolumeLevel :: A.Value -> T.Parser SetGroupCallParticipantVolumeLevel
   parseSetGroupCallParticipantVolumeLevel = A.withObject "SetGroupCallParticipantVolumeLevel" $ \o -> do
    volume_level <- mconcat [ o A..:? "volume_level", readMaybe <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    participant_id <- o A..:? "participant_id"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetGroupCallParticipantVolumeLevel { volume_level = volume_level, participant_id = participant_id, group_call_id = group_call_id }
 parseJSON _ = mempty
