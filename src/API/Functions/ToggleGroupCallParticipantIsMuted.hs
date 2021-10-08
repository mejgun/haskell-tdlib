-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallParticipantIsMuted where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
-- 
-- __group_call_id__ Group call identifier
-- 
-- __participant_id__ Participant identifier
-- 
-- __is_muted__ Pass true if the user must be muted and false otherwise
data ToggleGroupCallParticipantIsMuted = 

 ToggleGroupCallParticipantIsMuted { is_muted :: Maybe Bool, participant_id :: Maybe MessageSender.MessageSender, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallParticipantIsMuted where
 show ToggleGroupCallParticipantIsMuted { is_muted=is_muted, participant_id=participant_id, group_call_id=group_call_id } =
  "ToggleGroupCallParticipantIsMuted" ++ cc [p "is_muted" is_muted, p "participant_id" participant_id, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleGroupCallParticipantIsMuted where
 toJSON ToggleGroupCallParticipantIsMuted { is_muted = is_muted, participant_id = participant_id, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallParticipantIsMuted", "is_muted" A..= is_muted, "participant_id" A..= participant_id, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallParticipantIsMuted where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallParticipantIsMuted" -> parseToggleGroupCallParticipantIsMuted v
   _ -> mempty
  where
   parseToggleGroupCallParticipantIsMuted :: A.Value -> T.Parser ToggleGroupCallParticipantIsMuted
   parseToggleGroupCallParticipantIsMuted = A.withObject "ToggleGroupCallParticipantIsMuted" $ \o -> do
    is_muted <- o A..:? "is_muted"
    participant_id <- o A..:? "participant_id"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallParticipantIsMuted { is_muted = is_muted, participant_id = participant_id, group_call_id = group_call_id }
 parseJSON _ = mempty
