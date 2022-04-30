-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallParticipantIsHandRaised where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Toggles whether a group call participant hand is rased
-- 
-- __group_call_id__ Group call identifier
-- 
-- __participant_id__ Participant identifier
-- 
-- __is_hand_raised__ Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed group call flag to lower other's hand
data ToggleGroupCallParticipantIsHandRaised = 

 ToggleGroupCallParticipantIsHandRaised { is_hand_raised :: Maybe Bool, participant_id :: Maybe MessageSender.MessageSender, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallParticipantIsHandRaised where
 show ToggleGroupCallParticipantIsHandRaised { is_hand_raised=is_hand_raised, participant_id=participant_id, group_call_id=group_call_id } =
  "ToggleGroupCallParticipantIsHandRaised" ++ U.cc [U.p "is_hand_raised" is_hand_raised, U.p "participant_id" participant_id, U.p "group_call_id" group_call_id ]

instance T.ToJSON ToggleGroupCallParticipantIsHandRaised where
 toJSON ToggleGroupCallParticipantIsHandRaised { is_hand_raised = is_hand_raised, participant_id = participant_id, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallParticipantIsHandRaised", "is_hand_raised" A..= is_hand_raised, "participant_id" A..= participant_id, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallParticipantIsHandRaised where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallParticipantIsHandRaised" -> parseToggleGroupCallParticipantIsHandRaised v
   _ -> mempty
  where
   parseToggleGroupCallParticipantIsHandRaised :: A.Value -> T.Parser ToggleGroupCallParticipantIsHandRaised
   parseToggleGroupCallParticipantIsHandRaised = A.withObject "ToggleGroupCallParticipantIsHandRaised" $ \o -> do
    is_hand_raised <- o A..:? "is_hand_raised"
    participant_id <- o A..:? "participant_id"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallParticipantIsHandRaised { is_hand_raised = is_hand_raised, participant_id = participant_id, group_call_id = group_call_id }
 parseJSON _ = mempty
