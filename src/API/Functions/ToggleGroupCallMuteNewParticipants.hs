-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallMuteNewParticipants where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_toggle_mute_new_participants group call flag
-- 
-- __group_call_id__ Group call identifier
-- 
-- __mute_new_participants__ New value of the mute_new_participants setting
data ToggleGroupCallMuteNewParticipants = 

 ToggleGroupCallMuteNewParticipants { mute_new_participants :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallMuteNewParticipants where
 show ToggleGroupCallMuteNewParticipants { mute_new_participants=mute_new_participants, group_call_id=group_call_id } =
  "ToggleGroupCallMuteNewParticipants" ++ U.cc [U.p "mute_new_participants" mute_new_participants, U.p "group_call_id" group_call_id ]

instance T.ToJSON ToggleGroupCallMuteNewParticipants where
 toJSON ToggleGroupCallMuteNewParticipants { mute_new_participants = mute_new_participants, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallMuteNewParticipants", "mute_new_participants" A..= mute_new_participants, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallMuteNewParticipants where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallMuteNewParticipants" -> parseToggleGroupCallMuteNewParticipants v
   _ -> mempty
  where
   parseToggleGroupCallMuteNewParticipants :: A.Value -> T.Parser ToggleGroupCallMuteNewParticipants
   parseToggleGroupCallMuteNewParticipants = A.withObject "ToggleGroupCallMuteNewParticipants" $ \o -> do
    mute_new_participants <- o A..:? "mute_new_participants"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallMuteNewParticipants { mute_new_participants = mute_new_participants, group_call_id = group_call_id }
 parseJSON _ = mempty
